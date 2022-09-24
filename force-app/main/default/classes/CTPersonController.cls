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
}
