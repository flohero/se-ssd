package tests.stax.cursorapi;

import tests.stax.StAXTestsBase;

import java.io.FileReader;

import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLStreamConstants;
import javax.xml.stream.XMLStreamReader;
import javax.xml.stream.XMLStreamWriter;

/**
 * resources for StAX:
 * https://docs.oracle.com/javase/tutorial/jaxp/stax/why.html (Why StAX?)
 * https://docs.oracle.com/javase/tutorial/jaxp/stax/api.html (StAX API)
 * 
 * Cursor API (XMLStreamReader, XMLStreamWriter): the StAX cursor API represents
 * a cursor with which we can walk an XML document from the beginning to the
 * end. -> cursor can point to one thing at a time (always forward, never
 * backwards) - usually one XML InfoSet element at a time. 
 *
 * Main interfaces:
 * 
 * @see XMLStreamWriter writeStartElement(), writeEndElement(),
 *      writeCharacters()...
 * @see XMLStreamReader next(), hasNext(), getText(), getLocalName(),
 *      getNamespaceURI()...
 * 
 * @author Julian Haslinger (P22080)
 * 
 */
public class StAXCursorReadTests extends StAXTestsBase {

  public static void main(String[] args) {
    XMLInputFactory xmlInputFactory = XMLInputFactory.newInstance();
    try {

      // Create a new XMLStreamReader with the given file
      String xmlFileName = "xmlfiles/CourseCatalog.xml";
      XMLStreamReader xmlStreamReader = xmlInputFactory.createXMLStreamReader(new FileReader(xmlFileName));
      int event = xmlStreamReader.getEventType();

      // As long as there are new events, process them
      while (true) {
        switch (event) {
        case XMLStreamConstants.START_ELEMENT:
          System.out.println(xmlStreamReader.getLocalName());
          for (int i = 0; i < xmlStreamReader.getAttributeCount(); i++) {
            System.out.println("\tAttribute: " + xmlStreamReader.getAttributeName(i) + ", Value: "
                + xmlStreamReader.getAttributeValue(i));
          }
          break;
        case XMLStreamConstants.START_DOCUMENT:
          System.out.println("Found new document start! \n************************ ");
          break;
        case XMLStreamConstants.ATTRIBUTE:
          break;
        case XMLStreamConstants.CDATA:
          break;
        case XMLStreamConstants.COMMENT:
          break;
        case XMLStreamConstants.DTD:
          break;
        case XMLStreamConstants.END_ELEMENT:
          break;
        case XMLStreamConstants.END_DOCUMENT:
          System.out.println("************************ \nEnd of Document!");
          break;
        case XMLStreamConstants.CHARACTERS:
          String elementText = xmlStreamReader.getText();
          if (!elementText.isEmpty()) {
            System.out.println("\tElement Text: " + elementText);
          }
          break;

        }
        if (!xmlStreamReader.hasNext())
          break;

        event = xmlStreamReader.next();
      }
    } catch (Throwable e) {
      System.out.println("Exception Type: " + e.getClass().toString());
      System.out.println("Exception Message: " + e.getMessage());
      e.printStackTrace();
    }
  }
}