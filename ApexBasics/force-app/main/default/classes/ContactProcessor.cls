global class ContactProcessor implements 
Database.Batchable<sObject>, Database.Stateful {
    global Integer recordsProcessed = 0;
    global Database.QueryLocator start(Database.BatchableContext bc) {
        Date tody=System.today();
        return Database.getQueryLocator('select FirstName,Birthdate,Birthday_status__c,Email from Contact where Email <> null');
    }
    global void execute(Database.BatchableContext bc, List<Contact> scope){
        List<Messaging.SingleEmailMessage> emails=new List<Messaging.SingleEmailMessage>();
        for (Contact c:Scope){
            if (c.Birthday_status__c){
                
            }
            List<String> mailList=new List<String>{c.Email};
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setSubject('Birthday Wishes');
            email.setToAddresses(mailList);
            email.setPlainTextBody('Happy Birthday '+c.FirstName+'!!!!');
            emails.add(email);
            recordsProcessed=recordsProcessed+1;
        }
        Messaging.sendEmail(emails);
        
    }
    global void finish(Database.BatchableContext bc){
        System.debug(recordsProcessed + ' records processed. Shazam!');
    }
}