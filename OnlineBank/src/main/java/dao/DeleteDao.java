package dao;

public class DeleteDao {
	private long bankAccount;
	private int pin;
	
	public DeleteDao(long bankAccount, int pin) {
		super();
		this.bankAccount = bankAccount;
		this.pin = pin;
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
		return " [bankAccount=" + bankAccount + ", pin=" + pin + "]";
	}
	
	
	
	
}