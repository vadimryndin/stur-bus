public with sharing class psgTicketCntrlHelper {
    public static List <Passenger__c> psgTicketCntrlHelper() {
        List <String> emails = new List<String>();
     
        User runningUser = [SELECT ContactId FROM User WHERE Id = :UserInfo.getUserId()];
    
        //List<Contact> runningUserCnt = [SELECT Email FROM Contact WHERE Id = :runningUser.ContactId];
        // for Test Class
        List<Contact> runningUserCnt = [SELECT Email FROM Contact WHERE OwnerId = :runningUser.Id];
        
        for(Contact cntVar : runningUserCnt){
            emails.add(cntVar.Email);
        }
        
        List <Passenger__c> CurrentPsgs = [SELECT Email__c FROM Passenger__c WHERE Email__c IN : emails];

        return CurrentPsgs;
    }
}
