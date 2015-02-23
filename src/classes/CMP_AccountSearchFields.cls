public with sharing class CMP_AccountSearchFields {

    public String accountName {get; set;}
    public String accountNumber {get; set;}

    public CMP_AccountSearchFields() {
        this.accountName = '';
        this.accountNumber = '';
    }
}