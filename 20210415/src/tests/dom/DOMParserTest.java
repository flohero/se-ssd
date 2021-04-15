package tests.dom;

import org.w3c.dom.*;
import org.xml.sax.ErrorHandler;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;

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
        // TODO
        /*
         * By default, parsers won't validate documents. Set this to true to turn on
         * validation against DTD
         */
        // TODO
        /*
         * Determines whether whitespace within element contents will be ignored. The
         * default value is false
         */
        // TODO
        /*
         * Determines whether external entity references will be expanded. If true, the
         * external data will be inserted into the document. The default value is true
         */
        // TODO
        /*
         * Determines whether comments within the file will be ignored. The default
         * value is false
         */
        // TODO

        try {
            /*
             * Get a new DocumentBuilder. The DocumentBuilder will do the actual parsing to
             * create the Document object
             */
            // TODO

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
            /*
            builder.setErrorHandler(new ErrorHandler() {
                @Override
                public void fatalError(SAXParseException spe) throws SAXException {
                    System.out.println("[Fatal Error] " + spe.getSystemId() + ", Line " + spe.getLineNumber() + ": "
                            + spe.getLocalizedMessage());
                    throw spe;
                }
                @Override
                public void error(SAXParseException spe) throws SAXParseException {
                    System.out.println(
                            "[Error] " + spe.getSystemId() + ", Line " + spe.getLineNumber() + ": " + spe.getLocalizedMessage());
                    throw spe;
                }
                @Override
                public void warning(SAXParseException spe) throws SAXParseException {
                    System.out.println(
                            "[Warning] " + spe.getSystemId() + ", Line " + spe.getLineNumber() + ": " + spe.getLocalizedMessage());
                }
            });
           */

            // TODO Consider Try/Catch
            File file = new File("xmlfiles/CourseCatalog.xml");
            /*
             * Parse the xml file and create the document Document allows direct access to
             * the child node that is the document element of the document.
             */
            // TODO
            // root element
            // TODO


            System.out.println("All attributes for element 'CourseCatalog': ");
            // TODO

            // Will get the CourseCatalog child entries
            // TODO

            System.out.println("***** getElementsByTagName() *****");
            // TODO
            System.out.println("*************************************************************************************");

            // TODO use some XPath here

            // EXTRA: Get Type if Course with ID cID8314
            // TODO

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
