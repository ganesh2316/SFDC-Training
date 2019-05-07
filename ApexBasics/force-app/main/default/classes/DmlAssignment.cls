public  class DmlAssignment {
    private ID acctId;
    Private ID contactId;
    public  void createContact(List<Parameters> param) {
        List<Contact> cts=new List<Contact>();
        List<Opportunity>opList=new List<Opportunity>();
        acctId= createAccount('Globant');
        for(Parameters pm: param){
          cts.add(new  Contact(AccountId=acctId,FirstName=pm.Fname,LastName=pm.Lname,Phone=pm.phone,Email=pm.email));
           opList.add(createOpportunity(pm.Fname,pm.Lname,pm.amt));
        }
        createCustomer(cts,opList);
    }
    public void createCustomer(List<Contact>ContactList,List<Opportunity> OpportunityList){
        Set<String> emailSet= new Set<String>();
        List<Contact>updateCtl=new List<Contact>();
        List<Contact>insertCtl=new List<Contact>();
        set<Contact>insertCts=new set<Contact>();
        for(Contact ct:ContactList){
            emailSet.add(ct.email);
        }
        
        updateCtl=[Select Email from Contact where Email IN: emailSet];
        
        for (Contact conn:ContactList){
            insertCts.add(conn);
        }
        
        if (updateCtl.size()!=0){
            for(Contact conn: ContactList){
                for (Contact cont: updateCtl){
                    if(conn.email==cont.email){
                        cont.FirstName=conn.FirstName;
                        cont.LastName=conn.LastName;
                        cont.Phone=conn.Phone;
                        insertCts.remove(conn);
                    }
                }
            }
        }
        
        insertCtl.addall(insertCts);
        
        update updateCtl;
        insert insertCtl;
        
        insertOpportunity(updateCtl,insertctl,OpportunityList);
        
        }
    public void insertOpportunity(List<Contact>upContactList,List<Contact>inContactList,List<Opportunity>oppList){
        for (Contact cont:inContactList){
            for (Opportunity opp:oppList){
                opp.Contact__c=cont.Id;
            }
        }
        for (Contact cont:upContactList){
            for (Opportunity opp:oppList){
                opp.Contact__c=cont.Id;
            }
        }
        
        insert oppList;
        
    }
 
    
    
    
    public ID createAccount(String accName){
        ID actID;
        List<Account> actList=[Select Name from Account where Name=:accName];
        if (actList.size()!=0){
            for(Account act:actList){
            	actID=(ID)act.get('Id');
            }
            return actID;
        }
        else{
        	Account acct= new Account(Name=accName);
        	insert acct;
        	actID = acct.Id;
        	System.debug('Account Created Sucessfully');
        	return actID;
        }
    }
    
    
    public Opportunity createOpportunity(String fname, String lname, Integer amt){
        Date dt=Date.newInstance(2019, 04, 26);
        List<Opportunity> opp=[SELECT OrderId__c from Opportunity order by CreatedDate DESC Limit 1 ];
        List<Opportunity> oppInsertList=new List<Opportunity>();
        String nameOpp;
        Opportunity opt;
        for (Opportunity oppo: opp){
            if (oppo.OrderId__c == null ){
                 nameOpp= fname+'_'+lname+'_'+'O-0000';
            }
            else{
                 nameOpp= fname+'_'+lname+'_'+oppo.OrderId__c;
            }
            opt=new Opportunity(Name=nameOpp,AccountId=acctId,Contact__c=contactId,StageName='Open',CloseDate=dt,Amount=amt);
          
        }
        return opt;
    }
    
    
    public class Parameters{
        public String Fname{get;set;}
        public String Lname{get;set;}
        public String phone {get; set;}
        public String email{get;set;}
        public Integer amt{get; set;}
       
        public Parameters(String fname, String lname, String ph, String e_mail,Integer Amt){
            this.Fname=fname;
            this.Lname=lname;
            this.phone=ph;
            this.email=e_mail;
            this.amt=Amt;
        }
    }
}