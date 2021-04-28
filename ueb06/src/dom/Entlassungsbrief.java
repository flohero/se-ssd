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
import java.util.ArrayList;
import java.util.List;

public class Entlassungsbrief {
    private static final String XMLFILES = "xmlfiles/";

    public static void main(String... args) {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        factory.setNamespaceAware(true);
        factory.setValidating(true);
        factory.setAttribute("http://java.sun.com/xml/jaxp/properties/schemaLanguage", "http://www.w3.org/2001/XMLSchema");
        factory.setAttribute("http://java.sun.com/xml/jaxp/properties/schemaSource", "Entlassungsbrief.xsd");
        try {
            DocumentBuilder builder = factory.newDocumentBuilder();
            File inFile = new File(XMLFILES + "Entlassungsbrief.xml");
            Document entlassungsbriefDoc = builder.parse(inFile);
            Document summaryDoc = builder.newDocument();
            Element summary = summaryDoc.createElement("summary");
            summaryDoc.appendChild(summary);

            Element fullname = summaryDoc.createElement("fullname");
            summary.appendChild(fullname);

            XPathFactory xPathFactory = XPathFactory.newInstance();
            XPath xPath = xPathFactory.newXPath();
            xPath.setNamespaceContext(new NamespaceResolver(entlassungsbriefDoc));
            final String query = "//entl:Titel[@position='%s']";


            NodeList titlePre = (NodeList) xPath
                    .compile(String.format(query, "vor"))
                    .evaluate(entlassungsbriefDoc, XPathConstants.NODESET);
            List<String> titlesPreList = new ArrayList<>();
            for (int i = 0; i < titlePre.getLength(); i++) {
                titlesPreList.add(titlePre.item(i).getTextContent());
            }


            NodeList titlePost = (NodeList) xPath
                    .compile(String.format(query, "nach"))
                    .evaluate(entlassungsbriefDoc, XPathConstants.NODESET);
            List<String> titlesPostList = new ArrayList<>();
            for (int i = 0; i < titlePost.getLength(); i++) {
                titlesPostList.add(titlePost.item(i).getTextContent());
            }

            NodeList firstnames = entlassungsbriefDoc.getElementsByTagName("Vorname");
            List<String> firstnamesList = new ArrayList<>();
            for (int i = 0; i < firstnames.getLength(); i++) {
                firstnamesList.add(firstnames.item(i).getTextContent());
            }

            fullname.appendChild(
                    summaryDoc.createTextNode(
                            String.join(" ", titlesPreList)
                                    + (titlesPreList.isEmpty() ? "" : " ") + String.join(" ", firstnamesList)
                                    + " " + entlassungsbriefDoc.getElementsByTagName("Nachname").item(0).getTextContent()
                                    + (titlesPostList.isEmpty() ? "" : " ") + String.join(", ", titlesPostList)
                    )
            );

            // Copy Diagnoeses Node
            Node diagnoses = entlassungsbriefDoc.getElementsByTagName("Diagnosen").item(0);
            Node diagnosesClone = summaryDoc.importNode(diagnoses, true);
            summary.appendChild(diagnosesClone);

            // Rename diagnoses
            summaryDoc.renameNode(diagnosesClone, null, "diagnoses");

            // Rename Children of diagnoses
            NodeList diags = summaryDoc.getElementsByTagName("Diagnose");
            for (int i = 0; i < diags.getLength(); i++) {
                summaryDoc.renameNode(diags.item(i), null, "diag");
            }

            String fileName = "summary.xml";
            File file = new File(XMLFILES + fileName);
            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = transformerFactory.newTransformer();
            transformer.setOutputProperty("doctype-system", "summary.dtd");
            transformer.setOutputProperty("indent", "yes");
            transformer.transform(new DOMSource(summaryDoc), new StreamResult(file));
        } catch (ParserConfigurationException | SAXException | IOException | TransformerException | XPathExpressionException e) {
            e.printStackTrace();
        }
    }
}
