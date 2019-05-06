public class ContactSearch {
    public static List<Contact> searchForContacts(String lName, string postalCode){
        List <Contact> cts= [SELECT AccountID , Name from contact where LastName =:lName AND MailingPostalCode=:postalCode];
        Return cts;
    }
}