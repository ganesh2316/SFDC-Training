public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer numCont,String lname ){
        List <Contact> con= new List<Contact>();
        
        for(Integer i=0;i<numCont;i++){
            con.add(new Contact(FirstName='Test'+i,LastName=lname));
        }
        return con;
    } 
}