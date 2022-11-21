package org.example;
import java.sql.*;

public class Main {
    public static void main(String[] args) {
        String sDbUrl="jdbc:mysql://localhost:3306/5ahel_uni";
        String sUsr="root";
        String sPwd="";
        String sTable="prof";

        Connection connection;
        Statement statement;
        ResultSet resultSet;

        connection = DriverManager.getConnection(sDbUrl, sUsr, sPwd);
        statement = connection.createStatement();
        resultSet = statement.executeQuery("SELECT * FROM " + sTable);

        while (resultSet.next())
        {
            System.out.printf("%-6s %-15s %-4s %-4s\n", resultSet.getString(1), resultSet.getString(2), resultSet.getString(3), resultSet.getString(4));
        }
        connection.close();
    }
}