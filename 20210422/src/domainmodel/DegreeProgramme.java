package domainmodel;

import com.fasterxml.jackson.annotation.JsonPropertyOrder;

import java.util.ArrayList;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;

/**
 * <b>The DegreeProgramme class</b>
 * JSON:
 * The {@link com.fasterxml.jackson.annotation.JsonPropertyOrder JsonPropertyOrder}
 * annotation defines the order in which the different properties are serialized into
 * the json file.
 *
 * The{@link com.fasterxml.jackson.annotation.JsonProperty JsonProperty}
 * annotation defines the name of the property in the json file.
 *
 * XML:
 * JAXB annotations
 * @XmlRootElement: the name of the root XML element is derived from the class
 *                  name and we can also specify the name of the root element of
 *                  the XML using its name attribute
 * @XmlType: define the order in which the fields are written in the XML file
 * @XmlElement: define the actual XML element name which will be used
 * @XmlAttribute: define the id field is mapped as an attribute instead of an
 *                element
 * @XmlTransient: annotate fields that we don't want to be included in XML
 *
 * @author Julian-Paul Haslinger (P22080)
 * @version 1.0
 */
@JsonPropertyOrder({"Code", "Name", "Abbreviation", "Courses"})
public class DegreeProgramme {
  @XmlElement(name = "Code")
  public String Code;
  @XmlAttribute(name = "name")
  public String Name;
  @XmlAttribute(name = "abkuerzung")
  public String Abbreviation;

  @XmlElementWrapper(name = "Kurse")  // Generates a wrapper element around the XML representation (child "Kurs")
  @XmlElement(name = "Kurs")
  public ArrayList<Course> Courses;

  public DegreeProgramme() {
    this.Courses = new ArrayList<Course>();
  }

  public DegreeProgramme(String Code, String Name, String Abbreviation) {
    this();
    this.Code = Code;
    this.Name = Name;
    this.Abbreviation = Abbreviation;
  }

  public String ToString() {
    StringBuilder builder = new StringBuilder();
    builder.append("*************************************************************************\n");
    builder.append("DEGREE PROGRAMME " + this.Name + "(" + this.Code + ", " + this.Abbreviation + ")");
    builder.append("\n");
    for (Course c : this.Courses) {
      builder.append(c.ToString());
    }
    return builder.toString();
  }
}
