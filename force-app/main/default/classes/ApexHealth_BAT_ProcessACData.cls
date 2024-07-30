/**
* @description       : Batch class to process the list of given classes to create apex health data
* @author            : Goutham Cheedella/ Logesh M
* @group             : ApexPulse
* @last modified on  : 07-25-2024
* @last modified by  : gcheedella@salesforce.com
**/
public with sharing class ApexHealth_BAT_ProcessACData implements Database.Batchable<SObject>, Database.Stateful, Database.AllowsCallouts{
    /**
     * @description loadId
     */
    private String loadId;
    /**
     * @description apexClassIds
     */
    private List<String> apexClassIds;
    
    /**
     * @description ApexHealth_BAT_ProcessACData
     * @param apexClassIds
     */
    public ApexHealth_BAT_ProcessACData(List<String> apexClassIds){
        this.apexClassIds = apexClassIds;
    }
    /**
     * @description start
     * @param BC
     * @return Database.getQueryLocator
     */
    public Database.QueryLocator start(Database.BatchableContext BC) {
        loadId = ApexHealthUtility.generateLoadId();        
        List<String> idsList = ApexHealthUtility.convertToStrings(apexClassIds);
        //query all the apex classes excluding the test classes
        String query = 'SELECT Id, Name FROM ApexClass WHERE Id IN :idsList AND Namespaceprefix = NULL AND (NOT Name LIKE \'%test%\')';
        return Database.getQueryLocator(query);
    }
    /**
     * @description execute
     * @param BC
     * @param scope
     */
    public void execute(Database.BatchableContext BC, List<sObject> scope) {
        try{
            List<ApexHealth__c> apexHealthRcdListToInsert = new List<ApexHealth__c>();   
            List<Logger__C> logListToInsert = new List<Logger__C>();     
            for (SObject s : scope) {
                //process apex class
                apexHealthRcdListToInsert.add(ApexHealthUtility.fetchApexClassMember(s.Id, loadId));
            }
            //insert records to ApexHealth__c object
            if (!apexHealthRcdListToInsert.isEmpty()) {
                SObjectAccessDecision securityDecisionHealthRecs = Security.stripInaccessible(AccessType.CREATABLE, apexHealthRcdListToInsert);
                Database.SaveResult[] sr = Database.insert(securityDecisionHealthRecs.getRecords(), false);
                for(Database.SaveResult s : sr){
                    if(!s.isSuccess()){
                        logListToInsert.add(ApexHealthUtility.createLog('ApexHealth_BAT_ProcessACData: execute', s.getErrors().toString(), loadId, system.now(), s.getId()));
                    }
                }
            }
            if(!logListToInsert.isEmpty()){
                //insert records to Logger__c object
                SObjectAccessDecision securityDecisionLogRecs = Security.stripInaccessible(AccessType.CREATABLE, logListToInsert);
                insert securityDecisionLogRecs.getRecords();
            }
        }
        catch(Exception e){
            insert as user ApexHealthUtility.createLog('ApexHealth_BAT_ProcessACData: execute', e.getMessage(), loadId, system.now(), e.getStackTraceString());
        }
    }
    /**
     * @description finish
     * @param BC
     */
    public void finish(Database.BatchableContext BC) {
        Database.executeBatch(new ApexHealth_BAT_DeletePreviousData(loadId, apexClassIds));
    }
}