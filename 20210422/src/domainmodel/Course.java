package domainmodel;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import domainmodel.enums.CourseType;

import java.util.ArrayList;

/**
 * <b>The Course class</b>
 * JSON:
 * The {@link com.fasterxml.jackson.annotation.JsonPropertyOrder JsonPropertyOrder}
 * annotation defines the order in which the different properties are serialized into
 * the json file.
 *
 * The{@link com.fasterxml.jackson.annotation.JsonProperty JsonProperty}
 * annotation defines the name of the property in the json file.
 *
 * @author Julian-Paul Haslinger (P22080)
 * @version 1.0
 */
@JsonPropertyOrder({"CourseID", "CourseType", "SemesterHours", "Title", "InstructorList"})
public class Course {

    @JsonProperty("CourseTitle")
    @XmlAttribute(name="kurstitel")
    public String Title;

    @JsonProperty("courseType")
    @XmlAttribute(name="kurstyp")
    public CourseType CourseType;

    @JsonProperty("courseID")
    @XmlAttribute(name="kursID")
    public String CourseID;

    @JsonProperty("semesterHours")
    @XmlAttribute(name="SWS", namespace = "http://www.fh-ooe.at/ssd4/coursecatalog")
    public Integer SemesterHours;

    /**
     * JSON specific: the instructors to a course are stored in a list
     * --> all entries in the list will automatically be serialized once the data
     * is being written
     */
    @JsonProperty("Instructor List")
    @XmlElementWrapper(name="LVALeiterListe")
    @XmlElement(name="LVALeiter")
    public ArrayList<Instructor> InstructorList;

    /*
     * there might be other values for a course to be stored, but right now I think
     * that the values above should be sufficient to show off the capabilities.
     */
    public Course() {
        this.InstructorList = new ArrayList<Instructor>();
    }

    public Course(String courseID, String title, int semesterHours, CourseType type) {
        this();
        this.CourseID = courseID;
        this.Title = title;
        this.SemesterHours = semesterHours;
        this.CourseType = type;
    }

    /*
     * ToString method for output of courses
     */
    public String ToString() {
        StringBuilder builder = new StringBuilder();
        builder.append("*************************************************************************\n");
        builder.append("COURSE " + Title);
        builder.append("\n");
        builder.append("\t(Course ID: " + CourseID + ")");
        builder.append("\n");
        builder.append("\t(Course Type: " + CourseType.toString() + ")");
        builder.append("\n");

        for (Instructor i : InstructorList) {
            builder.append(i.ToString());
            builder.append("\n");
        }
        return builder.toString();
    }
}
