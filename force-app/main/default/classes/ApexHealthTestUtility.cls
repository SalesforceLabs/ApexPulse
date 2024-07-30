/**
 * @description       : test utility to create users
 * @author            : Goutham Cheedella/Logesh M
 * @project           : ApexPulse
 * @last modified on  : 07-25-2024
 * @last modified by  : gcheedella@salesforce.com
**/
public with sharing class ApexHealthTestUtility {
        /**
         * @description createUserWithPermissionSet
         * @return User
         */
        public static User createUserWithPermissionSet() {
            // Create the new User
            String uniqueUserName = 'standarduser' + DateTime.now().getTime() + '@testorg.com';
            User newUser = new User(
                Username = uniqueUserName,
                Email = 'standarduser@testorg.com',
                FirstName = 'Test',
                LastName = '123test',
                Alias = 'ttte',
                ProfileId = [Select Id,Name from Profile Where Name = 'Standard User'].Id,
                TimeZoneSidKey = 'America/Los_Angeles', 
                LocaleSidKey = 'en_US', 
                EmailEncodingKey = 'UTF-8', 
                LanguageLocaleKey = 'en_US' 
            );
            
            insert as user newUser;
            // Retrieve the PermissionSet by name
            PermissionSet permissionSet = [
                SELECT Id 
                FROM PermissionSet 
                WHERE Name = 'ApexPulse'
                LIMIT 1
            ];
            
            // Assign the PermissionSet to the new User
            PermissionSetAssignment permissionSetAssignment = new PermissionSetAssignment(
                AssigneeId = newUser.Id,
                PermissionSetId = permissionSet.Id
            );
            
            insert as user permissionSetAssignment;
            return newUser;
        }
    }