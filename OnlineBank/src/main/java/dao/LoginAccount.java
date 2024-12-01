package dao;

public class LoginAccount {

    private long bankAccount;
    private int pin;

    public LoginAccount(long bankAccount, int pin) {
        this.bankAccount = bankAccount;
        this.pin = pin;
    }

    // No-argument constructor
    public LoginAccount() {
        super();
    }

    public long getBankAccount() {
        return bankAccount;
    }

    public void setBankAccount(long bankAccount) {
        this.bankAccount = bankAccount;
    }

    public int getPin() {
        return pin;
    }

    public void setPin(int pin) {
        this.pin = pin;
    }

    @Override
    public String toString() {
        return "[bankAccount=" + bankAccount + ", pin=" + pin + "]";
    }
}