package tests.stax.iteratorapi;

import tests.stax.StAXTestsBase;

import javax.xml.stream.XMLEventReader;
import javax.xml.stream.XMLEventWriter;
import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLStreamConstants;
import javax.xml.stream.events.Attribute;
import javax.xml.stream.events.XMLEvent;
import java.io.FileReader;
import java.util.Iterator;

// Import for StAX

/**
 * resources for StAX:
 * https://docs.oracle.com/javase/tutorial/jaxp/stax/why.html (Why StAX?)
 * https://docs.oracle.com/javase/tutorial/jaxp/stax/api.html (StAX API)
 * <p>
 * Iterator API (XMLEventReader, XMLEventWriter): The Iterator API represents an
 * XML document stream as a set of discrete event objects. These events are
 * _pulled_ by the application and provided by the parser in the order in which
 * they are read in the XML source document. Primary parser interface:
 *
 * @author Julian Haslinger (P22080)
 * @version 1.0
 * @see XMLEvent Base iterator interface
 * @see XMLEventReader nextEvent(), hasNext(), peek()
 * @see XMLEventWriter flush(), close(), add(XMLEvent e), add(Attribute
 * attribute)
 */
public class StAXIteratorTests extends StAXTestsBase {
    public static void main(String[] args) {
        XMLInputFactory factory = XMLInputFactory.newInstance();
        XMLEventReader eventReader = null; // XMLEventReader (Iterator API)

        try {
            eventReader = factory.createXMLEventReader(new FileReader("xmlfiles/CourseCatalog.xml"));

            while (eventReader.hasNext()) {
                // as long as there are events, fetch them and analyze their event type
                XMLEvent event = eventReader.nextEvent();

                if (event.getEventType() == XMLStreamConstants.START_ELEMENT) {
                    if ("Course".equals(event.asStartElement().getName().toString())) {
                        System.out.println("*****************************************************"); // "new line" for each course
                    }
                    System.out.println("\t-->Element Name: " + event.asStartElement().getName());

                    // Get all iterators
                    Iterator<Attribute> attributes = event.asStartElement().getAttributes();
                    if (attributes.hasNext()) {
                        System.out.println("\t\t ==> Attributes: ");
                    }
                    while (attributes.hasNext()) {
                        Attribute myAttribute = attributes.next();
                        System.out.println("\t\t\t" + myAttribute.getName() + " / " + myAttribute.getValue());

                    }

                    XMLEvent nextEvent = eventReader.peek();
                    if (nextEvent.isCharacters()) {
                        String eventCharacters = eventReader.nextEvent().asCharacters().getData();
                        if (!eventCharacters.isEmpty()) {
                            System.out.println("\t\t***Element Text: " + eventCharacters);
                        }
                    }
                }
            }
        } catch (Throwable e) {
            System.out.println("Exception Type: " + e.getClass().toString());
            System.out.println("Exception Message: " + e.getMessage());
            e.printStackTrace();
        }
    }
}