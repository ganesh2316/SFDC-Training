trigger AccountBeforeDeleteTrigger on Account (before delete) {
<<<<<<< HEAD

    if(Trigger.isDelete && Trigger.isBefore){

=======
    if(Trigger.isDelete && Trigger.isBefore){
>>>>>>> Application Level and Component Level Event Handling and Aura Methods
        for (Account a : [SELECT Id FROM Account
                          WHERE Id IN (SELECT AccountId FROM Opportunity where StageName='Closed Won') AND
                          Id IN :Trigger.old]) {
                              Trigger.oldMap.get(a.Id).addError(
                                  'Cannot delete account with related Closed Won Opportunity.');
                          }
    }
}