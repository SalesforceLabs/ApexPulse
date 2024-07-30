/**
* @description       : Utility class for ApexPulse
* @author            : Goutham Cheedella/Logesh M
* @group             : ApexPulse
* @last modified on  : 07-25-2024
* @last modified by  : gcheedella@salesforce.com
**/
public with sharing class ApexHealthUtility {
    /**
     * @description fetchApexClassMember
     * @param contentEntityId
     * @param loadId
     * @return ApexHealth__c
     */
    public static ApexHealth__c fetchApexClassMember(String contentEntityId, String loadId) {
        String response = '';
        ApexHealth__c ahRecord = new ApexHealth__c();
        if(String.isNotBlank(contentEntityId)){
            Http httpProtocol = new Http();
            HttpRequest req = new HttpRequest();
            req.setEndpoint(URL.getOrgDomainURL().toExternalForm() +
                            '/services/data/v59.0/tooling/query/?q=' +
                            'SELECT+Id,+ContentEntityId,+SymbolTable' +
                            '+FROM+ApexClassMember+where+ContentEntityId=\'' + contentEntityId + '\'');
            req.setMethod('GET');
            req.setHeader('Content-Type', 'application/json');
            req.setHeader('Accept', 'application/json');
            req.setHeader('Authorization', 'OAuth ' + UserInfo.getSessionId());
            req.setTimeout(20000); // Increase the timeout if needed
            HttpResponse resp = httpProtocol.send(req);
            response = resp.getBody();
            ahRecord = extractApexMethodsScanResults(response, loadId);
            if(Schema.sObjectType.ApexHealth__c.fields.EntityId__c.isAccessible()){
                ahRecord.EntityId__c = contentEntityId;
            }
        }
        return ahRecord;
    }
    /**
     * @description extractApexMethodsScanResults
     * @param jsonString
     * @param loadId
     * @return ApexHealth__c
     */
    public static ApexHealth__c extractApexMethodsScanResults(String jsonString, String loadId){
        // Initialize counters
        Integer referencedMethodsCount = 0;
        Integer unreferencedMethodsCount = 0;
        Integer referencedVariablesCount = 0;
        Integer unreferencedVariablesCount = 0;
        String clsName ='';

        String variablesPresent ='';
        String variablesUsed ='';
        String variablesUnused ='';

        String methodsPresent ='';
        String methodsUsed ='';
        String methodsUnused ='';

        if(String.isNotBlank(jsonString)){
            ApexHealth_ScanJSONUtility parser = new ApexHealth_ScanJSONUtility();
            // Deserialize the JSON string into an instance of ApexHealth_ScanJSONUtility
            parser = (ApexHealth_ScanJSONUtility)JSON.deserialize(jsonString, ApexHealth_ScanJSONUtility.class);
            // Get the formatted map
            Map<String, Map<String,Map<String, String>>> resultMap = parser.getFormattedMethodAndVariableReferencesAsMap();
            // Output the result map
            if(!resultMap.isEmpty()){
                // Iterate through the map to count references
                for (String className : resultMap.keySet()) {
                    clsName = className;
                    Map<String, Map<String, String>> referenceTypeMap = resultMap.get(className);
                    
                    // Process method references
                    Map<String, String> methodReferences = new Map<String, String>();
                    if(referenceTypeMap.containsKey('Method Reference')){
                        methodReferences = referenceTypeMap.get('Method Reference');
                        if(!methodReferences.isEmpty()){
                            for (String methodName : methodReferences.keySet()) {
                                methodsPresent +=methodName+'; ';
                                String referenceValue = methodReferences.get(methodName);
                                if (referenceValue.contains('no reference')) {
                                    methodsUnused+=methodName+'; ';
                                    unreferencedMethodsCount++;
                                } else {
                                    methodsUsed+=methodName+'; ';
                                    referencedMethodsCount++;
                                }
                            }
                        }
                    }
                    // Process variable references
                    Map<String, String> variableReferences = new Map<String, String>();
                    if(referenceTypeMap.containsKey('Variable Reference')){
                        variableReferences = referenceTypeMap.get('Variable Reference');
                        if(!variableReferences.isEmpty()){
                            for (String variableName : variableReferences.keySet()) {
                                variablesPresent+= variableName+'; ';
                                String referenceValue = variableReferences.get(variableName);
                                if (referenceValue.contains('no reference')) {
                                    unreferencedVariablesCount++;
                                    variablesUnused+=variableName+'; ';
                                } else {
                                    referencedVariablesCount++;
                                    variablesUsed+=variableName+'; ';
                                }
                            }
                        }
                    }
                }
            }
        }
        ApexHealth__c ahRec = new ApexHealth__c();
        if (Schema.sObjectType.ApexHealth__c.fields.LoadId__c.isAccessible()) {
            ahRec.LoadId__c = loadId; // Add LoadId to the record
        }
        if (Schema.sObjectType.ApexHealth__c.fields.NbOfVariablesPresent__c.isAccessible()) {
            ahRec.NbOfVariablesPresent__c = referencedVariablesCount + unreferencedVariablesCount;
        }
        if (Schema.sObjectType.ApexHealth__c.fields.NbOfVariablesUsed__c.isAccessible()) {
            ahRec.NbOfVariablesUsed__c = referencedVariablesCount;
        }
        if (Schema.sObjectType.ApexHealth__c.fields.NbOfVariablesUnused__c.isAccessible()) {
            ahRec.NbOfVariablesUnused__c = unreferencedVariablesCount;
        }
        if (Schema.sObjectType.ApexHealth__c.fields.NbOfMethodsPresent__c.isAccessible()) {
            ahRec.NbOfMethodsPresent__c = referencedMethodsCount + unreferencedMethodsCount;
        }
        if (Schema.sObjectType.ApexHealth__c.fields.NbOfMethodsUsed__c.isAccessible()) {
            ahRec.NbOfMethodsUsed__c = referencedMethodsCount;
        }
        if (Schema.sObjectType.ApexHealth__c.fields.NbOfMethodsUnused__c.isAccessible()) {
            ahRec.NbOfMethodsUnused__c = unreferencedMethodsCount;
        }
        if (Schema.sObjectType.ApexHealth__c.fields.ClassName__c.isAccessible()) {
            ahRec.ClassName__c = clsName;
        }
        if (Schema.sObjectType.ApexHealth__c.fields.MethodsPresent__c.isAccessible()) {
            ahRec.MethodsPresent__c = methodsPresent;
        }
        if (Schema.sObjectType.ApexHealth__c.fields.MethodsUnused__c.isAccessible()) {
            ahRec.MethodsUnused__c = methodsUnused;
        }
        if (Schema.sObjectType.ApexHealth__c.fields.MethodsUsed__c.isAccessible()) {
            ahRec.MethodsUsed__c = methodsUsed;
        }
        if (Schema.sObjectType.ApexHealth__c.fields.VariablesPresent__c.isAccessible()) {
            ahRec.VariablesPresent__c = variablesPresent;
        }
        if (Schema.sObjectType.ApexHealth__c.fields.VariablesUnused__c.isAccessible()) {
            ahRec.VariablesUnused__c = variablesUnused;
        }
        if (Schema.sObjectType.ApexHealth__c.fields.VariablesUsed__c.isAccessible()) {
            ahRec.VariablesUsed__c = variablesUsed;
        }
        return ahRec;
    }
    /**
     * @description generateLoadId
     * @return string
     */
    public static string generateLoadId(){
        DateTime now = DateTime.now();
        String loadId = now.format('yyyyMMddHHmmss');
        return loadId;
    }

    /**
     * @description invokeApexHealth_BAT_ProcessACData
     * @param apexClassList
     */
    @InvocableMethod(label='Invoke Batch - ApexHealth_BAT_ProcessACData' description='Makes a callout to run the Batch job - ApexHealth_BAT_ProcessACData')
    public static void invokeApexHealth_BAT_ProcessACData(List<List<ApexClass>> apexClassList) {
        
        List<String> apexClassIdsSet = new List<String>();
        for(ApexClass apxc: apexClassList[0]){
            apexClassIdsSet.add(apxc.Id);
        }
        Database.executeBatch(new ApexHealth_BAT_ProcessACData(apexClassIdsSet));
    }
    /**
     * @description getApexHealthRecords
     * @return List<ApexHealth__c>
     */
    @AuraEnabled(cacheable=true)
    public static List<ApexHealth__c> getApexHealthRecords() {
        try {
            return [select id,ClassName__c,LoadId__c,Name,NbOfMethodsPresent__c,NbOfMethodsUsed__c,NbOfVariablesPresent__c,NbOfVariablesUsed__c,MethodsPresent__c,MethodsUsed__c,MethodsUnused__c,VariablesPresent__c,VariablesUsed__c,VariablesUnused__c,EntityId__c,NbOfMethodsUnused__c,NbOfVariablesUnused__c,HealthPercentage__c from ApexHealth__c LIMIT 50000];
        } catch (Exception e) {
            throw new AuraHandledException('Error fetching health records: ' + e.getMessage());
        }
    }
    /**
     * @desc getSalesforceDomain
     * @return String
     */
    @AuraEnabled(cacheable=true)
    public static String getSalesforceDomain() {
        // Retrieve the Salesforce instance base URL
        String baseUrl = URL.getOrgDomainUrl().toExternalForm();
        // Return the base URL
        return baseUrl;
    }
    /**
     * @description sendBatchCompletionEmail
     */
    public static void sendBatchCompletionEmail(String reason) {
        String currentUserEmail = UserInfo.getUserEmail();
        String body = 'Dear User,\n\n' +
                      'We are pleased to inform you that the apex scan you requested has successfully completed.\n' +
                      'Component Name - ApexHealth_BAT_ProcessACData\n' +
                      reason+'\n\n\n' +
                      'Regards,\n' +
                      'ApexPulse\n';
        List<String> emailAddList = new List<String>();
        emailAddList.add(currentUserEmail);
        // Create the email
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        // Set email properties
        email.setToAddresses(emailAddList);
        email.setSubject('Notification: The batch job has finished.');
        email.setPlainTextBody(body);
        // Send the email
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { email });
    }
    /**
     * @desc createLog
     * @param EntityName
     * @param ErrorMsg
     * @param LoadId
     * @param LoggedTime
     * @param stackTace
     * @return Logger__c
     */
    public static Logger__c createLog(String EntityName, String ErrorMsg, String LoadId, DateTime LoggedTime, String stackTrace){
        Logger__c loggerRec = new Logger__c();
        if (Schema.sObjectType.Logger__c.fields.EntityName__c.isAccessible()) {
            loggerRec.EntityName__c = EntityName;
        }
        if (Schema.sObjectType.Logger__c.fields.ErrorMessage__c.isAccessible()) {
            loggerRec.ErrorMessage__c = ErrorMsg;
        }
        if (Schema.sObjectType.Logger__c.fields.LoadId__c.isAccessible()) {
            loggerRec.LoadId__c = LoadId;
        }
        if (Schema.sObjectType.Logger__c.fields.LoggedTime__c.isAccessible()) {
            loggerRec.LoggedTime__c = LoggedTime;
        }
        if (Schema.sObjectType.Logger__c.fields.StackTrace__c.isAccessible()) {
            loggerRec.StackTrace__c = stackTrace;
        }
        return loggerRec;
    }

    /**
     * @description convertToStrings
     * @param apexClassIds
     * @return List<String>
     */
    public static List<String> convertToStrings(List<String> apexClassIds){
        List<String> idList = new List<String>();
        if(!apexClassIds.isEmpty()){
            for (String ids : apexClassIds) {
                String idString = Id.valueOf(ids);
                idList.add(idString);
            }
        }
        return idList;
    }
}