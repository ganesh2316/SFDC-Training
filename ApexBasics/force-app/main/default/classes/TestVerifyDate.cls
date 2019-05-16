@isTest
public class TestVerifyDate {
    @isTest static void testDateWithin30(){
        Date d1=Date.newInstance(2019, 05,01);
        Date d2=Date.newInstance(2019, 05,30);
        Date dt=VerifyDate.CheckDates(d1,d2);
        System.assertEquals(d2, dt);
    }
    @isTest static void testDateNotWithin30(){
        Date d1=Date.newInstance(2019, 05,01);
        Date d2=Date.newInstance(2019, 06,10);
        Date d3= Date.newInstance(2019, 05, 31);
        Date dt=VerifyDate.CheckDates(d1,d2);
        System.assertEquals(d1, dt);
    }
}