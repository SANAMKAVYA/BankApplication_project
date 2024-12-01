package dao;

public class WithdrawDao {
    private long bankAccount; // Bank account number
    private double amount;     // Amount to withdraw
    private int pin;          // PIN for authentication

    // Constructor
    public WithdrawDao(long bankAccount, double amount, int pin) {
        this.bankAccount = bankAccount;
        this.amount = amount;
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
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public int getPin() {
        return pin;
    }

    public void setPin(int pin) {
        this.pin = pin;
    }
}