public class AccountsController {
      @AuraEnabled
      public static List <Account> getAccounts() {
        return [SELECT Id, name,  Phone FROM Account ORDER BY createdDate ASC];
      }
    }