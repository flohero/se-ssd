package tests.sax;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;
import org.xml.sax.helpers.DefaultHandler;

public class SAXPrintElementsHandler extends DefaultHandler {

    private StringBuffer blanks = new StringBuffer(); // leading blanks
    private int depth = 0; // depth of node

    //
    // ContentHandler methods
    // API Doc: http://www.saxproject.org/apidoc/org/xml/sax/ContentHandler.html
    //
    @Override
    public void startDocument() throws SAXException {
        System.out.println("Start of document -----------------------------");
    }

    /*
     * namespaceURI: namespace descriptor or null
     * localName: local element name without prefix
     * qName: element name with namespace prefix (if present)
     * atts: all element attributes (in start tags)
     */
    @Override
    public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
        blanks.append("   "); // add 3 blanks
        depth++; // increase depth
        System.out.print(blanks.toString() + depth + " - " + qName + ": ");
        for (int i = 0; i < attributes.getLength(); i++) {
            System.out.print(attributes.getQName(i) + " = " + attributes.getValue(i) + "  ");
        }
        System.out.println();
    }

    @Override
    public void characters(char[] ch, int start, int length) throws SAXException {
        String s = new String(ch, start, length);
        // Enhancement: Show the blanks directly (wrapped into ' ')
        System.out.println(blanks.toString() + "   " + (depth + 1) + " - " + "'" + s + "'");
    }

    /*
     * namespaceURI: namespace descriptor or null
     * localName: local element name without prefix
     * qName: element name with namespace prefix (if present)
     */
    @Override
    public void endElement(String uri, String localName, String qName) throws SAXException {
        blanks.delete(0, 3); // delete 3 blanks
        depth--; // decrease depth
    }

    @Override
    public void endDocument() throws SAXException {
        System.out.println("End of document ------------------------------");
    }

    //
    // ErrorHandler methods
    // API Doc: http://www.saxproject.org/apidoc/org/xml/sax/ErrorHandler.html
    //
    /**
     * Warning.
     */
    @Override
    public void warning(SAXParseException ex) throws SAXException {
        printError("Warning", ex);
    }

    /**
     * Error.
     */
   /*
     Example: XML not valid (regarding a given DTD)
   */
    @Override
    public void error(SAXParseException ex) throws SAXException {
        printError("Error", ex);
    }

    /**
     * Fatal error.
     */
    /*
      Example: XML not well formed
    */
    @Override
    public void fatalError(SAXParseException ex) throws SAXException {
        printError("Fatal Error", ex);
    } // fatalError(SAXParseException)

    //
    // DTDHandler methods
    // API Doc: http://www.saxproject.org/apidoc/org/xml/sax/DTDHandler.html
    //
    @Override
    public void notationDecl(String name,
                             String publicId,
                             String systemId) {
        System.out.println("Notation Declaration: " + name + publicId + systemId);
    }

    @Override
    public void unparsedEntityDecl(String name, String publicId,
                                   String systemId, String notationName) {
        System.out.println("Unparsed Entity Declaration: " + name + publicId + systemId + notationName);
    }

    /**
     * Prints the error message.
     */
    protected void printError(String type, SAXParseException ex) {

        System.err.print("[");
        System.err.print(type);
        System.err.print("] ");
        if (ex == null) {
            System.err.println("!!!");
        }
        String systemId = ex.getSystemId();
        if (systemId != null) {
            int index = systemId.lastIndexOf('/');
            if (index != -1)
                systemId = systemId.substring(index + 1);
            System.err.print(systemId);
        }
        System.err.print(':');
        System.err.print(ex.getLineNumber());
        System.err.print(':');
        System.err.print(ex.getColumnNumber());
        System.err.print(": ");
        System.err.print(ex.getMessage());
        System.err.println();
        System.err.flush();
    } // printError(String,SAXParseException)
} // class SAXPrintElementsHandler