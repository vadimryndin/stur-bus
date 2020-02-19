trigger NewTicketTrigger on New_Ticket__c (before insert, after insert) {
    NewTicketTriggerHelper.NewTicketTriggerHelper(trigger.new);

}