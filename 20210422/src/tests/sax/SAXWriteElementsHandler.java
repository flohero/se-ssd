package tests.sax;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import java.io.PrintWriter;
import java.util.Date;

/**
 * Serializing an XML document with SAX
 *  -> very cumbersome and error-prone
 *  -> API Doc: http://www.saxproject.org/apidoc/
 *  -> SAX characters: https://xerces.apache.org/xerces2-j/faq-sax.html
 */
public class SAXWriteElementsHandler extends DefaultHandler {

    StringBuffer buffer;
    PrintWriter writer = null;

    public void setWriter(PrintWriter writer) {
        this.writer = writer;
    }

    @Override
    public void startDocument() throws SAXException {
        writer.println("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
        writer.println("<!DOCTYPE CourseCatalog SYSTEM \"CourseCatalog.dtd\">");
        writer.println("<!-- Date and Time: " + (new Date()).toString() + " -->");
    }

    @Override
    public void endDocument() throws SAXException {
        writer.flush();
        writer.close();
    }

    @Override
    public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
        writer.print("<" + qName);
        for (int i = 0; i < attributes.getLength(); i++) {
            writer.print(" " + attributes.getQName(i) + "=\"" + attributes.getValue(i) + "\"");
        }
        writer.print(">");

        // SAX doesn't always return the complete character stream between start and end element,
        // so we might need a string buffer here
        // BUT: This brings other implications, e.g. Text in elements allowing mixed content
        // buffer = new StringBuffer();
    }

    @Override
    public void characters(char[] ch, int start, int length) throws SAXException {
        // buffer.append(new String(ch, start, length)); // NEW
        String s = new String(ch, start, length);
        writer.print(s);
    }

    @Override
    public void ignorableWhitespace(char[] ch, int start, int length) throws SAXException {
        // do nothing
    }

    @Override
    public void endElement(String uri, String localName, String qName) throws SAXException {
        //writer.print(blanks.toString());
        //writer.print(buffer.toString());
        //buffer = new StringBuffer();
        writer.println("</" + qName + ">");
    }
} // class SAXWriteElementsHandler
