@isTest(SeeAllData=true)
global with sharing class psgTicketCntrlTest {
    @isTest  global static void psgTicketCntrlTest() {
        psgTicketCntrl controller = new psgTicketCntrl();
        //public List <Passenger__c> CurrentPsgs;
       // global List <Passenger__c> CurrentPsgs = new List<Passenger__c>();
        Passenger__c testPsg = new Passenger__c(Name = 'testPsg', Email__c = 'psg@psg.com', First_Name__c = 'Boris', Passanger_phone__c = '111', Account__c = '0012v00002pM8aZAAS');
        insert testPsg;
        String testStr = '/PassengerProfile' + (String)testPsg.Id;
      //  CurrentPsgs.add(testPsg);

        System.assertEquals(psgTicketCntrl.psgTicketCntrl(), testStr);

    }
}
