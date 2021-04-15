package tests.sax;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter; 
import java.util.Date;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

public class SAXWriterTest {

  public static void main(String[] args) {
    System.out.println(SAXWriterTest.class.getSimpleName() + " BEGIN");

    SAXParserFactory factory = SAXParserFactory.newInstance();
    factory.setValidating(true);
    SAXParser saxParser;
    String xmlFilesDir = "xmlfiles/";
    String inFile = xmlFilesDir + "CourseCatalog.xml";
    String outFile = xmlFilesDir + "CourseCatalog_SAX_out.xml";
    try {
      saxParser = factory.newSAXParser();
      File file = new File(inFile);
      File out = new File(outFile);
      SAXWriteElementsHandler writeHandler = new SAXWriteElementsHandler();

      PrintWriter printWriter = new PrintWriter(out);
      writeHandler.setWriter(printWriter);
      saxParser.parse(file, writeHandler);

    } catch (Throwable e) {
      System.out.println("Exception Type: " + e.getClass().toString());
      System.out.println("Exception Message: " + e.getMessage());
      e.printStackTrace();
    }
    System.out.println("A new file was created in " + outFile);

    System.out.println(SAXWriterTest.class.getSimpleName() + " END");
  }
}
