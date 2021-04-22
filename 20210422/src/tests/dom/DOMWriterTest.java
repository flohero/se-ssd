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

// Generates a "Course Catalog" XML file with one course 

public class DOMWriterTest {

    public static void main(String[] args) {
        System.out.println("DOMWriterTest BEGIN");
        // TODO create factory
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        try {
            // TODO create document builder and new document
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document doc = builder.newDocument();

            // TODO Create new courseCatalog element with some attributes
            Element courseCatalog = doc.createElement("CourseCatalog");
            courseCatalog.setAttribute("year", "2021");
            courseCatalog.setAttribute("campus", "Hagenberg");
            courseCatalog.setAttribute("term", "summer");

            // TODO Append element to document
            doc.appendChild(courseCatalog);


            // TODO create comment with date and time and add it to the document
            doc.appendChild(doc.createComment("Date and Time: " + (new Date()).toString()));


            // TODO create degree programme element
            Element degreeProgramElement = doc.createElement("DegreeProgramme");
            degreeProgramElement.setAttribute("code", "0307");
            degreeProgramElement.setAttribute("name", "Software Engineering");

            // TODO add the new element to the courseCatalog
            courseCatalog.appendChild(degreeProgramElement);

            // TODO Create new Course element and append to degree programme
            // <Course id = 'cID8314' semesterHours='1' semester='4'>SSD4</Course>
            Element course = doc.createElement("Course");
            course.setAttribute("id", "cID8314");
            course.setAttribute("semesterHours", "1");
            course.setAttribute("semester", "4");
            course.appendChild(doc.createTextNode("SSD4"));
            degreeProgramElement.appendChild(course);

            // TODO Description element (mixed content)


            // TODO create credit element (e.g. 1 ECTS)


            // TODO course type element


            //Serialize the DOM to the given file (the output xml file might not be valid according to given DTD)
            String fileName = "CourseCatalog_DOMWriter_1.xml";
            File file = new File("xmlfiles/" + fileName);
            // TODO Use TransformerFactory and Transformer (with OutputProperty)
            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = transformerFactory.newTransformer();
            // TODO transform the source to the file
            transformer.setOutputProperty("doctype-system", "CourseCatalog.dtd");
            transformer.setOutputProperty("indent", "yes");
            transformer.transform(new DOMSource(doc), new StreamResult(file));

            System.out.println("New file was created in " + file.getAbsolutePath());

        } catch (Throwable e) {
            System.out.println("Exception Type: " + e.getClass().toString());
            System.out.println("Exception Message: " + e.getMessage());
            e.printStackTrace();
        }
        System.out.println("DOMWriterTest END");

    }
}
