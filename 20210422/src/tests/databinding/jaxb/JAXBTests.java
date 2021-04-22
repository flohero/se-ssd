package tests.databinding.jaxb;

import java.io.File;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

import domainmodel.enums.Campus;
import domainmodel.enums.CourseType;
import domainmodel.enums.Term;
import domainmodel.Course;
import domainmodel.CourseCatalog;
import domainmodel.DegreeProgramme;
import domainmodel.Instructor;

/**
 * resources for JAXB:
 * https://docs.oracle.com/javase/tutorial/jaxb/intro/index.html (Introduction)
 * https://docs.oracle.com/javase/tutorial/jaxb/intro/arch.html (JAXB
 * Architecture)
 * 
 * Different annotations for our POJOs: XmlRootElement, XmlAttribute, XmlElement
 * 
 * https://dzone.com/articles/using-jaxb-for-xml-with-java Note: As of JDK 1.6,
 * JAXB is bundled with the JDK. Therefore, you don't need to add any dependency
 * for it.
 * 
 * @author Julian Haslinger (P22080)
 * @version 1.0
 * 
 *    IMPORTANT: For easier usage, there are separate domain model classes
 *    that will be instrumented with annotations (package domainModel.jaxb)
 */
public class JAXBTests {
  public static void main(String args[]) {

    // 1. Create your java POJOs (plain old java objects) just as if you would use
    // them in the program
    CourseCatalog catalog = new CourseCatalog(2021, Term.Summer, Campus.Hagenberg);
    DegreeProgramme degreeProgramme0307 = new DegreeProgramme("0307", "Software Engineering", "SE");
    Course ssd4_ue = new Course("cID_8314", "Semistructured Data Models and XML", 2, CourseType.LabSession);
    Course ssd4_vo = new Course("cID_8315", "Semistructured Data Models and XML", 2, CourseType.Lecture);

    Instructor julian = new Instructor("Julian Haslinger", "P22080", "NBL");
    ssd4_ue.InstructorList.add(julian);
    ssd4_vo.InstructorList.add(julian);
    degreeProgramme0307.Courses.add(ssd4_vo);
    degreeProgramme0307.Courses.add(ssd4_ue);
    catalog.DegreeProgrammes.add(degreeProgramme0307);

    // Write the objects to the a file
    JaxbWriteCourseCatalogXML(catalog);

    // Read the xml back into memory (as POJOs) and do something with the object
    CourseCatalog catalogFromXML = JaxbReadCourseCatalogXML();

    if (catalogFromXML != null) {
      System.out.println("Catalog: Year = " + catalogFromXML.Year);
      System.out.println("Course #1: " + catalogFromXML.DegreeProgrammes.get(0).Courses.get(0).CourseID);
      Instructor readInstructor = catalogFromXML.DegreeProgrammes.get(0).Courses.get(0).InstructorList.get(0);
      System.out.println("Instructor: " + readInstructor.Name + " : " + "(" + readInstructor.Number + ", "
          + readInstructor.Type + ")");
    }
  }

  private static CourseCatalog JaxbReadCourseCatalogXML() {
    CourseCatalog catalog = null;

    try {
      File file = new File("xmlfiles/CourseCatalog0307_JAXB.xml");

      // 2. create a new JAXBContext, used for unmarshalling the xml data to POJOs
      JAXBContext jaxbContext = JAXBContext.newInstance(CourseCatalog.class);

      // 3. Create an unmarshaller
      Unmarshaller jaxbUnmarshaller = jaxbContext.createUnmarshaller();

      // 4. Instruct the unmarshaller to load the XML, create POJOs and return the
      // result as CourseCatalog object
      catalog = (CourseCatalog) jaxbUnmarshaller.unmarshal(file);
      // 5. Access the different fields / properties of the course catalog
      System.out.println(catalog.Year);
      System.out.println(catalog.Campus);

    } catch (Throwable e) {
      System.out.println("Exception Type: " + e.getClass().toString());
      System.out.println("Exception Message: " + e.getMessage());
      e.printStackTrace();
    }
    return catalog;
  }

  private static void JaxbWriteCourseCatalogXML(CourseCatalog catalog) {
    try {

      File file = new File("xmlfiles/CourseCatalog0307_JAXB.xml");

      // 2. Create a JAXBContext that will be used to create a marshaller
      JAXBContext jaxbContext = JAXBContext.newInstance(CourseCatalog.class);
      // 3. Create marshaller for the conversion between XML and POJOs
      Marshaller jaxbMarshaller = jaxbContext.createMarshaller();

      // 3.1. output pretty printed
      jaxbMarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);

      // 3.2. instruct the marshaller to marshal the object to the file
      jaxbMarshaller.marshal(catalog, file);
      // 3.3. instruct the marshaller to marshal the object to the standard output
      jaxbMarshaller.marshal(catalog, System.out);

    } catch (Throwable e) {
      System.out.println("Exception Type: " + e.getClass().toString());
      System.out.println("Exception Message: " + e.getMessage());
      e.printStackTrace();
    }
  }
}