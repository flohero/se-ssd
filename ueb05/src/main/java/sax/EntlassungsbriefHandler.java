package sax;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;


public class EntlassungsbriefHandler extends DefaultHandler {

    String currentTag;
    Person person;
    boolean titlePos;
    Diagnosis diagnosis;

    @Override
    public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
        currentTag = qName;
        if (qName.equals("Patient")) {
            person = new Person();
            return;
        }
        if (qName.equals("Titel")) {
            titlePos = attributes.getValue("position").equals("vor");
            return;
        }
        if (qName.equals("Diagnose")) {
            diagnosis = new Diagnosis();
            final String to = attributes.getValue("bis");
            if (to != null) {
                final LocalDate parse = LocalDate.parse(to);
                LocalDate nowHalfYear = LocalDate.now().minusDays(180);
                if (nowHalfYear.isAfter(parse)) {
                    diagnosis = null;
                    return;
                }
                diagnosis.setTo(parse);
            }
            final String from = attributes.getValue("von");
            if (from != null) {
                diagnosis.setFrom(LocalDate.parse(from));
            }

        }
    }

    @Override
    public void endElement(String uri, String localName, String qName) throws SAXException {
        currentTag = null;
    }

    @Override
    public void characters(char[] ch, int start, int length) throws SAXException {
        if (currentTag == null) {
            return;
        }
        String s = new String(ch, start, length);
        if (currentTag.equals("Vorname")) {
            person.addFirstname(s);
            return;
        }
        if (currentTag.equals("Nachname")) {
            person.setLastname(s);
            return;
        }
        if (currentTag.equals("Titel")) {
            if (titlePos) {
                person.addTitleFront(s);
            } else {
                person.addTitleBack(s);
            }
            return;
        }
        if (currentTag.equals("Geschlecht")) {
            person.setGender(s.equals("weiblich"));
            return;
        }
        if (currentTag.equals("Diagnose") && diagnosis != null) {
            diagnosis.setText(s);
            person.addDiagnosis(diagnosis);
            diagnosis = null;
        }
    }

    @Override
    public void endDocument() throws SAXException {
        System.out.println(person);
    }

    private static class Person {
        boolean gender;
        List<String> firstnames = new ArrayList<>();
        String lastname;
        List<String> titlesFront = new ArrayList<>();
        List<String> titlesBack = new ArrayList<>();
        List<Diagnosis> diagnoses = new ArrayList<>();


        public void setGender(boolean gender) {
            this.gender = gender;
        }

        public void setLastname(String lastname) {
            this.lastname = lastname;
        }

        public void addTitleFront(String title) {
            titlesFront.add(title);
        }

        public void addTitleBack(String title) {
            titlesBack.add(title);
        }

        public void addFirstname(String firstname) {
            firstnames.add(firstname);
        }

        public void addDiagnosis(Diagnosis d) {
            diagnoses.add(d);
        }

        @Override
        public String toString() {
            return "Sehr geehrte" +
                    (gender ? " Frau " : "r Herr ") +
                    String.join(" ", titlesFront) +
                    " " +
                    String.join(" ", firstnames) +
                    " " +
                    String.join(" ", titlesBack) +
                    "\n" +
                    "Es liegen folgende Diagnosen vor:" +
                    diagnoses
                            .stream()
                            .map(Object::toString)
                            .collect(Collectors.joining("\n")
                            );
        }
    }

    private static class Diagnosis {
        LocalDate from;
        LocalDate to;
        String text;

        public void setFrom(LocalDate from) {
            this.from = from;
        }

        public void setTo(LocalDate to) {
            this.to = to;
        }

        public void setText(String text) {
            this.text = text.trim();
        }

        @Override
        public String toString() {
            return text + " " + (to != null ? ("(bis " + to + ")") : "");
        }
    }
}
