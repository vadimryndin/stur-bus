public class TheController{
    public ApexPages.StandardSetController stdCntrlr {get; set;}
    public TheController(ApexPages.StandardSetController controller) {
        stdCntrlr = controller;
    }

    public List<Passenger__c> psgToUpdate{get;set;}
    public String contactID {get; set;}
    public Passenger__c psg {get; set;}
    
    private ApexPages.StandardController sctrl;
    public TheController(ApexPages.StandardController controller){
        this.sctrl = controller;
        this.psg = (Passenger__c)sctrl.getRecord();
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

    public PageReference editProfile(){
        PageReference pr = new PageReference('/EditProfile?id='+ ApexPages.currentPage().getParameters().get('id'));
        pr.setRedirect(true);
        return pr;
    }

    public PageReference savEdit(){

        Passenger__c newPSG = new Passenger__c();
        newPSG.Name = psg.Name;
        newPSG.Email__c = psg.Email__c;
        newPSG.First_Name__c = psg.First_Name__c;
        newPSG.Passanger_phone__c = psg.Passanger_phone__c;
        newPSG.Id = psg.Id;
        System.debug(psg);
    
        upsert newPSG;
        System.debug(newPSG);
        
        PageReference pr = new PageReference('/PassengerProfile?id='+ newPSG.Id);
        pr.setRedirect(true);
        return pr;
    }
}
