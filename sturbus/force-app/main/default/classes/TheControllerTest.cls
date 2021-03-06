@isTest(SeeAllData=true)
global with sharing class TheControllerTest {
    @IsTest global static void TheControllerTest() {
/*
       Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
        User testUser = new User(Alias = 'standt', Email='standar11duser@testorg.com', 
        EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
        LocaleSidKey='en_US', ProfileId = p.Id, 
        TimeZoneSidKey='America/Los_Angeles', UserName='ttstuser@teorg.com');
        insert testUser;

        System.runAs(testUser){
            Contact testContact = new Contact(LastName = 'testName', Email = 'psg@psg.com');
            insert testContact;
            testContact.OwnerId = UserInfo.getUserId();
            update testContact;

            Passenger__c testPsg = new Passenger__c(Name = 'testPsg', Email__c = 'psg@psg.com', First_Name__c = 'Boris', Passanger_phone__c = '111', Account__c = '0012v00002pM8aZAAS');
            upsert testPsg;
            User runningUser = [SELECT ContactId FROM User WHERE Id = :UserInfo.getUserId()];

            Contact runningUserCnt = [SELECT Email FROM Contact WHERE OwnerId = :runningUser.Id];

            List <Passenger__c> CurrentPsgs = [SELECT Email__c FROM Passenger__c WHERE Email__c = :runningUserCnt.Email];
            String psgId = (String)CurrentPsgs[0].Id;

            String testStr = '/HomePageUser?id=' + psgId;

            System.assertEquals(TheController.returnPage(), testStr);
            
            System.assertEquals(controller.returnPage(), null); 
            System.assertEquals(controller.buyticket(), null);        
*/
        Passenger__c testPsg = new Passenger__c(Name = 'testPsg', Email__c = 'psg@psg.com', First_Name__c = 'Boris', Passanger_phone__c = '111', Account__c = '0012v00002pM8aZAAS');
        insert testPsg;
        
        ApexPages.StandardController sc = new ApexPages.StandardController(testPsg);
        TheController controller = new TheController(sc);
        controller.returnPage();
        controller.buyticket();
        controller.goProfile();
        controller.myTickets();
        controller.editProfile();
        controller.savEdit();     

    }
}
