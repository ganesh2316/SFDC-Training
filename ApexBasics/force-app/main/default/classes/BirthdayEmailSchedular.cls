global class BirthdayEmailSchedular implements Schedulable  {
	global void execute(SchedulableContext ctx) {
        ContactProcessor con= new ContactProcessor();
        Id BatchId=Database.executeBatch(con);
    }
}