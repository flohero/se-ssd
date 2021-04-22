package domainmodel;

import java.util.ArrayList;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import domainmodel.enums.Campus;
import domainmodel.enums.Term;

/**
 * <b>The CourseCatalog class</b>
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
 *
 * @XmlRootElement: the name of the root XML element is derived from the class
 *                  name and we can also specify the name of the root element of
 *                  the XML using its name attribute
 * @XmlType: define the order in which the fields are written in the XML file
 * @XmlElement: define the actual XML element name which will be used
 * @XmlAttribute: define the id field is mapped as an attribute instead of an
 *                element
 * @XmlTransient: annotate fields that we don't want to be included in XML
 *
 * https://www.baeldung.com/jaxb
 * The XmlRootElement defines the entry point to our xml <-> pojo marshalling / data binding
 * @author Julian-Paul Haslinger (P22080)
 * @version 1.0
 */
@XmlRootElement(name = "Kurskatalog")
@JsonPropertyOrder({"Year", "Term", "Campus", "DegreeProgrammes"})
public class CourseCatalog {

  @JsonProperty("Year")
  @XmlAttribute(name="jahr")
  public Integer Year;

  @JsonProperty("Term")
  @XmlAttribute(name="semester")
  public Term Term;

  @JsonProperty("Campus")
  @XmlAttribute(name="campus")
  public Campus Campus;

  @JsonProperty("Degree Programmes")
  @XmlElement(name = "Studiengang")
  public ArrayList<DegreeProgramme> DegreeProgrammes;

  public CourseCatalog() {
    this.DegreeProgrammes = new ArrayList<DegreeProgramme>();
  }

  public CourseCatalog(Integer Year, Term Term, Campus Campus) {
    this();
    this.Year = Year;
    this.Term = Term;
    this.Campus = Campus;
  }

  @Override
  public String toString() {
    StringBuilder builder = new StringBuilder();
    builder.append("*************************************************************************\n");
    builder.append("COURSE CATALOG for " + this.Term + " (Year: " + this.Year + ")");
    builder.append("\n");
    for (DegreeProgramme d : this.DegreeProgrammes) {
      builder.append(d.ToString());
    }
    builder.append("*************************************************************************\n");
    return builder.toString();
  }
}
