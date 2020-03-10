public with sharing class deleteTempItems {

    private static List <New_Ticket__c> ticketsToDelete  = new List <New_Ticket__c>();
    private static List <Bus__c> busesToDelete  = new List <Bus__c>();

    public static void deleteTempTickets() {
        ticketsToDelete = [SELECT ID FROM New_Ticket__c WHERE Bus__r.Name = 'Temp' OR Bus__r.Name = null];
        Database.DeleteResult[] drList1 = Database.delete(ticketsToDelete, false);
        // Iterate through each returned result
        for(Database.DeleteResult dr : drList1) {
            if (dr.isSuccess()) {
                // Operation was successful, so get the ID of the record that was processed
                System.debug('Successfully deleted Tickets with ID: ' + dr.getId());
            }
            else {
                // Operation failed, so get all errors                
                for(Database.Error err : dr.getErrors()) {
                    System.debug('The following error has occurred.');                    
                     System.debug(err.getStatusCode() + ': ' + err.getMessage());
                    System.debug('Tickets fields that affected this error: ' + err.getFields());
                }
            }
        }
    }

    public static void deleteTempBuses() {
        busesToDelete = [SELECT ID FROM Bus__c WHERE Name = 'Temp'];
        Database.DeleteResult[] drList2 = Database.delete(busesToDelete, false);
            // Iterate through each returned result
        for(Database.DeleteResult dr : drList2) {
            if (dr.isSuccess()) {
                // Operation was successful, so get the ID of the record that was processed
                System.debug('Successfully deleted Buses with ID: ' + dr.getId());
            }
             else {
                // Operation failed, so get all errors                
                for(Database.Error err : dr.getErrors()) {
                    System.debug('The following error has occurred.');                    
                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                    System.debug('Buses fields that affected this error: ' + err.getFields());
                }
            }
        }
    }
}