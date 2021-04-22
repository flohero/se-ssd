package tests.databinding.jaxb;

import java.time.LocalDate;
import javax.xml.bind.annotation.adapters.XmlAdapter;

// https://stackoverflow.com/questions/36156741/marshalling-localdate-using-jaxb
/**
 * With this adapter, we can make sure that a certain data type will be
 * marshalled / unmarshalled the correct way.
 * 
 * @author Julian-Paul Haslinger (P22080)
 * @version 1.0
 *
 */
public class LocalDateAdapter extends XmlAdapter<String, LocalDate> {
  public LocalDate unmarshal(String v) throws Exception {
    // when unmarshalling (XML -> POJOs) we can parse the date and return a String
    return LocalDate.parse(v);
  }

  public String marshal(LocalDate v) throws Exception {
    // when marshalling (POJOs -> XML) we want to save the local date as String 
    // this can easily be done with the "toString" method (of course)
    return v.toString();
  }
}
