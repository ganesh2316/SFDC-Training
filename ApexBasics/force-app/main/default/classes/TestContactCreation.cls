@isTest
public class TestContactCreation {
    @isTest public static void TestOneContact(){
        List<Contact> con=RandomContactFactory.generateRandomContacts(1,'Patil');
        System.assertEquals(1, con.size());
    }
    
    @isTest public static void TestBulkContact(){
        List<Contact> con=RandomContactFactory.generateRandomContacts(10,'Patil');
        System.assertEquals(10, con.size());
    }
}