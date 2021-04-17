package sax;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import java.io.File;
import java.io.PrintWriter;

public class Book {

    public static void main(String... args) {
        SAXParserFactory factory = SAXParserFactory.newInstance();
        factory.setValidating(false);
        try {
            SAXParser parser = factory.newSAXParser();

            File file = new File("src/main/resources/book10000.xml");
            File out = new File("src/main/resources/book10000out.xml");
            PrintWriter printWriter = new PrintWriter(out);

            parser.parse(file, new BookHandler(printWriter));
        } catch (Throwable e) {
            System.out.println("Exception Type: " + e.getClass().toString());
            System.out.println("Exception Message: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
