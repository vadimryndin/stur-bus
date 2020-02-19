public with sharing class NewTicketTriggerHelper {
    public static void NewTicketTriggerHelper(List<New_Ticket__c> ListNewTickets) {
        List<String> IdBusesFromNewTickets= new List<String>();
        List<Bus__c> BusesToUpdate= new List<Bus__c>();
        
        for(New_Ticket__c tVar : [SELECT Bus__c FROM New_Ticket__c WHERE Id IN : ListNewTickets]) {
            IdBusesFromNewTickets.add(tVar.Bus__c);
        }  
        List<Bus__c> BusesFromNewTickets = [SELECT Name FROM Bus__c WHERE Id IN : IdBusesFromNewTickets];

        for(Bus__c bVar : BusesFromNewTickets) {
            bVar.isHasTickets__c = true;
            BusesToUpdate.add(bVar);
        }

            try {
                update BusesToUpdate;
                System.debug('BusesToUpdate' + BusesToUpdate);
                System.debug('ListNewTickets' + ListNewTickets);
                System.debug('IdBusesFromNewTickets' + IdBusesFromNewTickets);
                System.debug('BusesFromNewTickets' + BusesFromNewTickets);
            }
            catch(DmlException e) {
                System.debug(e.getMessage());
            }
    }
}
