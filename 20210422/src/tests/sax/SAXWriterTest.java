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
    String xmlFilesDir = "xmlfiles/";
    String inFile = xmlFilesDir + "CourseCatalog.xml";
    String outFile = xmlFilesDir + "CourseCatalog_SAX_out_" + new Date().toString().replaceAll("[ :]", "_") + ".xml";
    try {
      SAXParser saxParser = factory.newSAXParser();

      File file = new File(inFile);
      SAXWriteElementsHandler writeHandler = new SAXWriteElementsHandler();

      OutputStream os = new FileOutputStream(new File(outFile));
      PrintWriter writer = new PrintWriter(os);
      writeHandler.setWriter(writer);
      // parse
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
