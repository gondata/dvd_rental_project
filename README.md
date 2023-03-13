# DVD Rental Project

This project involves creating a database to store information about customers, orders, and products for a retail company. We have implemented the database using two different schema designs: an ER schema and a star schema.

## ER schema

The ER schema is a traditional relational database design that represents each entity (e.g., customers, orders, products) as a separate table. The tables are then linked through foreign key relationships to connect related data. While this schema design is flexible and easy to understand, it can become complicated when trying to run complex queries that involve multiple tables. This can result in slower query times and longer wait periods for users.

## Star schema

The star schema is a denormalized database design that reduces the number of tables in the database and simplifies the relationships between them. In this schema design, we have a fact table that contains the main information about the business processes (e.g., orders) and multiple dimension tables that provide additional context and information about the data in the fact table (e.g., customer information, product information). By denormalizing the data in this way, we can speed up query times and improve overall performance.

## Query tests

To test the performance of the two schema designs, we ran a series of query tests using real-world data. The tests involved running complex queries that joined multiple tables together to extract data about customer behavior and product trends.

The results of the query tests showed that the star schema consistently outperformed the ER schema in terms of query speed and efficiency. This is because the star schema's denormalized structure allows for faster access to data and simpler queries.

## Conclusion

Based on these findings, we recommend using the star schema for this project. While the ER schema may be more flexible, the star schema provides better performance for running complex queries and extracting insights from the data.
