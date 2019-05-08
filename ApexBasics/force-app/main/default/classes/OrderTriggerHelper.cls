public class OrderTriggerHelper {
    public static void ExtractDetails(List<Order__c> orderList,List<String>orderEIdList){
        List<Contact> contactIdList=[select Id from contact where Email=:orderEIdList];
        List<Opportunity> OpportunityList=[select Name from Opportunity where Contact__c=:contactIdList];
		List<Opportunity>updateOppList=new List<Opportunity>();
        for (Opportunity opp:OpportunityList){
            for(Order__c ord:orderList){
                if(opp.Name.contains(ord.Order_Id__c)){
                    opp.Amount=ord.Amount__c;
                    updateOppList.add(opp);
                }
            }
        }
        update updateOppList;
        System.debug('Opportunity Updated Sucessfully');
        
    }
}