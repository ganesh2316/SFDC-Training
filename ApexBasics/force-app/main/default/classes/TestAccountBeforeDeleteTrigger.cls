@isTest
public class TestAccountBeforeDeleteTrigger {
    @isTest public static void deleteAccount(){
        List<Account> accList= new List<Account>{
            new Account(Name='Eternus',AccountNumber='EE456789')
        };
        insert accList;
        Account acc=[select id from Account where Name='Eternus'];
        Date dt= Date.newInstance(2019, 06, 15);
        List<Opportunity> oppList=new List<Opportunity>{
          new Opportunity(Name='EternusOpp',AccountId=acc.Id,StageName='Closed Won',CloseDate=dt,Amount=50000)  
        };
        insert OppList;
        
        delete accList;
    }
}