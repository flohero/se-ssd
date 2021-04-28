package dom;

import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.File;

public class TransformEntlassungsbrief {
    private static final String XMLFILES = "xmlfiles/";


    public static void main(String... args) {

        try {
            File inFile = new File(XMLFILES + "ELGA-023-Entlassungsbrief_aerztlich_EIS-FullSupport.xml");
            File outFile = new File(XMLFILES + "ELGA_Entlassungsbrief_aerztlich.html");
            File styleSheetFile = new File(XMLFILES + "ELGA_Stylesheet_v1.0.xsl");

            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = transformerFactory.newTransformer(new StreamSource(styleSheetFile));
            transformer.transform(new StreamSource(inFile), new StreamResult(outFile));
        } catch (TransformerException e) {
            e.printStackTrace();
        }
    }
}
