public with sharing class psgTicketCntrlHelper {
    public static List <Passenger__c> psgTicketCntrlHelper() {
        List <String> emails = new List<String>();
     
        User runningUser = [SELECT ContactId FROM User WHERE Id = :UserInfo.getUserId()];
    
        Contact runningUserCnt = [SELECT Email FROM Contact WHERE Id = :runningUser.ContactId];
        
        List <Passenger__c> CurrentPsgs = [SELECT Email__c FROM Passenger__c WHERE Email__c = :runningUserCnt.Email];

        return CurrentPsgs;
    }
}
