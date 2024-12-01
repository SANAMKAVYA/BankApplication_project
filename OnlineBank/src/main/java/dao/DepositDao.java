package dao;


public class DepositDao {
    private long bankAccount; // Bank account number
    private double balance;     // Amount to deposit
    private int pin;  // PIN for authentication
    
    // Constructor
    public DepositDao(long bankAccount, double balance, int pin) {
        this.bankAccount = bankAccount;
        this.balance = balance;
        this.pin = pin;
    }

    // Getters and Setters
    public long getBankAccount() {
        return bankAccount;
    }

    public void setBankAccount(long bankAccount) {
        this.bankAccount = bankAccount;
    }

    public double getAmount() {
        return balance;
    }

    public void setAmount(double amount) {
        this.balance = balance;
    }

    public int getPin() {
        return pin;
    }

    public void setPin(int pin) {
        this.pin = pin;
    }
}
