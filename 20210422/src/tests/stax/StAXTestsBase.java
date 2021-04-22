package tests.stax;

/**
 * resources for StAX:
 * https://docs.oracle.com/javase/tutorial/jaxp/stax/why.html (Why StAX?)
 * https://docs.oracle.com/javase/tutorial/jaxp/stax/api.html (StAX API)
 *
 * @author Julian Haslinger (P22080)
 * @version 1.0
 *   Choosing between Cursor and Iterator API:
 * 
 *   Recommmendations (Oracle): 
 *   * Cursor API: 
 *      * for memory-constrained environments 
 *      * for performance critical applications
 * 
 *   * Iterator API: 
 *      * for creating XML processing pipelines 
 *      * for modifying the event stream 
 *      * for pluggable processing of the event stream 
 *      * for any other "common" usage scenario
 *          * (Iterator API is more flexible and extensible)
 */
public class StAXTestsBase {

}
