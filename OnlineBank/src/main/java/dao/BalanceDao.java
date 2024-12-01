package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BalanceDao {
    private Connection connection;

    public BalanceDao(Connection connection) {
        this.connection = connection;
    }

    /**
     * Retrieves the account details for the given account number.
     * 
     * @param bankAccount The account number to search for.
     * @return An Account object containing the account number and balance, or null if not found.
     */
    public Account getAccount(String bankAccount) {
        Account account = null;
        String sql = "SELECT balance FROM transactions WHERE bankAccount = ?"; // Adjust the table and column names as needed

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, bankAccount);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                double balance = resultSet.getDouble("balance"); // Ensure this matches your DB schema
                account = new Account(bankAccount, balance); // Create a new Account object
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return account;
    }

    
    public void updateBalance(String bankAccount, double balance) {
        String sql = "UPDATE transactions SET balance = ? WHERE bankAccount = ?"; // Adjust the table and column names as needed

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setDouble(1, balance);
            statement.setString(2, bankAccount);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}