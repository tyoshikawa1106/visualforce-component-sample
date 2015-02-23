@isTest
private class CMP_AccountListControllerTest {
    private static User testAdminUser = new User(Id = UserInfo.getUserId());
    
    static testMethod void CMP_AccountListControllerTest() {
        System.runAs(testAdminUser) {

            Test.startTest();
            
            // Test
            CMP_AccountListController cls = new CMP_AccountListController();
            
            Test.stopTest();
            
            // Result
            System.assertEquals(String.isEmpty(cls.searchFields.accountName), true);
            System.assertEquals(String.isEmpty(cls.searchFields.accountNumber), true);
            System.assertEquals(cls.accounts.isEmpty(), true);
        }
    }
    
    static testMethod void doSearchTest1() {
        System.runAs(testAdminUser) {

            Test.startTest();
            
            // Test
            CMP_AccountListController cls = new CMP_AccountListController();
            cls.doSearch();
             
            Test.stopTest();
            
            // Result
            System.assertEquals(cls.accounts.isEmpty(), true);
        }
    }
    
    static testMethod void doSearchTest2() {
        System.runAs(testAdminUser) {
        
            // Create Account Test Data
            Account account = new Account(Name = 'Sample Account', AccountNumber = 'A-000');
            insert account;

            Test.startTest();
            
            // Test
            CMP_AccountListController cls = new CMP_AccountListController();
            cls.doSearch();
             
            Test.stopTest();
            
            // Result
            System.assertEquals(cls.accounts.size(), 1);
            System.assertEquals(cls.accounts[0].Name, account.Name);
            System.assertEquals(cls.accounts[0].AccountNumber, account.AccountNumber);
        }
    }
    
    static testMethod void doSearchTest3() {
        System.runAs(testAdminUser) {
        
            // Create Account Test Data
            Account account = new Account(Name = 'Sample Account', AccountNumber = 'A-000');
            insert account;

            Test.startTest();
            
            // Test
            CMP_AccountListController cls = new CMP_AccountListController();
            cls.searchFields.accountName = account.Name;
            cls.searchFields.accountNumber = account.AccountNumber;
            cls.doSearch();
             
            Test.stopTest();
            
            // Result
            System.assertEquals(cls.accounts.size(), 1);
            System.assertEquals(cls.accounts[0].Name, account.Name);
            System.assertEquals(cls.accounts[0].AccountNumber, account.AccountNumber);
        }
    }
    
    static testMethod void doSearchTest4() {
        System.runAs(testAdminUser) {
        
            // Create Account Test Data
            Account account = new Account(Name = 'Sample Account', AccountNumber = 'A-000');
            insert account;

            Test.startTest();
            
            // Test
            CMP_AccountListController cls = new CMP_AccountListController();
            cls.searchFields.accountName = account.Name + '_Other';
            cls.searchFields.accountNumber = account.AccountNumber;
            cls.doSearch();
             
            Test.stopTest();
            
            // Result
            System.assertEquals(cls.accounts.isEmpty(), true);
        }
    }
}