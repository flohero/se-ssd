package domainmodel.enums;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * The different types of courses offered at the campuses
 * 
 * @author Julian-Paul Haslinger (P22080)
 * @version 1.0
 */
public enum CourseType {
  @JsonProperty("Vorlesung")
  Lecture,
  Seminar,
  @JsonProperty("Laborübung")
  LabSession,
  @JsonProperty("Übung")
  PracticeSession,
  Training
}
