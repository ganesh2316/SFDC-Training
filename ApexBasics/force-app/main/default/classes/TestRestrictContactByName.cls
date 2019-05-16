@isTest
public class TestRestrictContactByName {
    @isTest static void checkContact(){
        List<Contact> ConList= new List<Contact>();
        Contact c= new Contact(FirstName='Ganesh',LastName='INVALIDNAME');
        ConList.add(c);
        insert ConList;
    }
}