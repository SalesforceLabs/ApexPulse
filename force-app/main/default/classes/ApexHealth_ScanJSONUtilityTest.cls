/**
 * @description       : Test Class for ApexHealth_ScanJSONUtility
 * @author            : Goutham Cheedella/Logesh M
 * @project           : ApexPulse
 * @last modified on  : 07-24-2024
 * @last modified by  : gcheedella@salesforce.com
**/
@isTest
public class ApexHealth_ScanJSONUtilityTest {
    /**
     * @description testGetCurrentClassMethodsWithoutNamespace
     */
    @isTest
    static void testGetCurrentClassMethodsWithoutNamespace() {
        // Setup test data
        ApexHealth_ScanJSONUtility.cls_methods method1 = new ApexHealth_ScanJSONUtility.cls_methods();
        method1.name = 'method1';
        method1.references = new List<ApexHealth_ScanJSONUtility.cls_references>();
        
        ApexHealth_ScanJSONUtility.cls_methods method2 = new ApexHealth_ScanJSONUtility.cls_methods();
        method2.name = 'method2';
        method2.references = new List<ApexHealth_ScanJSONUtility.cls_references>();
        
        ApexHealth_ScanJSONUtility.cls_SymbolTable symbolTable = new ApexHealth_ScanJSONUtility.cls_SymbolTable();
        symbolTable.methods = new List<ApexHealth_ScanJSONUtility.cls_methods>{method1, method2};
        symbolTable.namespace = null; // Ensure namespace is null
        
        ApexHealth_ScanJSONUtility.cls_records record = new ApexHealth_ScanJSONUtility.cls_records();
        record.SymbolTable = symbolTable;
        
        ApexHealth_ScanJSONUtility parserUtility = new ApexHealth_ScanJSONUtility();
        parserUtility.records = new List<ApexHealth_ScanJSONUtility.cls_records>{record};
        
            User testUser = ApexHealthTestUtility.createUserWithPermissionSet();
        System.runAs(testUser){
            Test.startTest();
        // Test method
        List<ApexHealth_ScanJSONUtility.cls_methods> methodsWithoutNamespace = parserUtility.getCurrentClassMethodsWithoutNamespace();
        Test.stopTest();
        // Verify results
        System.assertEquals(2, methodsWithoutNamespace.size(), 'Should return 2 methods without namespace');
        System.assertEquals('method1', methodsWithoutNamespace[0].name, 'First method name should be method1');
        System.assertEquals('method2', methodsWithoutNamespace[1].name, 'Second method name should be method2');
        }
    }
    /**
     * @description testGetCurrentClassMethodReferences
     */
    @isTest
    static void testGetCurrentClassMethodReferences() {
        // Setup test data
        ApexHealth_ScanJSONUtility.cls_references ref1 = new ApexHealth_ScanJSONUtility.cls_references();
        ref1.line = 10;
        ref1.column = 5;
        
        ApexHealth_ScanJSONUtility.cls_methods method = new ApexHealth_ScanJSONUtility.cls_methods();
        method.name = 'method1';
        method.references = new List<ApexHealth_ScanJSONUtility.cls_references>{ref1};
        
        ApexHealth_ScanJSONUtility parserUtility = new ApexHealth_ScanJSONUtility();
        
        User testUser = ApexHealthTestUtility.createUserWithPermissionSet();
        System.runAs(testUser){
        
        // Test method
        Test.startTest();
        List<ApexHealth_ScanJSONUtility.cls_references> references = parserUtility.getCurrentClassMethodReferences(method);
        Test.stopTest();
        // Verify results
        System.assertEquals(1, references.size(), 'Should return 1 reference');
        System.assertEquals(10, references[0].line, 'Reference line should be 10');
        System.assertEquals(5, references[0].column, 'Reference column should be 5');
        }
    }
    /**
     * @description testGetCurrentClassVariablesWithoutNamespace
     */
    @isTest
    static void testGetCurrentClassVariablesWithoutNamespace() {
        // Setup test data
        ApexHealth_ScanJSONUtility.cls_variables var1 = new ApexHealth_ScanJSONUtility.cls_variables();
        var1.name = 'variable1';
        var1.references = new List<ApexHealth_ScanJSONUtility.cls_references>();
        
        ApexHealth_ScanJSONUtility.cls_SymbolTable symbolTable = new ApexHealth_ScanJSONUtility.cls_SymbolTable();
        symbolTable.variables = new List<ApexHealth_ScanJSONUtility.cls_variables>{var1};
        symbolTable.namespace = null; // Ensure namespace is null
        
        ApexHealth_ScanJSONUtility.cls_records record = new ApexHealth_ScanJSONUtility.cls_records();
        record.SymbolTable = symbolTable;
        
        ApexHealth_ScanJSONUtility parserUtility = new ApexHealth_ScanJSONUtility();
        parserUtility.records = new List<ApexHealth_ScanJSONUtility.cls_records>{record};
        
            User testUser = ApexHealthTestUtility.createUserWithPermissionSet();
        System.runAs(testUser){
        // Test method
        Test.startTest();
        List<ApexHealth_ScanJSONUtility.cls_variables> variablesWithoutNamespace = parserUtility.getCurrentClassVariablesWithoutNamespace();
        Test.stopTest();
            
        // Verify results
        System.assertEquals(1, variablesWithoutNamespace.size(), 'Should return 1 variable without namespace');
        System.assertEquals('variable1', variablesWithoutNamespace[0].name, 'Variable name should be variable1');
        }
    }
    /**
     * @description testGetCurrentClassVariableReferences
     */
    @isTest
    static void testGetCurrentClassVariableReferences() {
        // Setup test data
        ApexHealth_ScanJSONUtility.cls_references ref1 = new ApexHealth_ScanJSONUtility.cls_references();
        ref1.line = 15;
        ref1.column = 8;
        
        ApexHealth_ScanJSONUtility.cls_variables variable = new ApexHealth_ScanJSONUtility.cls_variables();
        variable.name = 'variable1';
        variable.references = new List<ApexHealth_ScanJSONUtility.cls_references>{ref1};
        
        ApexHealth_ScanJSONUtility parserUtility = new ApexHealth_ScanJSONUtility();
        
        User testUser = ApexHealthTestUtility.createUserWithPermissionSet();
        System.runAs(testUser){
        // Test method
        Test.startTest();
        List<ApexHealth_ScanJSONUtility.cls_references> references = parserUtility.getCurrentClassVariableReferences(variable);
        Test.stopTest();
        // Verify results
        System.assertEquals(1, references.size(), 'Should return 1 reference');
        System.assertEquals(15, references[0].line, 'Reference line should be 15');
        System.assertEquals(8, references[0].column, 'Reference column should be 8');
        }
    }
    /**
     * @description testGetFormattedMethodAndVariableReferencesAsMap
     */
    @isTest
    static void testGetFormattedMethodAndVariableReferencesAsMap() {
        // Setup test data
        ApexHealth_ScanJSONUtility.cls_references ref1 = new ApexHealth_ScanJSONUtility.cls_references();
        ref1.line = 20;
        ref1.column = 12;
        
        ApexHealth_ScanJSONUtility.cls_methods method = new ApexHealth_ScanJSONUtility.cls_methods();
        method.name = 'method1';
        method.references = new List<ApexHealth_ScanJSONUtility.cls_references>{ref1};
        
        ApexHealth_ScanJSONUtility.cls_variables variable = new ApexHealth_ScanJSONUtility.cls_variables();
        variable.name = 'variable1';
        variable.references = new List<ApexHealth_ScanJSONUtility.cls_references>{ref1};
        
        ApexHealth_ScanJSONUtility.cls_SymbolTable symbolTable = new ApexHealth_ScanJSONUtility.cls_SymbolTable();
        symbolTable.methods = new List<ApexHealth_ScanJSONUtility.cls_methods>{method};
        symbolTable.variables = new List<ApexHealth_ScanJSONUtility.cls_variables>{variable};
        symbolTable.namespace = null; // Ensure namespace is null
        
        ApexHealth_ScanJSONUtility.cls_records record = new ApexHealth_ScanJSONUtility.cls_records();
        record.SymbolTable = symbolTable;
        
        ApexHealth_ScanJSONUtility parserUtility = new ApexHealth_ScanJSONUtility();
        parserUtility.records = new List<ApexHealth_ScanJSONUtility.cls_records>{record};
            
        User testUser = ApexHealthTestUtility.createUserWithPermissionSet();
        System.runAs(testUser){
        // Test method
        Test.startTest();
        Map<String, Map<String,Map<String, String>>> formattedMap = parserUtility.getFormattedMethodAndVariableReferencesAsMap();
        // Verify results
        System.assertEquals(1, formattedMap.size(), 'Should return 1 class name');
        }
    }
}