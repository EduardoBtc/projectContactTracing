public class OpportunityController {
    
    
    public static void updateOppProfile() {
         List<Opportunity> oppts = [SELECT Profile__c, Amount FROM Opportunity];

for (Opportunity opp : oppts){
    if (opp.Amount == null ){
        opp.Profile__c = '';
	} else if (opp.Amount < 10000) {
        opp.Profile__c = 'Low';
        System.debug(opp.Profile__c);
    } else if (opp.Amount > 10000 && opp.Amount < 50000) {
         opp.Profile__c = 'Medium';
        System.debug(opp.Profile__c);
    } else {
        opp.Profile__c = 'High';
        System.debug(opp.Profile__c);
    }
}
update oppts;
    }

}