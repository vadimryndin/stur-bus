@isTest
global class AdminExtentionTest {
    @IsTest global static void AdminExtentionTest(){
        List<Transport_company__c> listComp = new List<Transport_company__c>();
        Transport_company__c testComp2 = new Transport_company__c(Name = 'testComp2', Email__c = 'psg2@psg.com', 
             Office_adress__c = 'Minsk', Phone__c = '1121');
        listComp.add(testComp2); 
        Transport_company__c testComp1 = new Transport_company__c(Name = 'testComp1', Email__c = 'psg1@psg.com', 
             Office_adress__c = 'Minsk', Phone__c = '1111');
        listComp.add(testComp1);
        insert listComp;
        
        ApexPages.StandardSetController stdSetController = new ApexPages.StandardSetController(listComp);
        stdSetController.setSelected(listComp);
        AdminExtention ext = new AdminExtention(stdSetController);
         
        System.assertEquals(listComp, ext.getCompsList());
        
        System.assertEquals(2, ext.getCompaniesList().size());
        
        Transport_company__c testComp = new Transport_company__c(Name = 'testComp', Email__c = 'psg@psg.com', 
             Office_adress__c = 'Minsk', Phone__c = '111');
        insert testComp;
        
        ApexPages.StandardController sc = new ApexPages.StandardController(testComp);
        AdminExtention controller = new AdminExtention(sc);
        
        controller.Companies();
        controller.Drivers();
        controller.Passengers();
        controller.addBus();
        controller.addCompany();
        controller.addDriver(); 
        controller.returnPage();
        controller.editCompany();
        controller.savEdit(); 

    }

}