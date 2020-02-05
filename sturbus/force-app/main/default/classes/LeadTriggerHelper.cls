public with sharing class LeadTriggerHelper {
    public LeadTriggerHelper() {
    }

    public ContactUpdater(List<Lead> UdatedListLeads){
        List<String> LeadCompanies = new List<String>();
        for (Lead varLead : UdatedListLeads){
            LeadCompanies.add(varLead.Company);
        }

       /* List<String> ContactsLeadCompanies = new List<String>();
        List<Contact> contacts = [SELECT LastName FROM Contact WHERE Contact.Lead__c IN :UdatedListLeads];
        for(Contact cntVar : cnts){
            ContactsLeadCompanies.add(cntVar.LastName);
        }*/

        List<Account> NewAccAfterUpdLeads=[SELECT Name FROM Account WHERE Name IN :LeadCompanies];
        
        List<Contact> ContactsLeadCompanies = [SELECT LastName FROM Contact WHERE Contact.Lead__c IN :UdatedListLeads];
        for(Contact cntVar :ContactsLeadCompanies){
            cntVar.AccountId=NewAccAfterUpdLeads[0].Id;
        } 

        update ContactsLeadCompanies;

    }
}
