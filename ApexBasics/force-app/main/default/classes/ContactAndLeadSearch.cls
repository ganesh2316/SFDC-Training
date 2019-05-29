public class ContactAndLeadSearch {
    public static  List<List< SObject>> searchContactsAndLeads(String searchStr){
        List<List<sObject>> searchList = [FIND :searchStr IN NAME FIELDS RETURNING Contact(FirstName,LastName),Lead(FirstName,LastName)];
        return searchList;
    }
}