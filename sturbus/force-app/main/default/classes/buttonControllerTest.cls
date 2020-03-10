@isTest (SeeAllData=true)
global class buttonControllerTest {
    @IsTest global static void buttonControllerTest() {
        String selectedSeat = '2';
        Integer seatVar = integer.valueof(selectedSeat);
        Profile p = [SELECT Id FROM Profile WHERE Name='CCU guest'];
        Account acc = new Account(name='John Smith');

        insert acc;

        Contact cont = new Contact();
        cont.FirstName='Test1';
        cont.LastName='Test';
        cont.Accountid= acc.id;

        insert cont;
        
        User testUser = new User(Alias = 'standt', Email='standar11duser@testorg.com', 
        EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
        LocaleSidKey='en_US', ProfileId = p.Id, 
        TimeZoneSidKey='America/Los_Angeles', ContactId = cont.Id, UserName='ttstuser@teorg.com' );
        insert testUser;

        System.runAs(testUser){
            Contact testContact = new Contact(LastName = 'testName', Email = 'psg@psg.com');
            insert testContact;
            testContact.OwnerId = UserInfo.getUserId();
            update testContact;

            Passenger__c testPsg = new Passenger__c(Name = 'testPsg', Email__c = 'psg@psg.com', First_Name__c = 'Boris', Passanger_phone__c = '111', Account__c = '0012v00002pM8aZAAS');
            upsert testPsg;
            User runningUser = [SELECT ContactId FROM User WHERE Id = :UserInfo.getUserId()];

            Contact runningUserCnt = [SELECT Email FROM Contact WHERE OwnerId = :runningUser.Id];

            List <Passenger__c> CurrentPsgs = [SELECT Email__c FROM Passenger__c WHERE Email__c = :runningUserCnt.Email];
			String psgId = (String)CurrentPsgs[0].Id;
            System.assertEquals(psgTicketCntrl.psgId(), psgId);
        
            New_Ticket__c testTicket = new New_Ticket__c(from_City__c = 'Moscow', 
                to_City__c = 'Minsk', Bus__c = 'a002v00004IyVNTAA3', Passanger__c = psgId, Seat_number__c = seatVar);
            insert testTicket;
            
            ApexPages.StandardController sc = new ApexPages.StandardController(testTicket);
            buttonController controller = new buttonController(sc);
         
           
            controller.savePage();
        //    controller.savenew();
            controller.cancel();
            controller.returnPage();
            controller.goProfile();
            controller.buyticket(); 
            controller.selectSeat();
            controller.selectBus();
            controller.confirmTicket(); 
                
            
                
            List<SelectOption> options = controller.getBuses();
            system.assertNotEquals(null, options, 'The collection should be instantiated');
            system.assert(!options.isEmpty(), 'The collection should be populated');
    
            List<SelectOption> options1 = controller.getSeats();
            system.assertNotEquals(null, options1, 'The collection should be instantiated');
            system.assert(!options1.isEmpty(), 'The collection should be populated');

        
        }
    }
}