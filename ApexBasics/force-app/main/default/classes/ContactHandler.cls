public class ContactHandler implements ITrigger {
	 public void bulkBefore(){}

    public void bulkAfter(){}

   public void beforeInsert(SObject so){}

   public void beforeUpdate(SObject oldSo, SObject so){}

   public void beforeDelete(SObject so){}
    
   public void afterInsert(SObject so){
       
   }
    
    public void afterUpdate(SObject oldSo, SObject so){
        Contact con=(Contact)so;
        Account acc =[Select Name from Account where Id=:con.AccountId];
        if(con.AccountId != null && con.OwnerId!=null){
            
        }
	}
    
   public void afterDelete(SObject so){}
    
   public void andFinally(){}

}