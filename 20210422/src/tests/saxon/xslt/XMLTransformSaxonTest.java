package tests.saxon.xslt;

import org.w3c.dom.Document;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;

/**
 * You need to add this to your pom.xml file (Saxon Home Edition (HE) dependency): 
 * <!-- https://mvnrepository.com/artifact/net.sf.saxon/Saxon-HE --> 
 * <dependencies> 
 *   <dependency>
 *     <groupId>net.sf.saxon</groupId> 
 *     <artifactId>Saxon-HE</artifactId>
 *     <version>10.0</version>
 *   </dependency> 
 * </dependencies>
 * 
 * @author Julian Haslinger (P22080)
 * @version 1.0
 */
public class XMLTransformSaxonTest {
  static String xmlFilesDir = "xmlfiles/";

  public static void main(String[] args) {
    System.out.println(XMLTransformSaxonTest.class.getSimpleName() + " BEGIN");

    DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
    factory.setValidating(true);
    factory.setIgnoringElementContentWhitespace(true);

    try {
      DocumentBuilder builder = factory.newDocumentBuilder();

      // 1. create transformer factory (Saxon implementation for XSLT 2.0!)
      TransformerFactory transformerFactory = new net.sf.saxon.TransformerFactoryImpl();
      File styleSheetFile = new File(xmlFilesDir + "CourseCatalog.xslt");
      StreamSource styleSheet = new StreamSource(styleSheetFile);

      // 2. create transformer with stylesheet
      Transformer transformer = transformerFactory.newTransformer(styleSheet);
      System.out.println(transformer.getClass().toString());

      // 3. create source
      File inFile = new File(xmlFilesDir + "CourseCatalog.xml");
      Document doc = builder.parse(inFile);
      DOMSource source = new DOMSource(doc);

      // 4. create target
      File outFile = new File(
          xmlFilesDir + "CourseCatalog_Saxon_XSLT20_" + new Date().toString().replaceAll("[ :]", "_") + ".html");
      StreamResult result = new StreamResult(new FileOutputStream(outFile));

      // 5. transform
      transformer.transform(source, result);
      System.out.println("A new file was created in " + outFile.getAbsolutePath());
    } catch (Throwable e) {
      System.out.println("Exception Type: " + e.getClass().toString());
      System.out.println("Exception Message: " + e.getMessage());
      e.printStackTrace();
    }
    System.out.println(XMLTransformSaxonTest.class.getSimpleName() + " END");

  }
}
