package dao;

public class CreateAccount {
	private String name;
	private long mobile;
	private long aadhar;
	private String address;
	private long bankAccount;
	private int pin;
	private int cpin;
	
	public CreateAccount(String name,long mobile,long aadhar,String address,long bankAccount,int pin,int cpin) {
		this.name = name;
		this.mobile = mobile;
		this.aadhar = aadhar;
		this.address = address;
		this.bankAccount = bankAccount;
		this.pin = pin;
		this.cpin = cpin;
	}

	public CreateAccount() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public long getMobile() {
		return mobile;
	}

	public void setMobile(long mobile) {
		this.mobile = mobile;
	}

	public long getAadhar() {
		return aadhar;
	}

	public void setAadhar(long aadhar) {
		this.aadhar = aadhar;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public long getBankAccount() {
		return bankAccount;
	}

	public void setAccountNo(long bankAccount) {
		this.bankAccount = bankAccount;
	}

	public int getPin() {
		return pin;
	}

	public void setPin(int pin) {
		this.pin = pin;
	}

	public int getCpin() {
		return cpin;
	}

	public void setConfirmpin(int cpin) {
		this.cpin = cpin;
	}

	@Override
	public String toString() {
		return "CreateAccount name = " + name + ", phone = " + mobile + ", aadharNo = " + aadhar + ", address = " + address
				+ ", bankAccount = " + bankAccount + ", pin = " + pin + ", confirmpin = " + cpin + "";
	}
	
	
	
}
