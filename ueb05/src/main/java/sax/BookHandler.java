package sax;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import java.io.PrintWriter;

public class BookHandler extends DefaultHandler {
    PrintWriter writer;
    StringBuilder blanks = new StringBuilder();
    StringBuilder allElements = new StringBuilder();
    String currentElement;
    String currentTag;
    boolean currentIsEmpty = true;
    int oldLength;
    int emptyElements = 0;
    long startTime = 0;

    public BookHandler(PrintWriter writer) {
        this.writer = writer;
    }

    @Override
    public void startDocument() throws SAXException {
        startTime = System.currentTimeMillis();
    }

    @Override
    public void endDocument() throws SAXException {
        writer.write(allElements.toString());
        writer.flush();
        writer.close();
        long endTime = System.currentTimeMillis();
        System.out.println("Duration: " + (endTime - startTime) + "ms");
    }

    @Override
    public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
        currentTag = qName;
        currentIsEmpty = true;
        StringBuilder attributeBuilder = new StringBuilder();
        currentIsEmpty = attributes.getLength() == 0;
        for (int i = 0; i < attributes.getLength(); i++) {
            attributeBuilder.append(attributes.getQName(i))
                    .append("=\"")
                    .append(attributes.getValue(i))
                    .append("\"")
                    .append(" ");
        }
        StringBuilder currElementBuilder = new StringBuilder();
        currElementBuilder
                .append(blanks)
                .append("<")
                .append(qName)
                .append(" ")
                .append(attributeBuilder)
                .append(">\n");

        currentElement = currElementBuilder.toString();
        allElements.append(currElementBuilder);

        blanks.append("\t");
        oldLength = allElements.length();
    }

    @Override
    public void characters(char[] ch, int start, int length) throws SAXException {
        String c = new String(ch, start, length);
        if (currentTag.equals("ISBN") && c.startsWith("ISBN:")) {
            c = c.replace("ISBN:", "");
        }
        allElements
                .append(blanks)
                .append(c.replace("&", "&amp;"))
                .append("\n");
    }

    @Override
    public void endElement(String uri, String localName, String qName) throws SAXException {
        blanks.delete(0, 1);
        currentTag = null;

        if (allElements.length() == oldLength && currentIsEmpty) {
            emptyElements++;
            allElements.delete(allElements.length() - currentElement.length(), allElements.length());
            return;
        }
        if (qName.equals("Rechnungen")) {
            allElements
                    .append("<Statistik>")
                    .append("\n")
                    .append("<leereElemente>")
                    .append(emptyElements)
                    .append("</leereElemente>")
                    .append("\n")
                    .append("</Statistik>");
        }

        allElements
                .append(blanks)
                .append("</")
                .append(qName)
                .append(">")
                .append("\n");
    }

}
