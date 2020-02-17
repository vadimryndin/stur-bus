public class buttonController {
    
    public New_Ticket__c ticket {get; set;}
    public List <New_Ticket__c> tickets {get; set;}

    public String selectedBus {get;set;}
    public List<SelectOption> options {get; set;}
    Bus__c tempBus {get; set;}


    private ApexPages.StandardController sctrl;
    public buttonController(ApexPages.StandardController controller){
        this.sctrl = controller;
        this.ticket = (New_Ticket__c)sctrl.getRecord();
    }
    
        public PageReference savePage(){

            System.debug(selectedBus);

            String psgID = psgTicketCntrl.psgId();
            New_Ticket__c newT2 = new New_Ticket__c();
            newT2.from_City__c = ticket.from_City__c;
            newT2.Seat_number__c = ticket.Seat_number__c;
            newT2.to_City__c = ticket.to_City__c;
            newT2.Bus__c = selectedBus;
            newT2.Passanger__c = psgID;
            System.debug(newT2);

            insert newT2;

            deleteTempItems.deleteTempTickets();
            deleteTempItems.deleteTempBuses();

            PageReference pr = new PageReference('/TicketCompleted?id='+ newT2.Id);
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

            deleteTempItems.deleteTempTickets();
            deleteTempItems.deleteTempBuses();

            PageReference pr = new PageReference(psgTicketCntrl.psgBuyTicket());
            //PageReference pr = Page.BuyTicket;
            pr.setRedirect(true);
            return pr;
        }

        public PageReference returnPage(){

            deleteTempItems.deleteTempTickets();
            deleteTempItems.deleteTempBuses();
     
            PageReference pr = new PageReference(psgTicketCntrl.psgHomePage());
            pr.setRedirect(true);
            return pr;
        }

        public PageReference goProfile(){

            deleteTempItems.deleteTempTickets();
            deleteTempItems.deleteTempBuses();

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

        public List<selectOption> getbuses() {
            List<selectOption> options = new List<selectOption>(); 
             //new list for holding all of the picklist options
            options.add(new selectOption('', '- None -')); 
            List<Bus__c> busList= new List<Bus__c>();
            busList = [SELECT Id, Name FROM Bus__c WHERE from__c = : ticket.from_City__c AND to__c = : ticket.to_City__c];
            
            for (Bus__c bus : busList) { 
                options.add(new selectOption(bus.id, bus.Name)); 
            }
            return options;
        }

        public PageReference selectBus(){
            tempBus = new Bus__c(Name = 'Temp', Transport_company__c = 'a032v00003zYQDMAA4', quality__c = 'soft seats', from__c = 'Minsk', to__c = 'Riga', Seats__c = 20);
            upsert tempBus;
            String psgID = psgTicketCntrl.psgId();

            New_Ticket__c newT = new New_Ticket__c();
            newT.from_City__c = ticket.from_City__c;
            newT.Seat_number__c = ticket.Seat_number__c;
            newT.to_City__c = ticket.to_City__c;
            newT.Bus__c = tempBus.Id;
            newT.Passanger__c = psgID;

            insert  newT; 

            PageReference pr = new PageReference('/BuyTicket?id='+ newT.Id);
            pr.setRedirect(true);
            return pr;
        }
}
