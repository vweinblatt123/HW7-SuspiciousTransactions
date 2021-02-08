# HW7 - Suspicious Transactions

## Data Analysis - Part 1

*How can you isolate (or group) the transactions of each cardholder?*

In order to group the transactions of a single cardholder, we must consider the relationship between tables. First, the "transaction" table contains all transactions and includes only the card number used per transaction. To relate this to the actual cardholder, we must go through the "credit_card" table which contains credit card number and holder id. Using holder id, we can then link to the actual name via the "card_holder" table, which maps card number to name. This requires a join across these three tables, at which point we can search all transactions for a particular cardholder.

*Count the transactions that are less than $2.00 per cardholder*

The "small_tran_cardholder" view in queries.sql counts the transactions that are less than $2.00 per cardholder. The results show a total of 350 (out of 3500) total transactions, with Megan Price, Stephanie Dalton, and Peter Mckay having the largest amount of such transactions.

*Is there any evidence to suggest that a credit card has been hacked?*

Given the merchants in our dataset are restuarants, bars, coffee shops, pubs, and food trucks, it is not surprising to see a fair amount of small sized transactions, and at only 10% of the data, this seems reasonable. Using the "small_tran_cardnumber" query, we can analyze such transactions by card number (as opposed to card holder) and do see that 20% of card number 376027549341849 transactions are less than $2.00. This could indicate fraud, or it could just indicate this card is used by the owner to purchase his/her daily cup of joe every morning.
