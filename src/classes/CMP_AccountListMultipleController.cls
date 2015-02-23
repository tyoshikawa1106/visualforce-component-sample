public with sharing class CMP_AccountListMultipleController {
    
    public CMP_AccountSearchFields searchFields {get; set;}
    public List<Account> accounts {get; set;}
    
    public CMP_AccountListMultipleController() {
        this.searchFields = new CMP_AccountSearchFields();
        this.accounts = new List<Account>();
    }
    
    public void doAccountSearch() {
        String query = '';
        query += ' SELECT ';
        query += ' Id ';
        query += ' ,Name ';
        query += ' ,AccountNumber ';
        query += ' ,Phone ';
        query += ' ,Fax ';
        query += ' FROM ';
        query += ' Account ';
        
        String joinQuery = ' WHERE ';
        if (String.isNotEmpty(this.searchFields.accountName)) {
            query += joinQuery;
            query += ' Name = ' + '\'' + String.escapeSingleQuotes(this.searchFields.accountName) + '\'';
            joinQuery = ' AND ';
        }
        
        if (String.isNotEmpty(this.searchFields.accountNumber)) {
            query += joinQuery;
            query += ' AccountNumber = ' + '\'' + String.escapeSingleQuotes(this.searchFields.accountNumber) + '\'';
            joinQuery = ' AND ';
        }
        
        query += ' ORDER BY Name ASC ';
        query += ' LIMIT 200 ';
    
        this.accounts = database.query(query);
    }
}