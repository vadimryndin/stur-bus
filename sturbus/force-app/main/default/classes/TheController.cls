public class TheController{
    public ApexPages.StandardSetController stdCntrlr {get; set;}
    public TheController(ApexPages.StandardSetController controller) {
        stdCntrlr = controller;
    }
    public String obj;
    public List<User> users{get;set;}
    public String contactID {get; set;}
    public New_Ticket__c ticket {get; set;}
    public Passenger__c psg {get; set;}
    //public Bus__c bus {get; set;}
    public List <New_Ticket__c> ticketstoSave  = new List <New_Ticket__c>();

    private ApexPages.StandardController sctrl;
    public TheController(ApexPages.StandardController controller){
        this.sctrl = controller;
    }
      
    public PageReference returnPage(){
     
        PageReference pr = new PageReference(psgTicketCntrl.psgHomePage());
        pr.setRedirect(true);
        return pr;
    }

    public PageReference buyticket(){
        PageReference pr = new PageReference(psgTicketCntrl.psgBuyTicket());
      //  PageReference pr = Page.BuyTicket;
        pr.setRedirect(true);
        return pr;
    }

    public PageReference goProfile(){
        PageReference pr = new PageReference(psgTicketCntrl.psgTicketCntrl());
        pr.setRedirect(true);
        return pr;
    }

    public PageReference myTickets(){
        PageReference pr = new PageReference(psgTicketCntrl.psgTicketInfo());
       // PageReference pr = Page.MyTicketInfo;
        pr.setRedirect(true);
        return pr;
    } 
            
    public static String PassangerId(){
        String psgID = psgTicketCntrl.psgId();
        return psgID;
    }
}
