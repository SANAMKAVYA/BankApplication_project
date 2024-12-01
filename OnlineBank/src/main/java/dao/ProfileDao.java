package dao;

public class ProfileDao {
    private String name;
    private String mobile;
    private String address;
    private long bankAccount;
    private long aadhar;

    public ProfileDao(String name, String mobile, String address, long bankAccount, long aadhar) {
        this.name = name;
        this.mobile = mobile;
        this.address = address;
        this.bankAccount = bankAccount;
        this.aadhar = aadhar;
    }

    // Getters
    public String getName() {
        return name;
    }

    public String getMobile() {
        return mobile;
    }

    public String getAddress() {
        return address;
    }

    public long getBankAccountNo() {
        return bankAccount;
    }

    public long getAadhar() {
        return aadhar;
    }
}
