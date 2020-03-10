@isTest
global class busesInfoControllerTest {
    @IsTest global static void busesInfoController() {
        Bus__c testBus = new Bus__c(Name = 'testBus', Transport_company__c = 'a032v00004fGQONAA4', from__c = 'Minsk', to__c = 'Moscow', quality__c = 'hard seats');
        insert testBus;
        
        ApexPages.StandardController sc = new ApexPages.StandardController(testBus);
        busesInfoController controller = new busesInfoController(sc);
        controller.cancel();
        controller.returnPageUser();
        controller.buyticket();
        controller.goProfile();
     
    }

}