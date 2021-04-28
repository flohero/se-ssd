package dom;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;
import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;

public class Book {

    private static final String XMLFILES = "xmlfiles/";
    private static final String ISBN = "ISBN";
    private static final String ISBN_PREFIX = "ISBN:";
    private static final float DOLLAR_TO_EURO = 1.10f;
    private static final String EURO = "Euro";
    private static final String DOLLAR = "Dollar";
    private static final String STATISTIK = "Statistik";
    private static final String LEERE_ELEMENTE = "leereElemente";
    private static final String WAEHRUNG = "waehrung";

    public static void main(String... args) {
        EasyProfiler.StartTimeProfiling();
        EasyProfiler.StartMemoryProfiling();
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        try {
            DocumentBuilder builder = factory.newDocumentBuilder();
            builder.setErrorHandler(new DOMErrorHandler());
            int entries = 10000;
            File inFile = new File(XMLFILES + "book" + entries + ".xml");
            File outFile = new File(XMLFILES + "book" + entries + "out.xml");

            Document doc = builder.parse(inFile);

            // Remove and count empty nodes
            int count = removeEmptyNodes(doc.getDocumentElement());

            // Remove ISBN prefix
            NodeList isbn = doc.getElementsByTagName(ISBN);
            for (int i = 0; i < isbn.getLength(); i++) {
                final Node item = isbn.item(i);
                item.setTextContent(item.getTextContent().replace(ISBN_PREFIX, ""));
            }

            XPathFactory xPathFactory = XPathFactory.newInstance();
            XPath xPath = xPathFactory.newXPath();

            NodeList prices = (NodeList) xPath
                    .compile("//Preis[@waehrung = 'Dollar']")
                    .evaluate(doc, XPathConstants.NODESET);

            // Convert Dollars to Euros
            for (int i = 0; i < prices.getLength(); i++) {
                Node price = prices.item(i);
                Node attr = price.getAttributes().getNamedItem(WAEHRUNG);
                if (DOLLAR.equals(attr.getTextContent())) {
                    attr.setTextContent(EURO);
                    float dollar = Float.parseFloat(price.getTextContent());
                    float euro = dollar / DOLLAR_TO_EURO;
                    price.setTextContent(new DecimalFormat("#.##").format(euro));
                }
            }

            Element statistics = doc.createElement(STATISTIK);
            Element leereElemente = doc.createElement(LEERE_ELEMENTE);

            leereElemente.appendChild(doc.createTextNode("" + count));
            statistics.appendChild(leereElemente);
            doc.getDocumentElement()
                    .appendChild(statistics);

            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = transformerFactory.newTransformer();
            transformer.setOutputProperty("doctype-system", "books.dtd");
            transformer.setOutputProperty("indent", "yes");
            transformer.transform(new DOMSource(doc), new StreamResult(outFile));
        } catch (ParserConfigurationException | IOException | SAXException | TransformerException | XPathExpressionException e) {
            e.printStackTrace();
        }
        EasyProfiler.StopMemoryProfiling();
        EasyProfiler.StopTimeProfiling();
        System.out.println("Duration: " + EasyProfiler.Difference() + "ms");
        System.out.println("Memory Usage: " + EasyProfiler.MemoryUsageInMB() + "mb");

    }

    public static int removeEmptyNodes(Node node) {
        if (node == null) {
            return 0;
        }
        int count = 0;
        NodeList list = node.getChildNodes();
        for (int i = 0; i < list.getLength(); i++) {
            count += removeEmptyNodes(list.item(i));
        }
        if ((node.getNodeType() == Node.ELEMENT_NODE && !node.hasChildNodes()
                || node.getNodeType() == Node.ELEMENT_NODE && node.getTextContent().trim().isEmpty())
                && !node.hasAttributes()) {
            node.getParentNode().removeChild(node);
            count++;
        }
        return count;
    }
}
