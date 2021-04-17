package tests.sax;

import java.io.PrintWriter;
import java.util.Date;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class SAXWriteElementsHandler extends DefaultHandler {

    PrintWriter writer = null;

    public void setWriter(PrintWriter writer) {
        this.writer = writer;
    }

    @Override
    public void startDocument() throws SAXException {

    }

    @Override
    public void endDocument() throws SAXException {
        writer.flush();
        writer.close();
    }

    StringBuffer blanks = new StringBuffer();

    @Override
    public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
        StringBuilder buffer = new StringBuilder();
        for (int i = 0; i < attributes.getLength(); i++) {
            buffer.append(attributes.getQName(i))
                    .append("=\"")
                    .append(attributes.getValue(i))
                    .append("\"")
                    .append(" ");
        }
        writer.println(blanks + "<" + qName + " " + buffer + ">");
        blanks.append("\t");
    }

    @Override
    public void characters(char[] ch, int start, int length) throws SAXException {
        String c = new String(ch, start, length);
        writer.println(blanks + c);
    }

    @Override
    public void ignorableWhitespace(char[] ch, int start, int length) throws SAXException {
        // do nothing
    }

    @Override
    public void endElement(String uri, String localName, String qName) throws SAXException {
        blanks.delete(0, 1);
        writer.println(blanks + "</" + qName + ">");
    }

} // class Writer
