public class NewCaseListController {
    public List<case> caseList{get;set;}
    public List<case> getNewCases(){
        caseList= [Select Id,CaseNumber from Case where status='New'];
        System.debug(caseList);
        return caseList;
    }
}