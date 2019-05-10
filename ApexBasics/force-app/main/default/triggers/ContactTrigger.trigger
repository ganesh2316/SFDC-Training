trigger ContactTrigger on Contact (after update) {
		TriggerFactory.createHandler(Contact.sObjectType);
}