/**
 * @description       : Utility to parse the apex class
 * @author            : Goutham Cheedella/Logesh M
 * @project           : ApexPulse
 * @last modified on  : 07-25-2024
 * @last modified by  : gcheedella@salesforce.com
**/
public with sharing class ApexHealth_ScanJSONUtility {
    /**
     * @description size
     */
    public Integer size; 
    /**
     * @description totalSize
     */
    public Integer totalSize; 
    /**
     * @description done
     */
    public boolean done;
    /**
     * @description queryLocator
     */
    public cls_queryLocator queryLocator;
    /**
     * @description entityTypeName
     */
    public String entityTypeName; 
    /**
     * @description records
     */
    public cls_records[] records;
    
    /**
     * @description cls_queryLocator
     */
    public class cls_queryLocator {
        // Define properties if needed
    }
    /**
     * @description cls_records
     */
    public class cls_records {
        /**
         * @description attributes
         */
        public cls_attributes attributes;
        /**
         * @description Id
         */
        public String Id; 
        /**
         * @description ContentEntityId
         */
        public String ContentEntityId; 
        /**
         * @description SymbolTable
         */
        public cls_SymbolTable SymbolTable;
    }
    /**
     * @description cls_attributes
     */
    public class cls_attributes {
        /**
         * @description type
         */
        public String type; 
        /**
         * @description url
         */
        public String url;
    }
    
    /**
     * @description cls_SymbolTable
     */
    public class cls_SymbolTable {
        /**
         * @description constructors
         */
        public cls_constructors[] constructors;
        /**
         * @description externalReferences
         */
        public cls_externalReferences[] externalReferences;
        /**
         * @description id
         */
        public String id; 
        /**
         * @description innerClasses
         */
        public cls_innerClasses[] innerClasses;
        /**
         * @description interfaces
         */
        public List<String> interfaces;
        /**
         * @description key
         */
        public String key;
        /**
         * @description methods
         */
        public cls_methods[] methods;
        /**
         * @description name
         */
        public String name;
        /**
         * @description namespace
         */
        public cls_namespace namespace;
        /**
         * @description parentClass
         */
        public String parentClass;
        /**
         * @description properties
         */
        public cls_properties[] properties;
        /**
         * @description tableDeclaration
         */
        public cls_tableDeclaration tableDeclaration;
        /**
         * @description variables
         */
        public cls_variables[] variables;
    }
    
    /**
     * @description cls_constructors
     */
    public class cls_constructors {
        // Define properties if needed
    }
    
    /**
     * @description cls_externalReferences
     */
    public class cls_externalReferences {
        /**
         * @description methods
         */
        public cls_methods[] methods;
        /**
         * @description name
         */
        public String name;
        /**
         * @description namespace
         */
        public String namespace;
        /**
         * @description references
         */
        public cls_references[] references;
        /**
         * @description variables
         */
        public cls_variables[] variables;
    }
    
    /**
     * @description cls_methods
     */
    public class cls_methods {
        /**
         * @description annotations
         */
        public cls_annotations[] annotations;
        /**
         * @description location
         */
        public cls_location location;
        /**
         * @description modifiers
         */
        public String[] modifiers;
        /**
         * @description name
         */
        public String name;
        /**
         * @description parameters
         */
        public cls_parameters[] parameters;
        /**
         * @description references
         */
        public cls_references[] references;
        /**
         * @description returnType
         */
        public String returnType;
        /**
         * @description type
         */
        public cls_type type;
    }
    
    /**
     * @description cls_parameters
     */
    public class cls_parameters {
        /**
         * @description name
         */
        public String name; 
        /**
         * @description type
         */
        public String type; 
    }
    
    /**
     * @description cls_references
     */
    public class cls_references {
        /**
         * @description column
         */
        public Integer column;
        /**
         * @description line
         */
        public Integer line;
    }
    
    /**
     * @description cls_variables
     */
    public class cls_variables {
        /**
         * @description annotations
         */
        public cls_annotations[] annotations;
        /**
         * @description location
         */
        public cls_location location;
        /**
         * @description modifiers
         */
        public String[] modifiers; 
        /**
         * @description name
         */
        public String name; 
        /**
         * @description references
         */
        public cls_references[] references;
        /**
         * @description type
         */
        public String type; 
    }
    
    /**
     * @description cls_innerClasses
     */
    public class cls_innerClasses {
        // Define properties if needed
    }
    
    /**
     * @description cls_interfaces
     */
    public class cls_interfaces {
        // Define properties if needed
    }
    
    /**
     * @description cls_annotations
     */
    public class cls_annotations {
        // Define properties if needed
    }
    
    /**
     * @description cls_location
     */
    public class cls_location {
        public Integer column;
        public Integer line;
    }
    
    /**
     * @description cls_type
     */
    public class cls_type {
        // Define properties if needed
    }
    
    /**
     * @description cls_namespace
     */
    public class cls_namespace {
        // Define properties if needed
    }
    
    /**
     * @description cls_properties
     */
    public class cls_properties {
        // Define properties if needed
    }
    
    /**
     * @description cls_tableDeclaration
     */
    public class cls_tableDeclaration {
        /**
         * @description annotations
         */
        public cls_annotations[] annotations;
        /**
         * @description location
         */
        public cls_location location;
        /**
         * @description modifiers
         */
        public String[] modifiers; 
        /**
         * @description name
         */
        public String name; 
        /**
         * @description references
         */
        public cls_references[] references;
        /**
         * @description type
         */
        public String type; 
    }
    /**
     * @description getCurrentClassMethodsWithoutNamespace Method to get all cls_methods from the current class without namespace
     * @return List<cls_methods>
     */
    public List<cls_methods> getCurrentClassMethodsWithoutNamespace() {
        List<cls_methods> currentClassMethodsWithoutNamespace = new List<cls_methods>();
        if (records != null) {
            for (cls_records record : records) {
                if (record.SymbolTable != null && record.SymbolTable.methods != null) {
                    if (record.SymbolTable.namespace == null || String.valueOf(record.SymbolTable.namespace) == '') {
                        currentClassMethodsWithoutNamespace.addAll(record.SymbolTable.methods);
                    }
                }
            }
        }
        return currentClassMethodsWithoutNamespace;
    }
    
    /**
     * @description getCurrentClassMethodReferences Method to get all cls_references from the current class methods
     * @param method
     * @return List<cls_references>
     */
    public List<cls_references> getCurrentClassMethodReferences(cls_methods method) {
        List<cls_references> currentClassMethodReferences = new List<cls_references>();
        if (method.references != null) {
            currentClassMethodReferences.addAll(method.references);
        }
        return currentClassMethodReferences;
    }
    
    /**
     * @description getCurrentClassVariablesWithoutNamespace Method to get all cls_variables from the current class without namespace
     * @return List<cls_variables>
     */
    public List<cls_variables> getCurrentClassVariablesWithoutNamespace() {
        List<cls_variables> currentClassVariablesWithoutNamespace = new List<cls_variables>();
        if (records != null) {
            for (cls_records record : records) {
                if (record.SymbolTable != null && record.SymbolTable.variables != null) {
                    if (record.SymbolTable.namespace == null || String.valueOf(record.SymbolTable.namespace) == '') {
                        currentClassVariablesWithoutNamespace.addAll(record.SymbolTable.variables);
                    }
                }
            }
        }
        return currentClassVariablesWithoutNamespace;
    }
    
    /**
     * @description getCurrentClassVariableReferences Method to get all cls_references from the current class variables
     * @param variable
     * @return List<cls_references>
     */
    public List<cls_references> getCurrentClassVariableReferences(cls_variables variable) {
        List<cls_references> currentClassVariableReferences = new List<cls_references>();
        if (variable.references != null) {
            currentClassVariableReferences.addAll(variable.references);
        }
        return currentClassVariableReferences;
    }
    
    /**
     * @description getFormattedMethodAndVariableReferencesAsMap Method to format the output as a nested map
     * @return Map<String, Map<String,Map<String, String>>>
     */
    public Map<String, Map<String,Map<String, String>>> getFormattedMethodAndVariableReferencesAsMap() {
        Map<String, Map<String,Map<String, String>>> formattedOutputMap = new  Map<String, Map<String,Map<String, String>>>();
        
        String entityType ='';
        if (records != null) {
            for (cls_records record : records) {
                if (record.SymbolTable != null) {
                    String className = record.SymbolTable.name;
                    
                    List<cls_methods> methodsWithoutNamespace = getCurrentClassMethodsWithoutNamespace();
                    Map<String,Map<String, String>> methodReferenceFinalMap = new Map<String,Map<String, String>>();
                    Map<String, String> methodReferenceMap = new Map<String, String>();
                    
                    for (cls_methods method : methodsWithoutNamespace) {
                        List<cls_references> references = getCurrentClassMethodReferences(method);
                        if (references.isEmpty()) {
                            methodReferenceMap.put(method.name, 'no reference');
                            methodReferenceFinalMap.put('Method Reference',methodReferenceMap);
                        } else {
                            String referencesString = '';
                            for (cls_references reference : references) {
                                referencesString += 'Line: ' + reference.line + ', Column: ' + reference.column + '; ';
                            }
                            // Remove the trailing "; "
                            if (referencesString.endsWith('; ')) {
                                referencesString = referencesString.substring(0, referencesString.length() - 2);
                            }
                            methodReferenceMap.put(method.name, referencesString);
                            methodReferenceFinalMap.put('Method Reference',methodReferenceMap);
                            
                        }
                    }
                    
                    List<cls_variables> variablesWithoutNamespace = getCurrentClassVariablesWithoutNamespace();
                    Map<String,Map<String, String>> variableReferenceFinalMap = new Map<String,Map<String, String>>();
                    Map<String, String> variableReferenceMap = new Map<String, String>();
                    
                    for (cls_variables variable : variablesWithoutNamespace) {
                        List<cls_references> references = getCurrentClassVariableReferences(variable);
                        if (references.isEmpty()) {
                            variableReferenceMap.put(variable.name, 'no reference');
                            variableReferenceFinalMap.put('Variable Reference',variableReferenceMap);
                        } else {
                            String referencesString = '';
                            for (cls_references reference : references) {
                                referencesString += 'Line: ' + reference.line + ', Column: ' + reference.column + '; ';
                            }
                            // Remove the trailing "; "
                            if (referencesString.endsWith('; ')) {
                                referencesString = referencesString.substring(0, referencesString.length() - 2);
                            }
                            variableReferenceMap.put(variable.name, referencesString);
                            variableReferenceFinalMap.put('Variable Reference',variableReferenceMap);
                            
                        }
                    }
                    
                    Map<String,Map<String, String>> combinedReferenceMap = methodReferenceFinalMap;
                    combinedReferenceMap.putAll(variableReferenceFinalMap);
                    formattedOutputMap.put(className, combinedReferenceMap);
                }
            }
        }
        return formattedOutputMap;
    }
}