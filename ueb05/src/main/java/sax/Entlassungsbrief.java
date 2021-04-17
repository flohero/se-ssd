package sax;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import java.io.File;

public class Entlassungsbrief {
    public static void main(String... args) {
        SAXParserFactory factory = SAXParserFactory.newInstance();
        factory.setValidating(false);
        try {
            SAXParser parser = factory.newSAXParser();

            File file = new File("src/main/resources/Entlassungsbrief.xml");

            parser.parse(file, new EntlassungsbriefHandler());
        } catch (Throwable e) {
            System.out.println("Exception Type: " + e.getClass().toString());
            System.out.println("Exception Message: " + e.getMessage());
            e.printStackTrace();
        }

    }
}
