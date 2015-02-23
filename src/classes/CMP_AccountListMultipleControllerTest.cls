@isTest
private class CMP_AccountListMultipleControllerTest {
    private static User testAdminUser = new User(Id = UserInfo.getUserId());
    
    static testMethod void CMP_AccountListMultipleControllerTest() {
        System.runAs(testAdminUser) {

            Test.startTest();
            
            // Test
            CMP_AccountListMultipleController cls = new CMP_AccountListMultipleController();
            
            Test.stopTest();
            
            // Result
            System.assertEquals(String.isEmpty(cls.searchFields.accountName), true);
            System.assertEquals(String.isEmpty(cls.searchFields.accountNumber), true);
            System.assertEquals(cls.accounts.isEmpty(), true);
        }
    }
    
    static testMethod void doAccountSearchTest1() {
        System.runAs(testAdminUser) {

            Test.startTest();
            
            // Test
            CMP_AccountListMultipleController cls = new CMP_AccountListMultipleController();
            cls.doAccountSearch();
             
            Test.stopTest();
            
            // Result
            System.assertEquals(cls.accounts.isEmpty(), true);
        }
    }
    
    static testMethod void doAccountSearchTest2() {
        System.runAs(testAdminUser) {
        
            // Create Account Test Data
            Account account = new Account(Name = 'Sample Account', AccountNumber = 'A-000', Phone='000-111-2222', Fax='000-111-2223');
            insert account;

            Test.startTest();
            
            // Test
            CMP_AccountListMultipleController cls = new CMP_AccountListMultipleController();
            cls.doAccountSearch();
             
            Test.stopTest();
            
            // Result
            System.assertEquals(cls.accounts.size(), 1);
            System.assertEquals(cls.accounts[0].Name, account.Name);
            System.assertEquals(cls.accounts[0].AccountNumber, account.AccountNumber);
            System.assertEquals(cls.accounts[0].Phone, account.Phone);
            System.assertEquals(cls.accounts[0].Fax, account.Fax);
        }
    }
    
    static testMethod void doAccountSearchTest3() {
        System.runAs(testAdminUser) {
        
            // Create Account Test Data
            Account account = new Account(Name = 'Sample Account', AccountNumber = 'A-000');
            insert account;

            Test.startTest();
            
            // Test
            CMP_AccountListMultipleController cls = new CMP_AccountListMultipleController();
            cls.searchFields.accountName = account.Name;
            cls.searchFields.accountNumber = account.AccountNumber;
            cls.doAccountSearch();
             
            Test.stopTest();
            
            // Result
            System.assertEquals(cls.accounts.size(), 1);
            System.assertEquals(cls.accounts[0].Name, account.Name);
            System.assertEquals(cls.accounts[0].AccountNumber, account.AccountNumber);
            System.assertEquals(cls.accounts[0].Phone, account.Phone);
            System.assertEquals(cls.accounts[0].Fax, account.Fax);
        }
    }
    
    static testMethod void doAccountSearchTest4() {
        System.runAs(testAdminUser) {
        
            // Create Account Test Data
            Account account = new Account(Name = 'Sample Account', AccountNumber = 'A-000');
            insert account;

            Test.startTest();
            
            // Test
            CMP_AccountListMultipleController cls = new CMP_AccountListMultipleController();
            cls.searchFields.accountName = account.Name + '_Other';
            cls.searchFields.accountNumber = account.AccountNumber;
            cls.doAccountSearch();
             
            Test.stopTest();
            
            // Result
            System.assertEquals(cls.accounts.isEmpty(), true);
        }
    }
}