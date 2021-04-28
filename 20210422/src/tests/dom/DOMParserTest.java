package tests.dom;

import org.w3c.dom.*;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathFactory;
import java.io.File;

public class DOMParserTest {

    public static void main(String[] args) {
        System.out.println("DOMParserTest BEGIN");
        /* Get an instance of the DocumentBuilderFactory */
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        /*
         * By default, parsers won't validate documents. Set this to true to turn on
         * validation against DTD
         */
        factory.setValidating(true);
        /*
         * Determines whether whitespace within element contents will be ignored. The
         * default value is false
         */
        factory.setIgnoringElementContentWhitespace(true);
        /*
         * Determines whether external entity references will be expanded. If true, the
         * external data will be inserted into the document. The default value is true
         */
        factory.setExpandEntityReferences(false);
        /*
         * Determines whether comments within the file will be ignored. The default
         * value is false
         */
        factory.setIgnoringComments(false);

        try {
            /*
             * Get a new DocumentBuilder. The DocumentBuilder will do the actual parsing to
             * create the Document object
             */
            DocumentBuilder builder = factory.newDocumentBuilder();

            /* Determine feature availability of the parser (demo!) */
            /*
            DOMImplementation domImpl = builder.getDOMImplementation();
            String feature[]
                    = {"Core", "XML", "HTML", "Views", "Stylesheets", "CSS", "CSS2", "Events",
                    "UIEvents", "MouseEvents", "MutationEvents", "HTMLEvents", "Range",
                    "Traversal"};
            for (int i = 0; i < feature.length; i++) {
                System.out.print(feature[i]);
                if (!domImpl.hasFeature(feature[i], "2.0")) {
                    System.out.println(" not supported");
                } else {
                    System.out.println(" supported");
                }
            }
             */

            /* Specify the ErrorHandler to be used by the parser. */
            builder.setErrorHandler(new DOMErrorHandler());

            // TODO Consider Try/Catch
            File file = new File("xmlfiles/CourseCatalog.xml");
            /*
             * Parse the xml file and create the document Document allows direct access to
             * the child node that is the document element of the document.
             */
            Document doc = builder.parse(file);
            // root element
            Element courseCatalog = doc.getDocumentElement();

            Attr year = courseCatalog.getAttributeNode("year");

            System.out.println("All attributes for element 'CourseCatalog': " + year);
            for (int i = 0; i < courseCatalog.getAttributes().getLength(); i++) {
                Node attribute = courseCatalog.getAttributes().item(i);
                System.out.println("Attribute: " + attribute.getNodeName() + " = " + attribute.getNodeValue());

            }

            // Will retrieve the CourseCatalog child entries
            NodeList degreeProgrammeNodes = courseCatalog.getChildNodes();
            // Will retrieve the Degree Programme child entries


            System.out.println("All attributes for element 'CourseCatalog': " + year);

            System.out.println("***** getElementsByTagName() *****");

            for (int i = 0; i < degreeProgrammeNodes.getLength(); i++) {
                Element degreeProgramme = (Element) degreeProgrammeNodes.item(i);
                System.out.println("Node name degreeProgramme: " + degreeProgramme.getNodeName());

                NodeList courseNodes = degreeProgramme.getChildNodes();
                for (int j = 0; j < courseNodes.getLength(); j++) {
                    Element courseElement = (Element) courseNodes.item(j);

                    Node node = courseElement.getFirstChild();
                    System.out.println("Nodename: " + node.getNodeName() + ", value: " + node.getTextContent());

                    NodeList roomNodes = courseElement.getElementsByTagName("Room");
                    if (roomNodes.getLength() > 0) {
                        System.out.println("Room: " + roomNodes.item(0).getTextContent());
                    }
                }
            }

            System.out.println("*************************************************************************************");
            // using XPath
            XPathFactory xPathFactory = XPathFactory.newInstance();
            XPath xPath = xPathFactory.newXPath();
            // z.B. ID aller Kurse ausgeben, deren Raum in einem FH-Gebäude liegt (building beginnt mit 'FH')
            NodeList coursesInFh = (NodeList) xPath
                    .compile("//Course[starts-with(Room/@building, 'FH')]/@id")
                    .evaluate(doc, XPathConstants.NODESET);
            for (int i = 0; i < coursesInFh.getLength(); i++) {
                final Node node = coursesInFh.item(i);
                System.out.println(node.getTextContent());
            }
            // TODO get type of Course with ID cID8314

        } catch (Throwable e) {
            System.out.println("Exception Type: " + e.getClass().toString());
            System.out.println("Exception Message: " + e.getMessage());
            e.printStackTrace();
        }
        System.out.println("DOMParserTest END");
    }

    private static String printNodeType(short sNodeType) {
        switch (sNodeType) {
            case Node.ELEMENT_NODE:
                return "ELEMENT_NODE";
            case Node.ATTRIBUTE_NODE:
                return "ATTRIBUTE_NODE";
            case Node.TEXT_NODE:
                return "TEXT_NODE";
            case Node.CDATA_SECTION_NODE:
                return "CDATA_SECTION_NODE";
            case Node.ENTITY_REFERENCE_NODE:
                return "ENTITY_REFERENCE_NODE";
            case Node.ENTITY_NODE:
                return "ENTITY_NODE";
            case Node.PROCESSING_INSTRUCTION_NODE:
                return "PROCESSING_INSTRUCTION_NODE";
            case Node.COMMENT_NODE:
                return "COMMENT_NODE";
            case Node.DOCUMENT_NODE:
                return "DOCUMENT_NODE";
            case Node.DOCUMENT_TYPE_NODE:
                return "DOCUMENT_TYPE_NODE";
            case Node.DOCUMENT_FRAGMENT_NODE:
                return "DOCUMENT_FRAGMENT_NODE";
            case Node.NOTATION_NODE:
                return "NOTATION_NODE";
            default:
                return "Unknown type";
        }
    }
}
