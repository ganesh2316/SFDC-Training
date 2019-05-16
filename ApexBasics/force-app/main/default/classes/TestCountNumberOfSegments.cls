@isTest
public class TestCountNumberOfSegments {
	@isTest
    public static void validateForNull(){
        String str='';
        Double count=CountNumberOfSegments.CountSegments(str);
    }
    @isTest
    public static void validateForAlphaNumeric(){
        String str='34y679jh546f';
        Double count=CountNumberOfSegments.CountSegments(str);
    }
    @isTest
    public static void validateForNumeric(){
        String str='89456793276510';
        Double count=CountNumberOfSegments.CountSegments(str);
    }
}