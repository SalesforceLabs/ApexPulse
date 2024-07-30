/**
 * @description       : test class for ApexHealth_BAT_ProcessACData
 * @author            : Goutham Cheedella/ Logesh M
 * @project           : ApexPulse
 * @last modified on  : 07-25-2024
 * @last modified by  : gcheedella@salesforce.com
**/
@isTest
public class ApexHealth_BAT_ProcessACDataTest {
    /**
     * @description testBatchClass
     */
    @isTest
    public static void testBatchClass() {
        Test.setMock(HttpCalloutMock.class, new RestMock());
        
        List<ApexClass> apexClassList = [Select Id, Name from ApexClass Where Namespaceprefix = NULL And (NOT Name LIKE '%test%') Limit 2];
        
        List<String> apexClassIds = new List<String>();
        
        for(ApexClass apxc: apexClassList){
            apexClassIds.add(apxc.Id);
        }
        
        User testUser = ApexHealthTestUtility.createUserWithPermissionSet();
        System.runAs(testUser){
            ApexHealth__c apexHealthrecord = new ApexHealth__c(LoadId__c = '00000007');    
            insert apexHealthrecord;  
            // Verify expected results
            List<ApexHealth__c> insertedRecords = [SELECT Id, Name, LoadId__c FROM ApexHealth__c WHERE LoadId__c = '00000007'];
            
            Test.startTest();
            
            // Execute the batch class
            ApexHealth_BAT_ProcessACData batch = new ApexHealth_BAT_ProcessACData(apexClassIds);
            Database.QueryLocator ql = batch.start(null);
            batch.execute(null,apexClassList);
            batch.Finish(null);        
            Test.stopTest();

            System.assertEquals(1, insertedRecords.size(), 'The number of inserted ApexHealth__c records is incorrect.');
        }
        
    }
    /**
     * @description RestMock
     */
    private class RestMock implements HttpCalloutMock {
        /**
         * @description respond
         * @param req
         * @return HTTPResponse
         */
        public HTTPResponse respond(HTTPRequest req) {
            String fullJson=		'{'+
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
            HTTPResponse res = new HTTPResponse();
            res.setHeader('Content-Type', 'text/json');
            res.setBody(fullJson);
            res.setStatusCode(200);
            return res;
        }
    }
}