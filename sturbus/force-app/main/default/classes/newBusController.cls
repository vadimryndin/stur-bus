public with sharing class newBusController {
    public Bus__c bus {get; set;}
    public List <Bus__c> busesToSave  = new List <Bus__c>();
    
    String busId = ApexPages.currentPage().getParameters().get('busid');

    private ApexPages.StandardController sctrl;
    public newBusController(ApexPages.StandardController controller) {
        this.sctrl = controller;
        this.bus = (Bus__c)sctrl.getRecord();
    }

        public Bus__c getBusList() {
            return [SELECT Name, Transport_company__c, from__c, to__c, Year__c, Seats__c, quality__c, Bus_drivers__c, in_Voyage__c, Bus_drivers__r.Name, Transport_company__r.Name FROM Bus__c WHERE Id = : ApexPages.currentPage().getParameters().get('id')][0]; 
        } 

        public PageReference savePage(){

            Bus__c newBus = new Bus__c();
            newBus.Name = bus.Name;
            newBus.Transport_company__c = ApexPages.currentPage().getParameters().get('compid');
            newBus.from__c = bus.from__c;
            newBus.Bus_drivers__c = bus.Bus_drivers__c;
            newBus.to__c = bus.to__c;
            newBus.Year__c = bus.Year__c;
            newBus.Seats__c = bus.Seats__c;
            newBus.from__c = bus.from__c;
            newBus.quality__c = bus.quality__c;
        
            busesToSave.add(newBus);
    
            if (busesToSave.size()>0){
                insert busesToSave;
            }
            
            PageReference pr = Page.HomePageAdmin;
                pr.setRedirect(true);
                return pr;
        }
        
        public PageReference savenew(){
    
            savePage();
            
            PageReference pr = Page.NewBus;
            pr.setRedirect(true);
            return pr;
        }

        public PageReference savEdit(){
    
            Bus__c newBus = new Bus__c();
            newBus.Name = bus.Name;
            newBus.Transport_company__c = bus.Transport_company__c;
            newBus.from__c = bus.from__c;
            newBus.Bus_drivers__c = bus.Bus_drivers__c;
            newBus.to__c = bus.to__c;
            newBus.Year__c = bus.Year__c;
            newBus.Seats__c = bus.Seats__c;
            newBus.from__c = bus.from__c;
            newBus.quality__c = bus.quality__c;
            newBus.in_Voyage__c = bus.in_Voyage__c;
            newBus.Id = bus.Id;
        
            busesToSave.add(newBus);
    
            if (busesToSave.size()>0){
                update busesToSave;
            }
            
            PageReference pr = new PageReference('/BusInfo?id='+ ApexPages.currentPage().getParameters().get('id'));
            pr.setRedirect(true);
            return pr;
        }
    
        public PageReference cancel(){
            PageReference pr = Page.NewBus;
            pr.setRedirect(true);
            return pr;
        }

        public PageReference returnPage(){
            PageReference pr = Page.HomePageAdmin;
            pr.setRedirect(true);
            return pr;
        }
}
