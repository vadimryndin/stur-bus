@isTest(SeeAllData=true)
public with sharing class psgTicketCntrlHelperTest {
    @isTest  public static void psgTicketCntrlHelperTest() {

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

            System.assertEquals(psgTicketCntrlHelper.psgTicketCntrlHelper(), CurrentPsgs);
        }
    }
}
