public class buttonController {
    
    public New_Ticket__c ticket {get; set;}
    public List <New_Ticket__c> ticketstoSave  = new List <New_Ticket__c>();

    private ApexPages.StandardController sctrl;
    public buttonController(ApexPages.StandardController controller){
        this.sctrl = controller;
        this.ticket = (New_Ticket__c)controller.getRecord();
    }

        public PageReference savePage(){

            System.debug(ticket);
            System.debug(ticket.from_City__c);
            System.debug(ticket.Passanger__c);
            
            String psgID = psgTicketCntrl.psgId();
            
            System.debug(psgID);
    
            New_Ticket__c newT = new New_Ticket__c();
            newT.from_City__c = ticket.from_City__c;
            newT.Seat_number__c = ticket.Seat_number__c;
            newT.to_City__c = ticket.to_City__c;
            newT.Bus__c = ticket.Bus__c;
            newT.Passanger__c = psgID;
        
            ticketstoSave.add(newT);
    
            System.debug(newT);
            System.debug(ticketstoSave);
            System.debug(newT.Passanger__c);
    
            if (ticketstoSave.size()>0){
                insert ticketstoSave;
            }
            
           // PageReference pr = new PageReference(psgTicketCntrl.psgTicketCntrl());
            PageReference pr = new PageReference('/TicketCompleted?id='+ newT.Id);
                pr.setRedirect(true);
                return pr;
            }
        
        public PageReference savenew(){
    
            savePage();
            
            PageReference pr = new PageReference(psgTicketCntrl.psgBuyTicket());
            pr.setRedirect(true);
            return pr;
        }
    
        public PageReference cancel(){
            PageReference pr = new PageReference(psgTicketCntrl.psgBuyTicket());
            //PageReference pr = Page.BuyTicket;
            pr.setRedirect(true);
            return pr;
        }

        public PageReference returnPage(){
     
            PageReference pr = new PageReference(psgTicketCntrl.psgHomePage());
            pr.setRedirect(true);
            return pr;
        }

        public PageReference goProfile(){
            PageReference pr = new PageReference(psgTicketCntrl.psgTicketCntrl());
            pr.setRedirect(true);
            return pr;
        }

        public PageReference buyticket(){
            PageReference pr = new PageReference(psgTicketCntrl.psgBuyTicket());
          //  PageReference pr = Page.BuyTicket;
            pr.setRedirect(true);
            return pr;
        }
    
}
