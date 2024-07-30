/**
 * @description       : Batch Class to delete the Apex Health Records based on the load id
 * @author            : Goutham Cheedella/ Logesh M
 * @project           : ApexPulse
 * @last modified on  : 07-25-2024
 * @last modified by  : gcheedella@salesforce.com
**/
public with sharing class ApexHealth_BAT_DeletePreviousData implements Database.Batchable<SObject>{
    /**
     * @description currentLoadId
     */
    private String currentLoadId;
    
    /**
     * @description apexClsIdList
     */
    private List<String> apexClsIdList;
    
    /**
     * @description ApexHealth_BAT_DeletePreviousData
     * @param loadId
     * @param apexClassIds
     */
    public ApexHealth_BAT_DeletePreviousData(String loadId, List<String> apexClassIds) {
        this.currentLoadId = loadId;
        this.apexClsIdList = apexClassIds;
    }
    /**
     * @description start
     * @param BC
     * @return Database.QueryLocator
     */
    public Database.QueryLocator start(Database.BatchableContext BC) {
        List<String> idList = ApexHealthUtility.convertToStrings(apexClsIdList);
        String query = 'SELECT Id,Name FROM ApexHealth__c WHERE EntityId__c IN:idList AND LoadId__c != \'' + String.escapeSingleQuotes(currentLoadId) + '\'';
        return Database.getQueryLocator(query);
    }
    /**
     * @description execute
     * @param BC
     * @param scope
     */
    public void execute(Database.BatchableContext BC, List<sObject> scope) {
        try {
            delete as user scope;
        } catch (Exception e) {
            // Handle any exceptions that occur during the delete operation
            insert as user ApexHealthUtility.createLog('ApexHealth_BAT_DeletePreviousData: execute', e.getMessage(), currentLoadId, system.now(), e.getStackTraceString());
        }
    }
    /**
     * @description finish
     * @param BC
     */
    public void finish(Database.BatchableContext BC) {
        String reason = '';
        String suffix = ' for Load Id - '+currentLoadId;
        if(String.isNotBlank(currentLoadId)){
            AggregateResult agr = [select COUNT(id) CNT from Logger__c where LoadId__c =:currentLoadId WITH USER_MODE];
            Integer result = Integer.valueOf(agr.get('CNT'));
            if(result == 0){
                reason = 'No Errors have been logged';
            }
            else if(result > 0){
                reason = result+' Errors have been logged';
            }
        }
        ApexHealthUtility.sendBatchCompletionEmail(reason+suffix);
    }
}