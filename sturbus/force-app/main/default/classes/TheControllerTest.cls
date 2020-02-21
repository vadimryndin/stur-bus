@isTest(SeeAllData=true)
global with sharing class TheControllerTest {
    @IsTest global static void TheControllerTest() {

        Passenger__c testPsg = new Passenger__c(Name = 'testPsg', Email__c = 'psg@psg.com', First_Name__c = 'Boris', Passanger_phone__c = '111', Account__c = '0012v00002pM8aZAAS');
        insert testPsg;

        ApexPages.StandardController sc = new ApexPages.StandardController(testPsg);
        TheController controller = new TheController(sc);
                
        System.assertEquals(controller.returnPage(), null); 
        System.assertEquals(controller.buyticket(), null);             

    }
}
