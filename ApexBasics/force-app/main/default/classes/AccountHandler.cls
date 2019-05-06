public class AccountHandler {
    public static Account insertNewAccount(String nm){
        Account acct;
        try{
            acct= new Account(Name=nm);
        	insert acct;
           }
        catch (DmlException e) {
    			System.debug('A DML exception has occurred: ' + e.getMessage());
                return null;
		}  
        return acct;
    }
}