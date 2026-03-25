@isTest
public class QUEUEABLEapexTest {
    @isTest
    public static void getDetailTest(){
        test.setMock(HttpCalloutMock.class,new MockHttpResponseGenerator());
        Id jobId = system.enqueueJob(new QUEUEABLEapex());
    }
}