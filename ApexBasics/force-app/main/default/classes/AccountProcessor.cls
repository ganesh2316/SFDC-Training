global class AccountProcessor {
@future
    public static void countContacts(List<ID>AccId){
        List<AggregateResult> con=[select Count(Id) cntContact,AccountId from Contact where AccountId In : AccId group by AccountId order by AccountId ];
        List<Account> acc=[select Name,Number_Of_Contacts__c from Account where Id In : AccId];
        Double Count;
        for(Account aco:acc){
            for(AggregateResult ar:con){
                if(aco.Id==ar.get('AccountId')){
                    aco.Number_Of_Contacts__c=(Decimal)ar.get('cntContact');
                }
            }                
            }
        }
    }