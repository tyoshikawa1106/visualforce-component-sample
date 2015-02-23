@isTest
private class CMP_AccountSearchFieldsTest {
    private static User testAdminUser = new User(Id = UserInfo.getUserId());
    
    static testMethod void CMP_AccountSearchFieldsTest() {
        System.runAs(testAdminUser) {

            Test.startTest();
            
            // Test
            CMP_AccountSearchFields cls = new CMP_AccountSearchFields();
            
            Test.stopTest();
            
            // Result
            System.assertEquals(String.isEmpty(cls.accountName), true);
            System.assertEquals(String.isEmpty(cls.accountNumber), true);
        }
    }
}