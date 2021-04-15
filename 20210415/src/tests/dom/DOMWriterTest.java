package tests.dom;

import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Document;
import org.w3c.dom.Element;

// Generates a valid "Course Catalog" XML file with one course 

public class DOMWriterTest {

  public static void main(String[] args) {
    System.out.println("DOMWriterTest BEGIN");
    // TODO create factory and document builder
    try {
      // TODO create new document

      // TODO Create new coursecatalog element with some elements

      // TODO Append element to document

      // TODO create comment and add it to the document

      // TODO create degreeprogramme element

      // TODO add the new element to the coursecatalog

      // TODO Create new Course element and append to degreeprogramme

      // TODO create new Title element, append text to it - append this element to a course

      // TODO Description element (mixed content)

      // TODO credit element

      // TODO course type element

      // TODO maybe create some other elements

      // TODO create comment and PI

      // TODO Serialize the DOM to the given file
      String fileName = "CourseCatalog_DOMWriter_1.xml";
      File file = new File("xmlfiles/" + fileName);
      TransformerFactory fact = TransformerFactory.newInstance();
      Transformer t = fact.newTransformer();
      t.setOutputProperty("doctype-system", "CourseCatalog.dtd");
      t.setOutputProperty("indent", "yes");
      // TODO transform the source to a file

      System.out.println("New file was created in " + file.getAbsolutePath());

    } catch (Throwable e) {
      System.out.println("Exception Type: " + e.getClass().toString());
      System.out.println("Exception Message: " + e.getMessage());
      e.printStackTrace();
    }
    System.out.println("DOMWriterTest END");

  }
}
