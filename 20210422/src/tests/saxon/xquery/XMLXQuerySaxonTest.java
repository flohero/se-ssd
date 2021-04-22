package tests.saxon.xquery;

import net.sf.saxon.Configuration;
import net.sf.saxon.om.Item;
import net.sf.saxon.om.SequenceIterator;
import net.sf.saxon.query.DynamicQueryContext;
import net.sf.saxon.query.StaticQueryContext;
import net.sf.saxon.query.XQueryExpression;
import net.sf.saxon.trans.XPathException;

/**
 * You need to add this to your pom.xml file (Saxon Home Edition (HE) dependency):
 * <!-- https://mvnrepository.com/artifact/net.sf.saxon/Saxon-HE -->
 * <dependencies>
 *   <dependency>
 *     <groupId>net.sf.saxon</groupId>
 *     <artifactId>Saxon-HE</artifactId>
 *     <version>10.0</version>
 *   </dependency>
 * </dependencies>
 *
 * @author Julian Haslinger (P22080)
 * @version 1.0
 */
public class XMLXQuerySaxonTest {
    static String xmlFilesDir = "xmlfiles/";

    public static void main(String[] args) {
        System.out.println(XMLXQuerySaxonTest.class.getSimpleName() + " BEGIN");

        Configuration saxonConfiguration = Configuration.newConfiguration();
        StaticQueryContext sqc = saxonConfiguration.newStaticQueryContext();
        DynamicQueryContext dqc = new DynamicQueryContext(saxonConfiguration);
        dqc.setApplyFunctionConversionRulesToExternalVariables(false);

        final String newLine = "\n";
        // Declare an XQuery query
        String queryToSelectAllCourseTitles =
                "declare base-uri \".\";\n" +
                "let $courseCatalog := fn:doc(\"xmlfiles/CourseCatalog.xml\")" + newLine +
                "for $course in $courseCatalog//Course" + newLine +
                "let $title := $course/Title" + newLine +
                "where not(contains($title, 'Intro'))" + newLine +
                "return ($course/@id, $course/Title)";

        try {
            XQueryExpression xQueryExpression = sqc.compileQuery(queryToSelectAllCourseTitles);
            SequenceIterator iterator = xQueryExpression.iterator(dqc);
            System.out.println("Result for (Saxon optimized) query:");
            System.out.println(xQueryExpression.getExpression().toString());
            System.out.println("***********************************");
            while (true) {
                Item item = iterator.next();
                if (item == null) {
                    break;
                }
                String val = item.getStringValue();
                System.out.println(val);
            }
        } catch (XPathException e) {
            e.printStackTrace();
        }
        System.out.println("***********************************");
        System.out.println(XMLXQuerySaxonTest.class.getSimpleName() + " END");
    }
}
