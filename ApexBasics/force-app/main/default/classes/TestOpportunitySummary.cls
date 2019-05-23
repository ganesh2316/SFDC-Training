@isTest
public class TestOpportunitySummary {
    
    @isTest public static void validateOpportunityForOppInSameMonth(){
      Account act =new Account(Name='Globant1');
       System.debug(act);
       Insert act;  
        List<Contact>con=new List<Contact>();
        Date dt= Date.newInstance(1997, 01, 23);
        con.add(new Contact(FirstName='Ganesh',LastName='Patil',BirthDate=dt,AccountId=act.Id));
        insert con;
        Id ConID=con[0].Id;
        List<Opportunity> opp=new List<Opportunity>();
        Integer year= System.today().year();
        Integer mn1=System.today().addMonths(3).month();
        Integer mn2=System.today().addMonths(3).month();
        Date dt1= Date.newInstance(year, mn1, 30);
        opp.add(new Opportunity(Name='GaneshOpp',StageName='Open',AccountId=Act.Id,Contact__c=ConID,CloseDate=dt1,Amount=50000));
        Date dt5= Date.newInstance(year, mn2, 20);
        opp.add(new Opportunity(Name='GaneshOpp1',StageName='Open',AccountId=Act.Id,Contact__c=ConID,CloseDate=dt5,Amount=50000));
        insert opp;
        Test.startTest();
        Map<String, Map<String,Double>> newMap=OpportunitySummary.FindOpportunity(20,30);
        Test.stopTest();
        System.debug(newmap);
        Map<String,Double> res= newMap.get(String.valueOf(year));
        System.debug(res);
             Double TotAmt=0.0;
             for(Double amt:res.values()){
                  TotAmt += amt ;
             }
        
        System.debug(TotAmt);
        System.assertEquals(100000, TotAmt);
                
    }
    @isTest public static void validateOpportunityInDifferentMonth(){
		 Account act =new Account(Name='Globant1');
             System.debug(act);
             Insert act; 
        List<Contact>conn=new List<Contact>();
        Date dt2= Date.newInstance(1996, 07, 17);
        conn.add(new Contact(FirstName='Amit',LastName='Kumar',BirthDate=dt2,AccountId=act.Id));
        insert conn;
        Id ConnID=conn[0].Id;
        List<Opportunity> opp=new List<Opportunity>();
        Integer year= System.today().year();
        Integer year2=year+1;
        Integer mn1=System.today().addMonths(3).month();
        Integer mn2=System.today().addMonths(6).month();
        Date dt3= Date.newInstance(year, mn1, 20);
        opp.add(new Opportunity(Name='AmitOpp',StageName='Open',AccountId=act.Id,Contact__c=ConnID,CloseDate=dt3,Amount=50000));
        Date dt6= Date.newInstance(year, mn2, 10);
        opp.add(new Opportunity(Name='AmitOpp1',StageName='Open',AccountId=act.Id,Contact__c=ConnID,CloseDate=dt6,Amount=60000));
        System.debug(opp);
        insert opp;
        Test.startTest();
        Map<String, Map<String,Double>> newMap=OpportunitySummary.FindOpportunity(20,30);
        Test.stopTest();
        System.debug(newMap);
        Map<String,Double> res= newMap.get(String.valueOf(year));
        System.debug(res);
        List<Double> TotAmts=new List<Double>();
             for(String key:res.keyset()){
                TotAmts.add(res.get(key)); 
             }
        
        System.debug(TotAmts);
        System.assertEquals(50000,TotAmts[0]);
        System.assertEquals(60000,TotAmts[1]);
        
    }
}