@isTest 
public with sharing class deleteTempItemsTest {
    @isTest
    public static void deleteTempItemsTest() {
        List <New_Ticket__c> ticketsToDelete  = new List <New_Ticket__c>();
        List <Bus__c> busesToDelete  = new List <Bus__c>();
        List <New_Ticket__c> ticketsList  = new List <New_Ticket__c>();
        List <Bus__c> busesList  = new List <Bus__c>();
        Passenger__c testPsg = new Passenger__c(Name = 'testPsg', Email__c = 'psg@psg.com', First_Name__c = 'Boris', Passanger_phone__c = '111', Account__c = '0012v00002pM8aZAAS');
        insert testPsg;

        Bus__c TestBus = new Bus__c(Name = 'testBus', Transport_company__c = 'a032v00004fGQONAA4', from__c = 'Minsk', to__c = 'Moscow', quality__c = 'hard seats');
        Bus__c TempBus = new Bus__c(Name = 'Temp', Transport_company__c = 'a032v00004fGQONAA4', from__c = 'Minsk', to__c = 'Moscow', quality__c = 'hard seats');
        busesList.add(TestBus);
        busesList.add(TempBus);
        insert busesList;

        New_Ticket__c TestTicket = new New_Ticket__c(from_City__c = 'Moscow', to_City__c = 'Minsk', Bus__c = TestBus.Id, Passanger__c = testPsg.Id, Seat_number__c = 5);
        New_Ticket__c TempTicket = new New_Ticket__c(from_City__c = 'Moscow', to_City__c = 'Minsk', Bus__c = TempBus.Id, Passanger__c = testPsg.Id, Seat_number__c = 5);
        ticketsList.add(TestTicket);
        ticketsList.add(TempTicket);
        insert ticketsList;

        ticketsList = [SELECT Id FROM New_Ticket__c];
        busesList = [SELECT Id FROM Bus__c];
        System.assertEquals(2, ticketsList.size());
        System.assertEquals(2, busesList.size());

        Test.startTest();
        deleteTempItems.deleteTempBuses();
        deleteTempItems.deleteTempTickets();
        Test.stopTest();

        System.assertEquals(0, busesToDelete.size());
        System.assertEquals(0, ticketsToDelete.size());

        ticketsList = [SELECT Id FROM New_Ticket__c];
        busesList = [SELECT Id FROM Bus__c];
        System.assertEquals(1, ticketsList.size());
        System.assertEquals(1, busesList.size());

    }
}
