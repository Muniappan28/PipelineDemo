@isTest
public class UserApiCalloutTest {
    @isTest
    public static void getUserDataTest(){
        Test.startTest();
		Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        Test.stopTest();
        system.debug(UserApiCallout.getUserData());
    }
}