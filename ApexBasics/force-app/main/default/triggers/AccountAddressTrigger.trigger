trigger AccountAddressTrigger on Account (before insert, before update , before delete) {
    if(Trigger.isDelete && Trigger.isBefore){
        for (Account a : [SELECT Id FROM Account
                          WHERE Id IN (SELECT AccountId FROM Opportunity) AND
                          Id IN :Trigger.old]) {
                              Trigger.oldMap.get(a.Id).addError(
                                  'Cannot delete account with related opportunities.');
                          }
    }
    if ((Trigger.isInsert && Trigger.isBefore)||(Trigger.isUpdate && Trigger.isBefore)){
        for (Account a:Trigger.new){
            if(a.Match_Billing_Address__c){
                a.ShippingPostalCode=a.BillingPostalCode;
            }
        }
    }
}