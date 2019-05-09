trigger OpportunityTrigger on Opportunity (after insert, after update) {
    TriggerFactory.createHandler(Opportunity.sObjectType);
}