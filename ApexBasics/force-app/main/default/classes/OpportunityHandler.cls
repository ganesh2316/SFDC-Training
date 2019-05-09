public class OpportunityHandler implements ITrigger {
    private static final Integer Monthly=12;
    private static final Integer Yearly=1;
    private static final Integer Quaterly=4;
    public void bulkBefore(){}

    public void bulkAfter(){}

   public void beforeInsert(SObject so){}

   public void beforeUpdate(SObject oldSo, SObject so){}

   public void beforeDelete(SObject so){}
    
   public void afterInsert(SObject so){
       try{
           
       Date OppCloseDate;
       Opportunity opp= (Opportunity)so;
      if(opp.Parent_Opportunity__c==null){
       Id oppId= opp.Id;
       Integer nMonthsToAdd;
       String frequency= opp.Frequency__c;
       String years= opp.Years__c;
       Decimal Amount= opp.Amount;
       Decimal FCount;
       switch on frequency {
           when 'Yearly'  {
               FCount=Yearly*Integer.valueof(years);
               nMonthsToAdd=12;
           }
           when 'Quarterly' {
              FCount= Quaterly*Integer.valueof(years);
              nMonthsToAdd=4;
           }
           when 'Monthly' {
               FCount=Monthly*Integer.valueof(years);
               nMonthsToAdd=1;
           }
       }
		System.debug(Amount);
        System.debug(FCount);
       Integer dividedAmount=Integer.valueof(Amount/FCount);
        System.debug(dividedAmount);
      
       List<Opportunity> OppList=new List<Opportunity>();
       for(Integer i=0;i<FCount;i++){
           if(i==0){
                OppCloseDate= opp.CloseDate;
           }
           else{
               OppCloseDate=OppList[i-1].CloseDate.addMonths(nMonthsToAdd);
           }
           OppList.add(new Opportunity(Name=opp.Name+i,Amount=dividedAmount,CloseDate=OppCloseDate,Parent_Opportunity__c=opp.Id,StageName=opp.StageName));
       }
       insert OppList;
           }
       }
       Catch(Exception ex){
           System.debug('Message:'+ex.getMessage());
           System.debug('Linenumber:'+ex.getLineNumber());
           
       }
   }
    
   public void afterUpdate(SObject oldSo, SObject so){
       Opportunity opp=(Opportunity)so;   
       if((opp.Parent_Opportunity__c!= null)&&(opp.StageName!='Prospecting')){
 		String stageName = opp.StageName;

        List<Opportunity> opps= new List<Opportunity>();
        Map<String, Id> totalStages = new Map<String,Id>();

        opps = [SELECT  Id, StageName FROM Opportunity WHERE Parent_Opportunity__c = :opp.Parent_Opportunity__c];
		System.debug(opps);
        for(Opportunity op : opps){
            totalStages.put(op.StageName, op.Id);
        }
        System.debug(totalStages);

        if(totalStages.get('Closed Won') != null){ 
           
            Opportunity parentOpp =  [SELECT  StageName FROM Opportunity WHERE Id = :opp.Parent_Opportunity__c];
            parentOpp.StageName = 'Qualification';
            System.debug(parentOpp);
            update parentOpp;
        } 

        if(totalStages.get('Prospecting') == null){
            Opportunity parentOpp =  [SELECT  StageName FROM Opportunity WHERE Id = :opp.Parent_Opportunity__c];
            parentOpp.StageName = 'Closed';
            System.debug(parentOpp);
            update parentOpp;  
        }    
		
       }
       
       
   }
    
   public void afterDelete(SObject so){}
    
   public void andFinally(){}

}