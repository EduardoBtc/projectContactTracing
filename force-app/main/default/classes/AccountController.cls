public class AccountController {
    
    public static List<Account> insertListAcc(List<Account> accs) {
        insert accs;
        return accs;
    }
    
    public static Account insertAccount(Account acc) {
        insert acc;
        return acc;
    }
    
    public static List<Account> getAllAccounts() {
        return [SELECT Name, Phone FROM Account];
    }
    
    public static void printAccounts() {
        List<Account> accs = getAllAccounts();
        for (Account acc : accs) {
            System.debug('Account FirstName: '+acc.Name+ ', Accoount LastName: ' + acc.Phone+ '.');
        }
    }
    
    public static Integer accountsSize() {
        return getAllAccounts().size();
    }

}