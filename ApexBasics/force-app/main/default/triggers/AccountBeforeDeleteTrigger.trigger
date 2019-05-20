trigger AccountBeforeDeleteTrigger on Account (before delete) {
	if(Trigger.isDelete && Trigger.isBefore){
        for (Account a : [SELECT Id FROM Account
                          WHERE Id IN (SELECT AccountId FROM Opportunity where StageName='Closed Won') AND
                          Id IN :Trigger.old]) {
                              Trigger.oldMap.get(a.Id).addError(
                                  'Cannot delete account with related Closed Won Opportunity.');
                          }
    }
}