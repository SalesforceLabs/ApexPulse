/**
* @description       : Test Class for ApexHealthUtility
* @author            : Goutham Cheedella/Logesh M
* @project           : ApexPulse
* @last modified on  : 07-24-2024
* @last modified by  : gcheedella@salesforce.com
**/
@isTest
public class ApexHealthUtilityTest {
    /**
* @description testFetchApexClassMember
*/
    @isTest
    static void testFetchApexClassMember() {
        // Sample JSON response to test with
        String jsonResponse =		'{'+
            '    "size": 1,'+
            '    "totalSize": 1,'+
            '    "done": true,'+
            '    "queryLocator": null,'+
            '    "entityTypeName": "ApexClassMember",'+
            '    "records": ['+
            '        {'+
            '            "attributes": {'+
            '                "type": "ApexClassMember",'+
            '                "url": "/services/data/v59.0/tooling/sobjects/ApexClassMember/000000000000000000"'+
            '            },'+
            '            "Id": "00000000000000000",'+
            '            "ContentEntityId": "00000000000000000",'+
            '            "SymbolTable": {'+
            '                "constructors": [],'+
            '                "externalReferences": ['+
            '                    {'+
            '                        "methods": ['+
            '                            {'+
            '                                "argTypes": [],'+
            '                                "isStatic": false,'+
            '                                "methodDoc": null,'+
            '                                "name": "toExternalForm",'+
            '                                "parameters": [],'+
            '                                "references": ['+
            '                                    {'+
            '                                        "column": 51,'+
            '                                        "line": 14'+
            '                                    }'+
            '                                ],'+
            '                                "returnType": null'+
            '                            },'+
            '                            {'+
            '                                "argTypes": [],'+
            '                                "isStatic": false,'+
            '                                "methodDoc": null,'+
            '                                "name": "getOrgDomainUrl",'+
            '                                "parameters": [],'+
            '                                "references": ['+
            '                                    {'+
            '                                        "column": 33,'+
            '                                        "line": 14'+
            '                                    }'+
            '                                ],'+
            '                                "returnType": null'+
            '                            }'+
            '                        ],'+
            '                        "name": "Url",'+
            '                        "namespace": "System",'+
            '                        "references": [],'+
            '                        "variables": []'+
            '                    },'+
            '                    {'+
            '                        "methods": ['+
            '                            {'+
            '                                "argTypes": [],'+
            '                                "isStatic": false,'+
            '                                "methodDoc": null,'+
            '                                "name": "getSessionId",'+
            '                                "parameters": [],'+
            '                                "references": ['+
            '                                    {'+
            '                                        "column": 64,'+
            '                                        "line": 21'+
            '                                    }'+
            '                                ],'+
            '                                "returnType": null'+
            '                            }'+
            '                        ],'+
            '                        "name": "UserInfo",'+
            '                        "namespace": "System",'+
            '                        "references": [],'+
            '                        "variables": []'+
            '                    }'+
            '                ],'+
            '                "id": "00000000000000000",'+
            '                "innerClasses": [],'+
            '                "interfaces": [],'+
            '                "key": "00000000000000000",'+
            '                "methods": ['+
            '                    {'+
            '                        "annotations": [],'+
            '                        "location": {'+
            '                            "column": 26,'+
            '                            "line": 9'+
            '                        },'+
            '                        "modifiers": ['+
            '                            "static",'+
            '                            "public"'+
            '                        ],'+
            '                        "name": "fetchApexClassMember",'+
            '                        "parameters": ['+
            '                            {'+
            '                                "name": "contentEntityId",'+
            '                                "type": "String"'+
            '                            }'+
            '                        ],'+
            '                        "references": [],'+
            '                        "returnType": "String",'+
            '                        "type": null'+
            '                    }'+
            '                ],'+
            '                "name": "ApexHealthUtility",'+
            '                "namespace": null,'+
            '                "parentClass": "",'+
            '                "properties": [],'+
            '                "tableDeclaration": {'+
            '                    "annotations": [],'+
            '                    "location": {'+
            '                        "column": 27,'+
            '                        "line": 8'+
            '                    },'+
            '                    "modifiers": ['+
            '                        "public",'+
            '                        "with sharing"'+
            '                    ],'+
            '                    "name": "ApexHealthUtility",'+
            '                    "references": [],'+
            '                    "type": "ApexHealthUtility"'+
            '                },'+
            '                "variables": ['+
            '                    {'+
            '                        "annotations": [],'+
            '                        "location": {'+
            '                            "column": 54,'+
            '                            "line": 9'+
            '                        },'+
            '                        "modifiers": [],'+
            '                        "name": "contentEntityId",'+
            '                        "references": ['+
            '                            {'+
            '                                "column": 30,'+
            '                                "line": 11'+
            '                            },'+
            '                            {'+
            '                                "column": 68,'+
            '                                "line": 17'+
            '                            }'+
            '                        ],'+
            '                        "type": "String"'+
            '                    },'+
            '                    {'+
            '                        "annotations": [],'+
            '                        "location": {'+
            '                            "column": 16,'+
            '                            "line": 10'+
            '                        },'+
            '                        "modifiers": [],'+
            '                        "name": "response",'+
            '                        "references": ['+
            '                            {'+
            '                                "column": 13,'+
            '                                "line": 24'+
            '                            },'+
            '                            {'+
            '                                "column": 42,'+
            '                                "line": 25'+
            '                            },'+
            '                            {'+
            '                                "column": 16,'+
            '                                "line": 27'+
            '                            }'+
            '                        ],'+
            '                        "type": "String"'+
            '                    },'+
            '                    {'+
            '                        "annotations": [],'+
            '                        "location": {'+
            '                            "column": 18,'+
            '                            "line": 12'+
            '                        },'+
            '                        "modifiers": [],'+
            '                        "name": "httpProtocol",'+
            '                        "references": [],'+
            '                        "type": "System.Http"'+
            '                    },'+
            '                    {'+
            '                        "annotations": [],'+
            '                        "location": {'+
            '                            "column": 25,'+
            '                            "line": 13'+
            '                        },'+
            '                        "modifiers": [],'+
            '                        "name": "req",'+
            '                        "references": ['+
            '                            {'+
            '                                "column": 51,'+
            '                                "line": 23'+
            '                            }'+
            '                        ],'+
            '                        "type": "System.HttpRequest"'+
            '                    },'+
            '                    {'+
            '                        "annotations": [],'+
            '                        "location": {'+
            '                            "column": 26,'+
            '                            "line": 23'+
            '                        },'+
            '                        "modifiers": [],'+
            '                        "name": "resp",'+
            '                        "references": [],'+
            '                        "type": "System.HttpResponse"'+
            '                    }'+
            '                ]'+
            '            }'+
            '        }'+
            '    ]'+
            '}';
        // Set up the mock response
        Test.setMock(HttpCalloutMock.class, new ApexHealthUtilityHttpMock(jsonResponse));
        
        // Call the method to test
        String contentEntityId = '12345';
        String loadId = '20230101120000';
        
        User testUser = ApexHealthTestUtility.createUserWithPermissionSet();
        System.runAs(testUser){
            Test.startTest();
            ApexHealth__c result = ApexHealthUtility.fetchApexClassMember(contentEntityId, loadId);
            Test.stopTest();
            // Verify the results
            System.assertNotEquals(null, result, 'ApexHealth__c record should not be null');
        }
        
    }
    /**
* @description testExtractApexMethodsScanResults
*/
    @isTest
    static void testExtractApexMethodsScanResults() {
        // Sample JSON response to test with
        String jsonResponse =		'{'+
            '    "size": 1,'+
            '    "totalSize": 1,'+
            '    "done": true,'+
            '    "queryLocator": null,'+
            '    "entityTypeName": "ApexClassMember",'+
            '    "records": ['+
            '        {'+
            '            "attributes": {'+
            '                "type": "ApexClassMember",'+
            '                "url": "/services/data/v59.0/tooling/sobjects/ApexClassMember/000000000000000000"'+
            '            },'+
            '            "Id": "00000000000000000",'+
            '            "ContentEntityId": "00000000000000000",'+
            '            "SymbolTable": {'+
            '                "constructors": [],'+
            '                "externalReferences": ['+
            '                    {'+
            '                        "methods": ['+
            '                            {'+
            '                                "argTypes": [],'+
            '                                "isStatic": false,'+
            '                                "methodDoc": null,'+
            '                                "name": "toExternalForm",'+
            '                                "parameters": [],'+
            '                                "references": ['+
            '                                    {'+
            '                                        "column": 51,'+
            '                                        "line": 14'+
            '                                    }'+
            '                                ],'+
            '                                "returnType": null'+
            '                            },'+
            '                            {'+
            '                                "argTypes": [],'+
            '                                "isStatic": false,'+
            '                                "methodDoc": null,'+
            '                                "name": "getOrgDomainUrl",'+
            '                                "parameters": [],'+
            '                                "references": ['+
            '                                    {'+
            '                                        "column": 33,'+
            '                                        "line": 14'+
            '                                    }'+
            '                                ],'+
            '                                "returnType": null'+
            '                            }'+
            '                        ],'+
            '                        "name": "Url",'+
            '                        "namespace": "System",'+
            '                        "references": [],'+
            '                        "variables": []'+
            '                    },'+
            '                    {'+
            '                        "methods": ['+
            '                            {'+
            '                                "argTypes": [],'+
            '                                "isStatic": false,'+
            '                                "methodDoc": null,'+
            '                                "name": "getSessionId",'+
            '                                "parameters": [],'+
            '                                "references": ['+
            '                                    {'+
            '                                        "column": 64,'+
            '                                        "line": 21'+
            '                                    }'+
            '                                ],'+
            '                                "returnType": null'+
            '                            }'+
            '                        ],'+
            '                        "name": "UserInfo",'+
            '                        "namespace": "System",'+
            '                        "references": [],'+
            '                        "variables": []'+
            '                    }'+
            '                ],'+
            '                "id": "00000000000000000",'+
            '                "innerClasses": [],'+
            '                "interfaces": [],'+
            '                "key": "00000000000000000",'+
            '                "methods": ['+
            '                    {'+
            '                        "annotations": [],'+
            '                        "location": {'+
            '                            "column": 26,'+
            '                            "line": 9'+
            '                        },'+
            '                        "modifiers": ['+
            '                            "static",'+
            '                            "public"'+
            '                        ],'+
            '                        "name": "fetchApexClassMember",'+
            '                        "parameters": ['+
            '                            {'+
            '                                "name": "contentEntityId",'+
            '                                "type": "String"'+
            '                            }'+
            '                        ],'+
            '                        "references": [],'+
            '                        "returnType": "String",'+
            '                        "type": null'+
            '                    }'+
            '                ],'+
            '                "name": "ApexHealthUtility",'+
            '                "namespace": null,'+
            '                "parentClass": "",'+
            '                "properties": [],'+
            '                "tableDeclaration": {'+
            '                    "annotations": [],'+
            '                    "location": {'+
            '                        "column": 27,'+
            '                        "line": 8'+
            '                    },'+
            '                    "modifiers": ['+
            '                        "public",'+
            '                        "with sharing"'+
            '                    ],'+
            '                    "name": "ApexHealthUtility",'+
            '                    "references": [],'+
            '                    "type": "ApexHealthUtility"'+
            '                },'+
            '                "variables": ['+
            '                    {'+
            '                        "annotations": [],'+
            '                        "location": {'+
            '                            "column": 54,'+
            '                            "line": 9'+
            '                        },'+
            '                        "modifiers": [],'+
            '                        "name": "contentEntityId",'+
            '                        "references": ['+
            '                            {'+
            '                                "column": 30,'+
            '                                "line": 11'+
            '                            },'+
            '                            {'+
            '                                "column": 68,'+
            '                                "line": 17'+
            '                            }'+
            '                        ],'+
            '                        "type": "String"'+
            '                    },'+
            '                    {'+
            '                        "annotations": [],'+
            '                        "location": {'+
            '                            "column": 16,'+
            '                            "line": 10'+
            '                        },'+
            '                        "modifiers": [],'+
            '                        "name": "response",'+
            '                        "references": ['+
            '                            {'+
            '                                "column": 13,'+
            '                                "line": 24'+
            '                            },'+
            '                            {'+
            '                                "column": 42,'+
            '                                "line": 25'+
            '                            },'+
            '                            {'+
            '                                "column": 16,'+
            '                                "line": 27'+
            '                            }'+
            '                        ],'+
            '                        "type": "String"'+
            '                    },'+
            '                    {'+
            '                        "annotations": [],'+
            '                        "location": {'+
            '                            "column": 18,'+
            '                            "line": 12'+
            '                        },'+
            '                        "modifiers": [],'+
            '                        "name": "httpProtocol",'+
            '                        "references": [],'+
            '                        "type": "System.Http"'+
            '                    },'+
            '                    {'+
            '                        "annotations": [],'+
            '                        "location": {'+
            '                            "column": 25,'+
            '                            "line": 13'+
            '                        },'+
            '                        "modifiers": [],'+
            '                        "name": "req",'+
            '                        "references": ['+
            '                            {'+
            '                                "column": 51,'+
            '                                "line": 23'+
            '                            }'+
            '                        ],'+
            '                        "type": "System.HttpRequest"'+
            '                    },'+
            '                    {'+
            '                        "annotations": [],'+
            '                        "location": {'+
            '                            "column": 26,'+
            '                            "line": 23'+
            '                        },'+
            '                        "modifiers": [],'+
            '                        "name": "resp",'+
            '                        "references": [],'+
            '                        "type": "System.HttpResponse"'+
            '                    }'+
            '                ]'+
            '            }'+
            '        }'+
            '    ]'+
            '}';
        String loadId = '20230101120000';
        User testUser = ApexHealthTestUtility.createUserWithPermissionSet();
        System.runAs(testUser){
            // Call the method to test
            Test.startTest();
            ApexHealth__c result = ApexHealthUtility.extractApexMethodsScanResults(jsonResponse, loadId);
            Test.stopTest();
            
            // Verify the results
            System.assertNotEquals(null, result, 'ApexHealth__c record should not be null');
        }
        
    }
    /**
* @description testGenerateLoadId
*/
    @isTest
    static void testGenerateLoadId() {
        
        User testUser = ApexHealthTestUtility.createUserWithPermissionSet();
        System.runAs(testUser){
            // Call the method to test
            Test.startTest();
            String loadId = ApexHealthUtility.generateLoadId();
            Test.stopTest();
            
            // Verify the results
            System.assertNotEquals(null, loadId, 'LoadId should not be null');
            System.assertEquals(14, loadId.length(), 'LoadId should be 14 characters long');
        }
        
    }
    /**
* @description testInvokeApexHealth_BAT_ProcessACData
*/
    @isTest
    static void testInvokeApexHealth_BAT_ProcessACData() {
        // Sample JSON response to test with
        String jsonResponse =		'{'+
            '    "size": 1,'+
            '    "totalSize": 1,'+
            '    "done": true,'+
            '    "queryLocator": null,'+
            '    "entityTypeName": "ApexClassMember",'+
            '    "records": ['+
            '        {'+
            '            "attributes": {'+
            '                "type": "ApexClassMember",'+
            '                "url": "/services/data/v59.0/tooling/sobjects/ApexClassMember/000000000000000000"'+
            '            },'+
            '            "Id": "00000000000000000",'+
            '            "ContentEntityId": "00000000000000000",'+
            '            "SymbolTable": {'+
            '                "constructors": [],'+
            '                "externalReferences": ['+
            '                    {'+
            '                        "methods": ['+
            '                            {'+
            '                                "argTypes": [],'+
            '                                "isStatic": false,'+
            '                                "methodDoc": null,'+
            '                                "name": "toExternalForm",'+
            '                                "parameters": [],'+
            '                                "references": ['+
            '                                    {'+
            '                                        "column": 51,'+
            '                                        "line": 14'+
            '                                    }'+
            '                                ],'+
            '                                "returnType": null'+
            '                            },'+
            '                            {'+
            '                                "argTypes": [],'+
            '                                "isStatic": false,'+
            '                                "methodDoc": null,'+
            '                                "name": "getOrgDomainUrl",'+
            '                                "parameters": [],'+
            '                                "references": ['+
            '                                    {'+
            '                                        "column": 33,'+
            '                                        "line": 14'+
            '                                    }'+
            '                                ],'+
            '                                "returnType": null'+
            '                            }'+
            '                        ],'+
            '                        "name": "Url",'+
            '                        "namespace": "System",'+
            '                        "references": [],'+
            '                        "variables": []'+
            '                    },'+
            '                    {'+
            '                        "methods": ['+
            '                            {'+
            '                                "argTypes": [],'+
            '                                "isStatic": false,'+
            '                                "methodDoc": null,'+
            '                                "name": "getSessionId",'+
            '                                "parameters": [],'+
            '                                "references": ['+
            '                                    {'+
            '                                        "column": 64,'+
            '                                        "line": 21'+
            '                                    }'+
            '                                ],'+
            '                                "returnType": null'+
            '                            }'+
            '                        ],'+
            '                        "name": "UserInfo",'+
            '                        "namespace": "System",'+
            '                        "references": [],'+
            '                        "variables": []'+
            '                    }'+
            '                ],'+
            '                "id": "00000000000000000",'+
            '                "innerClasses": [],'+
            '                "interfaces": [],'+
            '                "key": "00000000000000000",'+
            '                "methods": ['+
            '                    {'+
            '                        "annotations": [],'+
            '                        "location": {'+
            '                            "column": 26,'+
            '                            "line": 9'+
            '                        },'+
            '                        "modifiers": ['+
            '                            "static",'+
            '                            "public"'+
            '                        ],'+
            '                        "name": "fetchApexClassMember",'+
            '                        "parameters": ['+
            '                            {'+
            '                                "name": "contentEntityId",'+
            '                                "type": "String"'+
            '                            }'+
            '                        ],'+
            '                        "references": [],'+
            '                        "returnType": "String",'+
            '                        "type": null'+
            '                    }'+
            '                ],'+
            '                "name": "ApexHealthUtility",'+
            '                "namespace": null,'+
            '                "parentClass": "",'+
            '                "properties": [],'+
            '                "tableDeclaration": {'+
            '                    "annotations": [],'+
            '                    "location": {'+
            '                        "column": 27,'+
            '                        "line": 8'+
            '                    },'+
            '                    "modifiers": ['+
            '                        "public",'+
            '                        "with sharing"'+
            '                    ],'+
            '                    "name": "ApexHealthUtility",'+
            '                    "references": [],'+
            '                    "type": "ApexHealthUtility"'+
            '                },'+
            '                "variables": ['+
            '                    {'+
            '                        "annotations": [],'+
            '                        "location": {'+
            '                            "column": 54,'+
            '                            "line": 9'+
            '                        },'+
            '                        "modifiers": [],'+
            '                        "name": "contentEntityId",'+
            '                        "references": ['+
            '                            {'+
            '                                "column": 30,'+
            '                                "line": 11'+
            '                            },'+
            '                            {'+
            '                                "column": 68,'+
            '                                "line": 17'+
            '                            }'+
            '                        ],'+
            '                        "type": "String"'+
            '                    },'+
            '                    {'+
            '                        "annotations": [],'+
            '                        "location": {'+
            '                            "column": 16,'+
            '                            "line": 10'+
            '                        },'+
            '                        "modifiers": [],'+
            '                        "name": "response",'+
            '                        "references": ['+
            '                            {'+
            '                                "column": 13,'+
            '                                "line": 24'+
            '                            },'+
            '                            {'+
            '                                "column": 42,'+
            '                                "line": 25'+
            '                            },'+
            '                            {'+
            '                                "column": 16,'+
            '                                "line": 27'+
            '                            }'+
            '                        ],'+
            '                        "type": "String"'+
            '                    },'+
            '                    {'+
            '                        "annotations": [],'+
            '                        "location": {'+
            '                            "column": 18,'+
            '                            "line": 12'+
            '                        },'+
            '                        "modifiers": [],'+
            '                        "name": "httpProtocol",'+
            '                        "references": [],'+
            '                        "type": "System.Http"'+
            '                    },'+
            '                    {'+
            '                        "annotations": [],'+
            '                        "location": {'+
            '                            "column": 25,'+
            '                            "line": 13'+
            '                        },'+
            '                        "modifiers": [],'+
            '                        "name": "req",'+
            '                        "references": ['+
            '                            {'+
            '                                "column": 51,'+
            '                                "line": 23'+
            '                            }'+
            '                        ],'+
            '                        "type": "System.HttpRequest"'+
            '                    },'+
            '                    {'+
            '                        "annotations": [],'+
            '                        "location": {'+
            '                            "column": 26,'+
            '                            "line": 23'+
            '                        },'+
            '                        "modifiers": [],'+
            '                        "name": "resp",'+
            '                        "references": [],'+
            '                        "type": "System.HttpResponse"'+
            '                    }'+
            '                ]'+
            '            }'+
            '        }'+
            '    ]'+
            '}';
        // Set up the mock response
        Test.setMock(HttpCalloutMock.class, new ApexHealthUtilityHttpMock(jsonResponse));
        List<List<ApexClass>> apexClassList = new List<List<ApexClass>>();
        List<ApexClass> apexList1 = [Select Id,Name from ApexClass Limit 1];
        List<ApexClass> apexList2 = [Select Id,Name from ApexClass Limit 1];
        apexClassList.add(apexList1);
        apexClassList.add(apexList2);
        
        User testUser = ApexHealthTestUtility.createUserWithPermissionSet();
        System.runAs(testUser){
            Test.startTest();
            ApexHealthUtility.invokeApexHealth_BAT_ProcessACData(apexClassList);
            Test.stopTest();
        }
    }
    /**
* @description testGetApexHealthRecords
*/
    @isTest
    static void testGetApexHealthRecords() {
        
        User testUser = ApexHealthTestUtility.createUserWithPermissionSet();
        System.runAs(testUser){
            // Insert test records
            List<ApexHealth__c> records = new List<ApexHealth__c>{
                new ApexHealth__c(ClassName__c='TestClass1'),
                    new ApexHealth__c(ClassName__c='TestClass2')
                    };
                        insert records;
            
            // Call the method to test
            Test.startTest();
            List<ApexHealth__c> result = ApexHealthUtility.getApexHealthRecords();
            Test.stopTest();
            // Verify the results
            System.assertEquals(2, result.size(), 'There should be 2 records returned');
            System.assertEquals('TestClass1', result[0].ClassName__c, 'First record ClassName should be "TestClass1"');
            System.assertEquals('TestClass2', result[1].ClassName__c, 'Second record ClassName should be "TestClass2"');
        }
        
        
    }
    /**
* @description testGetSalesforceDomain
*/
    @isTest
    static void testGetSalesforceDomain() {
        
        User testUser = ApexHealthTestUtility.createUserWithPermissionSet();
        System.runAs(testUser){
            // Call the method to test
            Test.startTest();
            String domain = ApexHealthUtility.getSalesforceDomain();
            Test.stopTest();
            // Verify the results
            System.assertNotEquals(null, domain, 'Domain should not be null');
            System.assert(domain.startsWith('https://'), 'Domain should start with "https://"');
        }
        
        
    }
    /**
* @description testSendBatchCompletionEmail
*/
    @isTest
    static void testSendBatchCompletionEmail(){
        String reason = 'Sample';
        User testUser = ApexHealthTestUtility.createUserWithPermissionSet();
        
        System.runAs(testUser){
            Test.startTest();
            ApexHealthUtility.sendBatchCompletionEmail(reason);
            Test.stopTest();
        }
    }
    /**
* @description testcreateLog
*/
    @isTest
    static void testcreateLog(){
        String EntityName = 'Sample Entity';
        String ErrorMsg = 'Sample Error Message';
        String LoadId = '1234567890';
        DateTime LoggedTime = System.now();
        String stackTace = 'Sample';
        
        Logger__c loggerRec = new Logger__c();
        loggerRec.EntityName__c = EntityName;
        loggerRec.ErrorMessage__c = ErrorMsg;
        loggerRec.LoadId__c = LoadId;
        loggerRec.LoggedTime__c = LoggedTime;
        loggerRec.StackTrace__c = stackTace;
        
        User testUser = ApexHealthTestUtility.createUserWithPermissionSet();
        System.runAs(testUser){
            Test.startTest();
            Logger__c result = ApexHealthUtility.createLog(EntityName,ErrorMsg,LoadId,LoggedTime,stackTace);
            Test.stopTest();
            
            System.assertNotEquals(null, result, 'The result should not be null.');
            System.assertEquals(entityName, result.EntityName__c, 'The EntityName__c field should match.');
            System.assertEquals(errorMsg, result.ErrorMessage__c, 'The ErrorMessage__c field should match.');
        }
        
    }
    /**
* @description ApexHealthUtilityHttpMock
*/
    private class ApexHealthUtilityHttpMock implements HttpCalloutMock {
        /**
* @description jsonResponse
*/
        private String jsonResponse;
        ApexHealthUtilityHttpMock(String jsonResponse) {
            this.jsonResponse = jsonResponse;
        }
        public HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            res.setBody(jsonResponse);
            res.setStatusCode(200);
            return res;
        }
    }
}