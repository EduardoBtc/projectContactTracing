public with sharing class CTLocationTracingController {
    
    public static List<Location_Tracing__c> getVisitors(String locationld) {
        return [SELECT Id,
                    Person__c, 
                    Location__c, 
                    Visit_Date__c,
                    Person__r.Token__c,
                    Person__r.Health_Status__c 
                    FROM Location_Tracing__c
                    WHERE Id =: locationld
                    ORDER BY Visit_Date__c 
                    DESC NULLS LAST];
    }

    public static List<Location_Tracing__c> getLocationsByPersonlds(Set<Id> personlds) {
        return [SELECT Id,
                Person__c, 
                Location__c
                FROM Location_Tracing__c
                WHERE Person__c IN :personlds
                AND Visit_Date__c = LAST_N_DAYS:10];
    }

    public static List<Location_Tracing__c> getLocationsByLocationIds(Set<Id> locationIds){
        return [SELECT Id, Person__c, Location__c 
                FROM Location_Tracing__c 
                WHERE Location__c IN :locationIds
                AND Person__r.Health_Status__c = 'Green'
                AND Visit_Date__c = LAST_N_DAYS:10];
    }

    public static List<Location_Tracing__c> checkDuplicates(List<Location_Tracing__c> newLocationTrace) {
        Set<Id> locationIds = new Set<Id>();
        Set<Id> personIds = new Set<Id>();

        for (Location_Tracing__c lo : newLocationTrace) {
            locationIds.add(lo.Location__c);
            personIds.add(lo.Person__c);
        }

        Map<Id, Set<Id>> mapOfExistingRecords = new Map<Id, Set<Id>>();
        List<Location_Tracing__c> duplicates = new List<Location_Tracing__c>();

        List<Location_Tracing__c> existingRecords = [SELECT Id,
                                                        Person__c,
                                                        Location__c 
                                                        FROM Location_Tracing__c 
                                                        WHERE Location__c IN :locationIds
                                                        AND Person__c IN :personIds];
        if(!existingRecords.isEmpty()){
                
            for(Location_Tracing__c trace : existingRecords) {
                if(!mapOfExistingRecords.containsKey(trace.Location__c))
                    mapOfExistingRecords.put(trace.Location__c, new Set<Id>());
            
                mapOfExistingRecords.get(trace.Location__c).add(trace.Person__c);
            }

            for(Location_Tracing__c trace : newLocationTrace) {
                if(mapOfExistingRecords.containsKey(trace.Location__c)
                && mapOfExistingRecords.get(trace.Location__c).contains(trace.Person__c))
                    duplicates.add(trace);
            }
        }
        return duplicates;
    }
}