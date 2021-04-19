package sax;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import java.io.PrintWriter;

public class BookHandler extends DefaultHandler {
    private static final float DOLLAR_TO_EURO = 1.10f;
    PrintWriter writer;
    StringBuilder blanks = new StringBuilder();
    StringBuilder allElements = new StringBuilder();
    String currentElement;
    String currentTag;
    boolean currentIsEmpty = true;
    int oldLength;
    int emptyElements = 0;
    boolean currentIsDollar = false;

    public BookHandler(PrintWriter writer) {
        this.writer = writer;
    }

    @Override
    public void startDocument() throws SAXException {
        EasyProfiler.StartTimeProfiling();
        EasyProfiler.StartMemoryProfiling();
    }

    @Override
    public void endDocument() throws SAXException {
        writer.write(allElements.toString());
        writer.flush();
        writer.close();
        EasyProfiler.StopTimeProfiling();
        EasyProfiler.StopMemoryProfiling();
        System.out.println("Duration: " + EasyProfiler.Difference() + "ms");
        System.out.println("Memory Usage: " + EasyProfiler.MemoryUsageInMB() + "mb");
    }

    @Override
    public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
        currentTag = qName;
        currentIsEmpty = true;
        StringBuilder attributeBuilder = new StringBuilder();
        currentIsEmpty = attributes.getLength() == 0;
        currentIsDollar = false;
        for (int i = 0; i < attributes.getLength(); i++) {
            String value = attributes.getValue(i);
            if (qName.equals("Preis")
                    && attributes.getQName(i).equals("waehrung")
                    && value.equals("Dollar")) {
                currentIsDollar = true;
                value = "Euro";
            }
            attributeBuilder.append(attributes.getQName(i))
                    .append("=\"")
                    .append(value)
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
        if (currentTag.equals("Preis")) {
            float price = Float.parseFloat(c);
            c = String.valueOf(price / DOLLAR_TO_EURO);
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
