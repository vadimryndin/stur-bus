public with sharing class psgController {

            public ApexPages.StandardSetController stdCntrlr {get; set;}
            public psgController(ApexPages.StandardSetController controller) {
                    stdCntrlr = controller;
            }

                List<Passenger__c> psgList {get; set;}
                public Passenger__c psg {get;set;}
               
            
                private ApexPages.StandardController sctrl;
                public psgController(ApexPages.StandardController controller){
                    this.sctrl = controller;
                    psg  = (Passenger__c)sctrl.getRecord();
                }

                public Passenger__c getPassengersList() {
                    return [SELECT Name, Passanger_phone__c, Email__c, First_Name__c FROM Passenger__c WHERE Id = : ApexPages.currentPage().getParameters().get('id')][0]; 
                }
            
                public PageReference Companies(){
                    PageReference pr = Page.Companies;
                    pr.setRedirect(true);
                    return pr;
                }
            
                public PageReference Drivers(){
                    PageReference pr = Page.Drivers;
                    pr.setRedirect(true);
                    return pr;
                }
        
                public PageReference PassengersList(){
                    PageReference pr = Page.Passengers;
                    pr.setRedirect(true);
                    return pr;
                }
                  
                public PageReference returnPage(){
                    PageReference pr = Page.HomePageAdmin;
                    pr.setRedirect(true);
                    return pr;
                }
}
            
