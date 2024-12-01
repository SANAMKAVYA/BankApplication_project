package dao;

public class Account {
    private String bankAccount; // Variable to hold the account number
    private double balance; // Variable to hold the balance

    // Constructor
    public Account(String bankAccount, double balance) {
        this.bankAccount = bankAccount;
        this.balance = balance;
    }

    // Getter for accountNumber
    public String getAccountNumber() {
        return bankAccount;
    }

    // Setter for accountNumber
    public void setAccountNumber(String bankAccount) {
        this.bankAccount = bankAccount;
    }

    // Getter for balance
    public double getBalance() {
        return balance;
    }

    // Setter for balance
    public void setBalance(double balance) {
        this.balance = balance;
    }
}