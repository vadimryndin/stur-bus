/**
 * Class containing tests for SiteRegisterController
 */
@IsTest public with sharing class SiteRegisterControllerTest {
    @IsTest(SeeAllData=true) static void testRegistration() {
        SiteRegisterController controller = new SiteRegisterController();
        controller.username = 'test@force.com';
        controller.email = 'test@force.com';
        controller.communityNickname = 'test';
        // registerUser will always return null when the page isn't accessed as a guest user
        System.assert(controller.registerUser() == null);    
        
        controller.password = 'abcd1234';
        controller.confirmPassword = 'abcd123';
        System.assert(controller.registerUser() == null); 




    }

  /*  @IsTest static void testAddPsg() {
        Passenger__c psg = new Passenger__c();
        psg.First_Name__c = 'FirstName';
        psg.Name = 'communityNickname';
        psg.Email__c = 'email@mail.com';
       
       ApexPages.StandardController stdcontroller = new ApexPages.StandardController(psg);
       SiteRegisterController src = new SiteRegisterController(stdcontroller);
       src.addPsg();

        System.assert ('FirstName', [SELECT First_Name__c FROM Passenger__c LIMIT 1]);
        List<Passenger__c> testList =  [SELECT First_Name__c FROM Passenger__c];
        System.assertEquals (1, testList.size());

    }*/
}