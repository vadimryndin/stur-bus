public with sharing class busesInfoController {
    
        public Bus__c bus {get; set;}
        public List <Bus__c> busesToSave  = new List <Bus__c>();
        
        String busId = ApexPages.currentPage().getParameters().get('busid');
    
        private ApexPages.StandardController sctrl;
        public busesInfoController(ApexPages.StandardController controller) {
            this.sctrl = controller;
            this.bus = (Bus__c)sctrl.getRecord();
        }
    
            public Bus__c getBusList() {
                return [SELECT Name, Transport_company__c, from__c, to__c, Year__c, Seats__c, quality__c, Bus_drivers__c, in_Voyage__c, Bus_drivers__r.Name, Transport_company__r.Name FROM Bus__c WHERE Id = : ApexPages.currentPage().getParameters().get('busid')][0]; 
            } 

            public PageReference cancel(){
                PageReference pr = Page.NewBus;
                pr.setRedirect(true);
                return pr;
            }
    
            public PageReference returnPageUser(){
                PageReference pr = Page.HomePageUser;
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
    
}
