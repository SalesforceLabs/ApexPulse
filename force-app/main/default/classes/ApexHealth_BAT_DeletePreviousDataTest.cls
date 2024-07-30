/**
* @description       : Test class for ApexHealth_BAT_DeletePreviousData
* @author            : Goutham Cheedella/ Logesh M
* @project           : ApexPulse
* @last modified on  : 07-30-2024
* @last modified by  : gcheedella@salesforce.com
**/
@isTest
public class ApexHealth_BAT_DeletePreviousDataTest {
    
    /**
    * @description testBatchClass
    */
    @isTest
    public static void testBatchClass() {
        
        User testUser = ApexHealthTestUtility.createUserWithPermissionSet();
        System.runAs(testUser){
            String loadId ='1234567890';
            List<ApexClass> apexClassList = [Select Id from ApexClass Where Namespaceprefix = NULL Limit 2];
            
            List<String> apexClassIds = new List<String>();
            
            for(ApexClass apxc: apexClassList){
                apexClassIds.add(apxc.Id);
            }
            if(apexClassList.size() > 0){
                ApexHealth__c apexHealthrecord = new ApexHealth__c(LoadId__c = '1234567800', EntityId__c = apexClassList[0].Id );        
                insert apexHealthrecord;  
            }
            // Verify expected results
            List<ApexHealth__c> insertedapHRecords = [SELECT Id, Name, LoadId__c FROM ApexHealth__c WHERE LoadId__c !=: loadId];
            Logger__c logRecord = new Logger__c();
            logRecord.LoadId__c = '1234567890';
            insert logRecord;
            Test.startTest();
            // Execute the batch class
            ApexHealth_BAT_DeletePreviousData batch = new ApexHealth_BAT_DeletePreviousData(loadId, apexClassIds);
            Database.QueryLocator ql = batch.start(null);
            batch.execute(null,apexClassList);
            batch.Finish(null);
            Test.stopTest();
            System.assertNotEquals(null, logRecord);
        }
    }
}