public class AccountService {
    
    // Query accounts with related contacts
    public static List<Account> getAccountsWithContacts(Set<Id> accountIds) {
        return [
            SELECT Id, Name, Industry, AnnualRevenue,
                   (SELECT Id, FirstName, LastName, Email 
                    FROM Contacts 
                    WHERE IsActive__c = true)
            FROM Account
            WHERE Id IN :accountIds
            AND IsDeleted = false
            ORDER BY Name
            LIMIT 100
        ];
    }
    
    // Update account revenue
    public static void updateAccountRevenue(Id accountId, Decimal newRevenue) {
        Account acc = new Account(
            Id = accountId,
            AnnualRevenue = newRevenue
        );
        
        try {
            update acc;
        } catch (DmlException e) {
            System.debug('Error updating account: ' + e.getMessage());
            throw e;
        }
    }
}