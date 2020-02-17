public with sharing class newDriverController {
    public Bus_driver__c driver {get; set;}
    public Bus_driver__c drivers {get; set;}
    public List <Bus_driver__c> driversToSave  = new List <Bus_driver__c>();
    public Date dat {get;set;}
    
    String compId = ApexPages.currentPage().getParameters().get('compid');

    private ApexPages.StandardController sctrl;
    public newDriverController(ApexPages.StandardController controller) {
        this.sctrl = controller;
        this.driver = (Bus_driver__c)sctrl.getRecord();
        this.drivers = (Bus_driver__c)sctrl.getRecord();
    }

    public Bus_driver__c getDriversList() {
        return [SELECT Name, Transport_company__c, Driver_experience__c, First_Name__c, Passed_medical_examination__c, Date_of_Birth__c, Transport_company__r.Name FROM Bus_driver__c WHERE Id = : ApexPages.currentPage().getParameters().get('id')][0]; 
    }

        public PageReference savePage(){

            Bus_driver__c newDriver = new Bus_driver__c();
            newDriver.Name = driver.Name;
            newDriver.Transport_company__c = ApexPages.currentPage().getParameters().get('compid');
            newDriver.Driver_experience__c = driver.Driver_experience__c;
            newDriver.First_Name__c = driver.First_Name__c;
            newDriver.Passed_medical_examination__c = driver.Passed_medical_examination__c;
            newDriver.Date_of_Birth__c = dat;
        
            driversToSave.add(newDriver);
    
            if (driversToSave.size()>0){
                insert driversToSave;
            }
            
            PageReference pr = Page.Drivers;
                pr.setRedirect(true);
                return pr;
        }
        
        public PageReference savenew(){
    
            savePage();
            
            PageReference pr = Page.NewDriver;
            pr.setRedirect(true);
            return pr;
        }
    
        public PageReference cancel(){
            PageReference pr = Page.NewDriver;
            pr.setRedirect(true);
            return pr;
        }

        public PageReference returnPage(){
     
            PageReference pr = Page.HomePageAdmin;
            pr.setRedirect(true);
            return pr;
        }

        public PageReference returnDrivers(){
     
            PageReference pr = Page.Drivers;
            pr.setRedirect(true);
            return pr;
        }

        public PageReference savEdit(){
    
            Bus_driver__c newDriver = new Bus_driver__c();
            newDriver.Name = drivers.Name;
            newDriver.Transport_company__c = drivers.Transport_company__c;
            newDriver.First_Name__c = drivers.First_Name__c;
            newDriver.Driver_experience__c = drivers.Driver_experience__c;
            newDriver.Passed_medical_examination__c = drivers.Passed_medical_examination__c;
            newDriver.Date_of_Birth__c = dat;
            newDriver.Id = drivers.Id;
        
            driversToSave.add(newDriver);
    
            if (driversToSave.size()>0){
                update driversToSave;
            }
            
            PageReference pr = new PageReference('/DriverInfo?id='+ ApexPages.currentPage().getParameters().get('id'));
            pr.setRedirect(true);
            return pr;
        }
}