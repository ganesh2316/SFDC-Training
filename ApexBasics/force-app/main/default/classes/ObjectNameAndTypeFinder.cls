public class ObjectNameAndTypeFinder {
    public static void fieldTypeFinder(String tab){
        SObjectType accountType = Schema.getGlobalDescribe().get(tab);
	Map<String,Schema.SObjectField> mfields = accountType.getDescribe().fields.getMap();
	for (String fieldName: mfields.keySet()) {
	String fieldLabel = mfields.get(fieldName).getDescribe().getName();
	Schema.DisplayType fielddataType = mfields.get(fieldName).getDescribe().getType();
	system.debug(fieldLabel+':'+fielddataType);
	}
   }
}