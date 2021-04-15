package tests.sax;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException; 
import org.xml.sax.helpers.DefaultHandler;

public class SAXPrintElementsHandler extends DefaultHandler {
  @Override
  public void startDocument() throws SAXException {
    System.out.println("Start of document ------------------------");
  }

  @Override
  public void endDocument() throws SAXException {
    System.out.println("End of document --------------------------");
  }

  int depth = 0;
  StringBuffer blanks = new StringBuffer();

  @Override
  public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
    blanks.append("  ");
    depth++;
    System.out.println(depth + blanks.toString() + " - " + qName);
    for (int i = 0; i < attributes.getLength(); i++) {
      System.out.println(attributes.getQName(i) + " = " + attributes.getValue(i));
    }
  }

  @Override
  public void endElement(String uri, String localName, String qName) throws SAXException {
    depth--;
    blanks.delete(0, 2);
  }

  @Override
  public void characters(char[] ch, int start, int length) throws SAXException {
    String c = new String(ch, start, length);
    System.out.println(blanks.toString() + "  " + (depth + 1) + " - " + c);
  }

  //
  // ErrorHandler methods
  //

  //
  // Protected methods
  //

  /** Prints the error message. */
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
}