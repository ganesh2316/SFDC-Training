public class OpportunitySummary {
    public static Map<String, Map<String,Double>> FindOpportunity(Integer minAge, Integer maxAge){
        List <Contact> ct=[Select Account.Name,Account.Createdby.Name, FirstName, LastName from  Contact where  age__c>:minAge AND age__c<=:maxAge];
        //system.debug(ct);
        List<string>accountNames= new List<String>();
        for (Integer i=0; i<ct.size();i++){
            accountNames.add(ct[i].Account.Name);
        }
        //System.debug(accountNames);
        List<AggregateResult> opp= new List<AggregateResult>();
        opp.addAll([Select CloseDate,sum(Amount) TotalAmount from Opportunity where Opportunity.Account.Name=:accountNames group BY CloseDate]);
     
        Map<String,Double> Result; 
        Map<String, Map<String,Double>>FinalResult=new Map<String, Map<String,Double>>();
        for (AggregateResult ar: opp){
            Date dt=(Date)ar.get('CloseDate');
            Integer Month= dt.month();
            String mon;
            Switch on Month{
                when 1{
                    mon='Jan';
                }
                when 2{
                    mon='Feb';
                }
                when 3{
                    mon='Mar';
                }
                when 4{
                    mon='Apr';
                }
                when 5{
                    mon='May';
                }
                when 6{
                    mon='June';
                }
                when 7{
                    mon='July';
                }
                when 8{
                    mon='Aug';
                }
                when 9{
                    mon='Sep';
                }
                when 10{
                    mon='Oct';
                }
                when 11{
                    mon='Nov';
                }
                when 12{
                    mon='Dec';
                }
            }
            String Year= String.valueOf(dt.year());
            Double amount=(Double)ar.get('TotalAmount');
            if (FinalResult.containsKey(Year)){
                Result= FinalResult.get(Year);
            if (Result.containsKey(mon) && amount !=0){
                
                Double amt=Result.get(mon);
                amt = amt+amount;
                Result.put(mon,amt);
                FinalResult.put(Year,Result);
            }
                else{
                    Result.put(mon,amount);
                    FinalResult.put(Year,Result);
                }
            }else{
                Result=new Map<String,Double>();
                Result.put(mon,amount); 
               	FinalResult.put(Year,Result);
            }
            
        }
        return FinalResult;
    }
}