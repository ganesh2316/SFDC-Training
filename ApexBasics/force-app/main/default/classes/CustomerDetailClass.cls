public with sharing class CustomerDetailClass {
    public PageReference doInsert(){
        Customer_Detail__c objdtl= new Customer_Detail__c();
        objdtl.First_Name__c=firstName;
        objdtl.Last_Name__c=lastName;
        objdtl.Customer_Email__c=email;
        objdtl.Customer_Phone__c=phone;
        List<Customer_Detail__c> cusList= new List<Customer_Detail__c>();
        cusList.add(objdtl);
        Database.SaveResult[] resList= Database.insert(cusList,false);
        for(Database.SaveResult sr: resList){
            if(sr.isSuccess()){
                sendMail(firstName,lastName,email,phone);
            }
        }
        pagereference ref = new pagereference('/apex/ContactDetails');
        System.debug(ref);
		ref.setredirect(true);
		return ref;
    } 
    public String firstName{ get; set; }
	public String lastName { get; set; }
	public String email { get; set; }
	public String phone { get; set; }
    
    public void sendMail(String fname, String Lname, String emailId, String phone){
        	Messaging.SingleEmailMessage [] emails = new Messaging.SingleEmailMessage[]{};
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setSubject('New Customer Confirmation');
        	email.setToAddresses(new List<String> {emailId});
        	String Message='First Name: '+fname+'\nLast Name: '+Lname+'\nPhone Number: '+phone;
            email.setPlainTextBody(Message);
            emails.add(email);
       
        Messaging.sendEmail(emails);
        System.debug('Mail Send Sucessfully');
    }
}