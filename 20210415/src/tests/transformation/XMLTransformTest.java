package tests.transformation;

/*
 * There might be warnings when building / running the project
 * - Xerces might log this
 *  https://stackoverflow.com/questions/25453042/how-to-disable-accessexternaldtd-and-entityexpansionlimit-warnings-with-logback
 * java bugs already reported by the community:
 * 	http://bugs.java.com/view_bug.do?bug_id=8016153
 *  https://bugs.java.com/bugdatabase/view_bug.do?bug_id=8015487
 * 
 */
import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory; 
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import org.w3c.dom.Document;

public class XMLTransformTest {
  static String xmlFilesDir = "xmlfiles/";

  public static void main(String[] args) {
    System.out.println(XMLTransformTest.class.getSimpleName() + " BEGIN");

    DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
    factory.setValidating(true);
    factory.setIgnoringElementContentWhitespace(true);

    try {
      DocumentBuilder builder = factory.newDocumentBuilder();

      // TODO 1. create transformer with style sheet


      // TODO 2. create source


      // TODO 3. create target
      File outFile = new File(
          xmlFilesDir + "CourseCatalog_XSLT20.html");

      // TODO 4. transform
      System.out.println("A new file was created in " + outFile.getAbsolutePath());

    } catch (Throwable e) {
      System.out.println("Exception Type: " + e.getClass().toString());
      System.out.println("Exception Message: " + e.getMessage());
      e.printStackTrace();
    }
    System.out.println(XMLTransformTest.class.getSimpleName() + " END");

  }
}
