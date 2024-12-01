package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TransactionDao {
    private Connection connection;

    public TransactionDao(Connection connection) {
        this.connection = connection;
    }

    public List<Transaction> getTransactionHistory(String accountNumber) {
        List<Transaction> transactions = new ArrayList<>();
        String sql = "SELECT * FROM transactions WHERE bankAccount = ? ORDER BY transaction_date DESC";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, accountNumber);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Transaction transaction = new Transaction();
                transaction.setTransactionId(resultSet.getInt("transaction_id")); // Use getInt for integer
                transaction.setBankAccount(resultSet.getString("bankAccount")); // Corrected method name
                transaction.setTransactionType(resultSet.getString("transaction_type")); // Corrected method name
                transaction.setAmount(resultSet.getDouble("balance")); // Corrected method name
                transaction.setTransactionDate(resultSet.getDate("transaction_date")); // Corrected method name
                transactions.add(transaction);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return transactions;
    }
}