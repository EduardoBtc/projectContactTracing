public with sharing class PersonTriggerHandler {
    
    public static void onBeforeInsert(List<Person__c> newList) { 
        for (Person__c ps : newList){
            ps.Health_Status__c = 'Green';
            ps.Token__c = CTPersonController.getToken(ps.Mobile__c);
        }
    }

    public static void onBeforeUpdate(List<Person__c> newRecords, Map<Id, Person__c> oldMap) {
        for (Person__c ps : newRecords) {
            if (ps.Health_Status__c != oldMap.get(ps.Id).Health_Status__c)
                ps.Status_Update_Date__c = date.today();
        }
    }

    public static void onAfterUpdate(List<Person__c> newRecords, Map<Id, Person__c> oldMap) {
        Set<Id> statusChange = new Set<Id>();
        Set<Id> statusRed = new Set<Id>();
        for (Person__c ps : newRecords) {
            if (ps.Health_Status__c != oldMap.get(ps.Id).Health_Status__c) {
               statusChange.add(ps.Id);
            }

            if (ps.Health_Status__c == 'Red' && oldMap.get(ps.Id).Health_Status__c != 'Red') {
               statusRed.add(ps.Id);
            }
        }
        Set<Id> orangeStatus = new Set<Id>();
        Set<Id> YellowStatus = new Set<Id>();
    }
}
