public without sharing class buttonController {
    
    public New_Ticket__c ticket {get; set;}
    public List <New_Ticket__c> tickets {get; set;}
    public Boolean busList {get;set;}
    public Boolean buttons {get;set;}
    public Boolean buttonSelect {get;set;}
    public Boolean seatsList {get;set;}
    public Boolean btnAppr {get;set;}
    public String selectedBus {get;set;}
    public String selectedSeat {get;set;}
    public List<SelectOption> options {get; set;}
    Bus__c tempBus {get; set;}
    List<Integer> seatsQ = new List<Integer>();
    List<Integer> seatsInTickets = new List<Integer>();

    private ApexPages.StandardController sctrl;
    public buttonController(ApexPages.StandardController controller){
        this.sctrl = controller;
        this.ticket = (New_Ticket__c)sctrl.getRecord();
    }
    
        public PageReference savePage(){

            System.debug('====================Bus: ' + selectedBus );
            System.debug('====================Seat: ' + selectedSeat);

            String psgID = psgTicketCntrl.psgId();
            New_Ticket__c newT2 = new New_Ticket__c();
            newT2.from_City__c = ticket.from_City__c;
            newT2.to_City__c = ticket.to_City__c;
            newT2.Bus__c = selectedBus;
            newT2.Passanger__c = psgID;
            newT2.Seat_number__c = integer.valueof(selectedSeat);
           // newT2.Seat_number__c = ticket.Seat_number__c;
            System.debug(newT2);
            System.debug('====================Seat:' + newT2.Seat_number__c);
            System.debug('====================Bus: ' + newT2.Bus__c);

            if(selectedSeat != null) {
                try {insert newT2;

                    deleteTempItems.deleteTempTickets();
                    deleteTempItems.deleteTempBuses();

                } catch(Exception e) {
                    System.debug('An exception occurred: ' + e.getMessage());
                  }
                  PageReference pr = new PageReference('/TicketCompleted?id='+ newT2.Id);
                  pr.setRedirect(true);
                  return pr;

            } else {
                return null;                
            }
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

        public List<selectOption> getBuses() {
            List<selectOption> options = new List<selectOption>(); 
             //new list for holding all of the picklist options
            options.add(new selectOption('', '- None -')); 
            List<Bus__c> busList= new List<Bus__c>();
            busList = [SELECT Name FROM Bus__c WHERE from__c = : ticket.from_City__c AND to__c = : ticket.to_City__c AND in_Voyage__c = false];
            
            for (Bus__c bus : busList) { 
                options.add(new selectOption(bus.id, bus.Name)); 
            }
            return options;
        }

        public List<selectOption> getSeats() {
            List<selectOption> options = new List<selectOption>(); 
             //new list for holding all of the picklist options
            options.add(new selectOption('', '- None -')); 
            Bus__c seatsQuantity = [SELECT Seats__c FROM Bus__c WHERE Id = : selectedBus][0];
            Integer seatQuantity = (Integer)seatsQuantity.Seats__c;
            for(Integer i=1; i < seatQuantity; i++){
                i += 0;
                seatsQ.add(i);
            }

            Bus__c selectBus = [SELECT isHasTickets__c FROM Bus__c WHERE Id = : selectedBus][0];
            if(selectBus.isHasTickets__c == true){
                List<New_Ticket__c> seatsList = [SELECT Seat_number__c FROM New_Ticket__c WHERE Bus__c = : selectedBus];
                if(seatsList.size() > 0){
                    for(New_Ticket__c tVar : seatsList){
                        seatsInTickets.add((Integer)tVar.Seat_number__c);
                    }
                }
            }          
            System.debug('====================Bus: ' + selectBus );
            System.debug('====================seatList: ' + seatsInTickets );

            Set<Integer> availableSeats = new Set<Integer>(seatsQ);
            if(seatsInTickets.size() > 0) {
                availableSeats.removeAll(seatsInTickets);
            }
            
            for (Integer seatsVar : availableSeats) { 
                options.add(new selectOption(String.valueOf(seatsVar), String.valueOf(seatsVar))); 
            }
            return options;
        }

        public PageReference selectSeat() {
            
            System.debug('====================Bus: ' + selectedBus );

            if(selectedBus != null) {
                seatsList = true; 
                btnAppr = true;
                return null;  
            } else {
                return null;                
            }
        }

        public PageReference selectBus(){
            busList = true;
            buttonSelect = true;
            return null;

/*      //old version without reRender
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

       */   }
       public PageReference confirmTicket(){
        if(selectedSeat != null) {
            buttons = true;
            return null;  
        } else {
            return null;                
        }
    }
}