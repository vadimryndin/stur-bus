@isTest(SeeAllData=true)
global with sharing class psgTicketCntrlTest {
    @isTest  global static void psgTicketCntrlTest() {

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

            String testStr = '/PassengerProfile?id=' + psgId;

            System.assertEquals(psgTicketCntrl.psgTicketCntrl(), testStr);
            
            String testStr1 = '/HomePageUser?id=' + psgId;

            System.assertEquals(psgTicketCntrl.psgHomePage(), testStr1);

            String testStr2 = '/BuyTicket';

            System.assertEquals(psgTicketCntrl.psgBuyTicket(), testStr2);

            String testStr3 = '/MyTicketInfo?id=' + psgId;

            System.assertEquals(psgTicketCntrl.psgTicketInfo(), testStr3);

            String testStr4 = '/TicketCompleted?id=' + psgId;

            System.assertEquals(psgTicketCntrl.psgTicketCompl(), testStr4);

            System.assertEquals(psgTicketCntrl.psgId(), psgId);



    }
}
