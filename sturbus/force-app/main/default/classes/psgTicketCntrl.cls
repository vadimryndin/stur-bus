public with sharing class psgTicketCntrl {
    
  //return Page.PassengerProfile + Id
  public static String psgTicketCntrl() {
      List <Passenger__c> CurrentPsgs = psgTicketCntrlHelper.psgTicketCntrlHelper();
      if(CurrentPsgs.size() > 0){
         String CurrentPsgID = (String)CurrentPsgs[0].Id;
         String addUrl = '?id=' + CurrentPsgID;
         String CurrentPsgURL = '/PassengerProfile' + addUrl;
           
         return CurrentPsgURL;
           }
        else{
           return '/PassengerProfile';
        }           
   }      

   public static String psgHomePage() {
      List <Passenger__c> CurrentPsgs = psgTicketCntrlHelper.psgTicketCntrlHelper();
   
      if(CurrentPsgs.size() > 0){
         String CurrentPsgID = (String)CurrentPsgs[0].Id;
         String addUrl = '?id=' + CurrentPsgID;
         String CurrentPsgURL = '/HomePageUser' + addUrl;
           
         return CurrentPsgURL;
           }
        else{
           return '/HomePageUser';
        }           
   }      

   public static String psgBuyTicket() {
      List <Passenger__c> CurrentPsgs = psgTicketCntrlHelper.psgTicketCntrlHelper();
   
      if(CurrentPsgs.size() > 0){
         String CurrentPsgID = (String)CurrentPsgs[0].Id;
         String addUrl = '?id=' + CurrentPsgID;
         String CurrentPsgURL = '/BuyTicket' ; //+ addUrl;
           
         return CurrentPsgURL;
           }
        else{
           return '/BuyTicket';
        }           
   }   

   public static String psgTicketInfo() {
      List <Passenger__c> CurrentPsgs = psgTicketCntrlHelper.psgTicketCntrlHelper();
   
      if(CurrentPsgs.size() > 0){
         String CurrentPsgID = (String)CurrentPsgs[0].Id;
         String addUrl = '?id=' + CurrentPsgID;
         String CurrentPsgURL = '/MyTicketInfo' + addUrl;
           
         return CurrentPsgURL;
           }
        else{
           return '/MyTicketInfo';
        }           
   }
   
   public static String psgTicketCompl() {

      List <Passenger__c> CurrentPsgs = psgTicketCntrlHelper.psgTicketCntrlHelper();
   
      if(CurrentPsgs.size() > 0){
         String CurrentPsgID = (String)CurrentPsgs[0].Id;
         String addUrl = '?id=' + CurrentPsgID;
         String CurrentPsgURL = '/TicketCompleted' + addUrl;
           
         return CurrentPsgURL;
           }
        else{
           return '/TicketCompleted';
        }           
   }
   
   public static String psgId() {

      List <Passenger__c> CurrentPsgs = psgTicketCntrlHelper.psgTicketCntrlHelper();
   
      if(CurrentPsgs.size() > 0){
         String CurrentPsgID = (String)CurrentPsgs[0].Id;
                    
         return CurrentPsgID;
           }
        else{
           return '';
        }           
   }
}
