public with sharing class newCompanyController {
    public Transport_company__c comp {get; set;}
    public List <Transport_company__c> compsToSave  = new List <Transport_company__c>();

    private ApexPages.StandardController sctrl;
    public newCompanyController(ApexPages.StandardController controller){
        this.sctrl = controller;
        this.comp = (Transport_company__c)controller.getRecord();
    }

        public PageReference savePage(){

            Transport_company__c newComp = new Transport_company__c();
            newComp.Name = comp.Name;
            newComp.Office_adress__c = comp.Office_adress__c;
            newComp.Email__c = comp.Email__c;
            newComp.Phone__c = comp.Phone__c;
        
            compsToSave.add(newComp);
    
            if (compsToSave.size()>0){
                insert compsToSave;
            }
            
            PageReference pr = Page.Companies;
                pr.setRedirect(true);
                return pr;
            }
        
        public PageReference savenew(){
    
            savePage();
            
            PageReference pr = Page.NewCompany;
            pr.setRedirect(true);
            return pr;
        }
    
        public PageReference cancel(){
            PageReference pr = Page.NewCompany;
            //PageReference pr = Page.BuyTicket;
            pr.setRedirect(true);
            return pr;
        }

        public PageReference returnPage(){
     
            PageReference pr = Page.HomePageAdmin;
            pr.setRedirect(true);
            return pr;
        }
}
