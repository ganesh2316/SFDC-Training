trigger ContactTrigger on Contact (after update) {
<<<<<<< HEAD
        TriggerFactory.createHandler(Contact.sObjectType);
=======
		TriggerFactory.createHandler(Contact.sObjectType);
>>>>>>> e34e0990700d88666616412949f4d5f045ec7dda
}