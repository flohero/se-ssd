package domainmodel;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import tests.databinding.jaxb.LocalDateAdapter;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlTransient;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;
import java.time.LocalDate;

/**
 * <b>The instructor class</b>
 * JSON:
 * The {@link com.fasterxml.jackson.annotation.JsonPropertyOrder JsonPropertyOrder}
 * annotation defines the order in which the different properties are serialized into
 * the json file.
 *
 * The{@link com.fasterxml.jackson.annotation.JsonProperty JsonProperty}
 * annotation defines the name of the property in the json file.
 *
 * XML:
 * By annotating the properties with @XmlAttribute, we can make sure that they
 * will be modeled as attributes
 *
 * @author Julian-Paul Haslinger (P22080)
 * @version 1.0
 */
@JsonPropertyOrder({"Number", "Name", "Type"})
public class Instructor {

  @JsonProperty("name")
  @XmlAttribute(name = "name")
  public String Name;

  // Set the name for the JSON property, so it doesn't need to be the same as for
  // the field itself
  // --> instead of "Number" the field will be "Instructor Number" in JSON
  @JsonProperty("Instructor Number")
  @XmlAttribute(name = "personalnummer")
  public String Number;

  // Default value () indicates that the field name is used as the property name
  // without any modifications
  @JsonProperty()
  @XmlAttribute(name = "typ")
  public String Type;

  // With @XmlTransient we can make sure that this property won't be mapped to XML
  // --> It will not be part of the result XML and it will not be mapped back when
  // we create POJOs out of our XML
  // https://docs.oracle.com/javaee/6/api/javax/xml/bind/annotation/XmlTransient.html
  @XmlTransient
  @JsonIgnore // field will not be serialized to JSON
  public String A;

  @XmlJavaTypeAdapter(value = LocalDateAdapter.class)
  @XmlElement(name="Erstellungsdatum")
  @JsonIgnore // field will not be serialized to JSON
  public LocalDate CreatedAt;

  public Instructor(String name, String number, String type) {
    Name = name;
    Number = number;
    Type = type;
    A = "Just a test string that won't make it into the result XML file.";
    CreatedAt = LocalDate.now(); // "now"
  }

  public Instructor() {
  }

  public Object ToString() {
    StringBuilder builder = new StringBuilder();
    builder.append("INSTRUCTOR: Name: " + this.Name + "(" + this.Number + ", " + this.Type + ")");
    return builder.toString();
  }
}
