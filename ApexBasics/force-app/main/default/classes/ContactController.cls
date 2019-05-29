public class ContactController {
	 @AuraEnabled
      public static List <contact> getContacts(String accId) {
        return [SELECT Id, name, Phone FROM contact where accountId=:accId];
      }
}