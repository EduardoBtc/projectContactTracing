public with sharing class CTPersonController {

    public static String getToken(String mobile) {

        Blob mobileBlob = Blob.valueOf(mobile);
        Blob hash = Crypto.generateDigest('MD5', mobileBlob);
        
        return EncodingUtil.base64Encode(hash);
    }

    public static List<Person__c>  getRecentHealthChanges() {
       return [SELECT Id,
                    Name,
                    Health_Status__c,
                    Mobile__c, 
                    Status_Update_Date__c, 
                    Token__c 
                    FROM Person__c 
                    ORDER BY Status_Update_Date__c 
                    DESC NULLS LAST 
                    LIMIT 100];
    }

    public static List<Person__c> searchPeople(String searchTerm) {
        return [SELECT Id,
                    Name,
                    Health_Status__c,
                    Mobile__c, 
                    Status_Update_Date__c, 
                    Token__c 
                    FROM Person__c 
                    WHERE Name =: searchTerm
                    OR Mobile__c =: searchTerm
                    OR Token__c =: searchTerm
                    ORDER BY Status_Update_Date__c 
                    DESC NULLS LAST];
    }

    public static Person__c getPersonId(String personId) {
        List<Person__c> personAccount = [SELECT Id,
                    Name,
                    Health_Status__c,
                    Mobile__c, 
                    Status_Update_Date__c, 
                    Token__c 
                    FROM Person__c 
                    WHERE Id =: personId];
        
        if(personAccount != null && personAccount.size() == 1) 
            return personAccount.get(0);
        
        return null;
    }
    
    public static Map<String, Integer> getHealthStatusCount() {
        Map<String, Integer> healthCountMap = new Map<String, Integer>();
        for(AggregateResult ar : [SELECT Health_Status__c, COUNT(Id) total 
                                    FROM Person__c 
                                    GROUP BY Health_Status__c]){
            String healthStatus = String.valueOf(ar.get('Health_Status__c'));
            Integer count = Integer.valueOf(ar.get('total'));
            healthCountMap.put(healthStatus, count);
        }
        return healthCountMap;
    }

    public static Set<Id> getCohabitants(Set<Id> personIds) {
        List<String> healthStatus = new List<String>{'Green', 'Yellow'};
        List<People_Tracing__c> peopleTraces = [SELECT Person_1__c,
                                                        Person_2__c
                                                        FROM People_Tracing__c
                                                        WHERE (Person_1__c IN:personIds OR Person_2__c IN:personIds)
                                                        AND Contact_Type__c = 'Cohabitant'
                                                        AND (Person_1__r.Health_Status__c IN:healthStatus
                                                        OR Person_2__r.Health_Status__c IN:healthStatus)];

        Set<Id> cohabitants = new Set<Id>();
        for (People_Tracing__c pt : peopleTraces) {
            if(!personIds.contains(pt.Person_1__c))
                cohabitants.add(pt.Person_1__c);
            
            if(!personIds.contains(pt.Person_2__c))
                cohabitants.add(pt.Person_2__c);
        }
        return cohabitants;
    }

    public static Set<Id> getNeighbours(Set<Id> personIds) {
        List<People_Tracing__c> peopleTraces = [SELECT Person_1__c,
                                                        Person_2__c
                                                        FROM People_Tracing__c
                                                        WHERE (Person_1__c IN:personIds OR Person_2__c IN:personIds)
                                                        AND Contact_Type__c = 'Cohabitant'
                                                        AND (Person_1__r.Health_Status__c = 'Green'
                                                        OR Person_2__r.Health_Status__c = 'Green')];

        Set<Id> neighbours = new Set<Id>();
        for (People_Tracing__c pt : peopleTraces) {
            if(!personIds.contains(pt.Person_1__c))
                neighbours.add(pt.Person_1__c);
            
            if(!personIds.contains(pt.Person_2__c))
                neighbours.add(pt.Person_2__c);
        }
        return neighbours;
    }

    public static Set<Id> getPrimaryContacts(Set<Id> personIds) {
        List<String> healthStatus = new List<String>{'Green', 'Yellow'};
        List<People_Tracing__c> peopleTraces = [SELECT Person_1__c,
                                                        Person_2__c
                                                        FROM People_Tracing__c
                                                        WHERE (Person_1__c IN:personIds OR Person_2__c IN:personIds)
                                                        AND Contact_Date__c = LAST_N_DAYS:10
                                                        AND Contact_Type__c = 'Other'
                                                        AND (Person_1__r.Health_Status__c IN:healthStatus
                                                        OR Person_2__r.Health_Status__c IN:healthStatus)];

        Set<Id> primaryContacts = new Set<Id>();
        for (People_Tracing__c pt : peopleTraces) {
            if(!personIds.contains(pt.Person_1__c))
                primaryContacts.add(pt.Person_1__c);
            
            if(!personIds.contains(pt.Person_2__c))
                primaryContacts.add(pt.Person_2__c);
        }
        return primaryContacts;
    }

    public static Set<Id> getSecundaryContact(Set<Id> primaryContacts) {
        List<People_Tracing__c> peopleTraces = [SELECT Person_1__c,
                                                        Person_2__c
                                                        FROM People_Tracing__c
                                                        WHERE (Person_1__c IN:primaryContacts OR Person_2__c IN:primaryContacts)
                                                        AND Contact_Type__c = 'Other'
                                                        AND Contact_Date__c = LAST_N_DAYS:10
                                                        AND (Person_1__r.Health_Status__c = 'Green'
                                                        OR Person_2__r.Health_Status__c = 'Green')];

        Set<Id> secundaryContacts = new Set<Id>();
        for (People_Tracing__c pt : peopleTraces) {
            if(!primaryContacts.contains(pt.Person_1__c))
                secundaryContacts.add(pt.Person_1__c);
            
            if(!primaryContacts.contains(pt.Person_2__c))
                secundaryContacts.add(pt.Person_2__c);
        }
        return secundaryContacts;
    } 
}