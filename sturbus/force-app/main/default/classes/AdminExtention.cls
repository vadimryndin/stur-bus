public with sharing class AdminExtention {
    public ApexPages.StandardSetController stdCntrlr {get; set;}

    public AdminExtention(ApexPages.StandardSetController controller) {
        stdCntrlr = controller;
    }

        public List<Transport_company__c> companyToUpdate = new List<Transport_company__c>();
        public Transport_company__c company {get;set;}

        public ApexPages.StandardSetController setController {
            get {
                if(setController == null) {
                    setController = new ApexPages.StandardSetController(Database.getQueryLocator([SELECT Name, Office_adress__c, Phone__c, Email__c FROM Transport_company__c]));
                }
                return setController;
            }
            set;
        }

        public List<Transport_company__c> getCompsList() {
            return (List<Transport_company__c>) setController.getRecords();
        }

        private ApexPages.StandardController sctrl;
        public AdminExtention(ApexPages.StandardController controller){
            this.sctrl = controller;
            this.company = (Transport_company__c)sctrl.getRecord();
        }

        public Transport_company__c getComp() {
            return [SELECT Name, Office_adress__c, Phone__c, Email__c FROM Transport_company__c WHERE Id = : ApexPages.currentPage().getParameters().get('id')][0]; 
        } 

        public List<Transport_company__c> getCompaniesList() {
            return [SELECT Name, Office_adress__c, Phone__c, Email__c FROM Transport_company__c ]; 
        }

        public List<Transport_company__c> getBusesList() {
            return [SELECT Name, (SELECT Name, Seats__c, Year__c, from__c, to__c FROM Buses__r) FROM Transport_company__c WHERE Id = : ApexPages.currentPage().getParameters().get('id')];  
        }

     /*  
     //for custom related list
     public AdminExtention() {
            BusList = new List<Bus__c>();
            List<Transport_company__c> SearchList = new List<Transport_company__c>([SELECT (SELECT Name, Seats__c, Year__c, from__c, to__c FROM Buses__r) FROM Transport_company__c WHERE Id = : ApexPages.currentPage().getParameters().get('id')]);

            for(Transport_company__c trVar : SearchList){
                BusList.add(trVar.Buses__r);
            }
            System.debug(BusList);
        }
    */
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

        public PageReference Passengers(){
            PageReference pr = Page.Passengers;
            pr.setRedirect(true);
            return pr;
        }
          
        public PageReference addBus(){
            PageReference pr = new PageReference('/NewBus?compid='+ ApexPages.currentPage().getParameters().get('id'));
            //PageReference pr = Page.NewBus;
            pr.setRedirect(true);
            return pr;
        }
    
        public PageReference addCompany(){
            PageReference pr = Page.NewCompany;
            pr.setRedirect(true);
            return pr;
        }
    
        public PageReference addDriver(){
            PageReference pr = new PageReference('/NewDriver?compid='+ ApexPages.currentPage().getParameters().get('id'));
            //PageReference pr = Page.NewDriver;
            pr.setRedirect(true);
            return pr;
        }

        public PageReference returnPage(){
            PageReference pr = Page.HomePageAdmin;
            pr.setRedirect(true);
            return pr;
        }

        public PageReference editCompany(){
            PageReference pr = new PageReference('/EditCompany?id='+ ApexPages.currentPage().getParameters().get('id'));
            pr.setRedirect(true);
            return pr;
        }

        public PageReference savEdit(){

            Transport_company__c newCompany = new Transport_company__c();
            newCompany.Name = company.Name;
            newCompany.Office_adress__c = company.Office_adress__c;
            newCompany.Phone__c = company.Phone__c;
            newCompany.Email__c = company.Email__c;
            newCompany.Id = company.Id;
            System.debug(company);
        
            companyToUpdate.add(newCompany);
    
            if (companyToUpdate.size()>0){
                update companyToUpdate;
            }
            
            PageReference pr = new PageReference('/CompanyInfo?id='+ ApexPages.currentPage().getParameters().get('id'));
            pr.setRedirect(true);
            return pr;
        }
}