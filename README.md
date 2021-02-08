# HW7 - Suspicious Transactions

## Data Analysis - Part 1

*How can you isolate (or group) the transactions of each cardholder?*

In order to group the transactions of a single cardholder, we must consider the relationship between tables. First, the "transaction" table contains all transactions and includes only the card number used per transaction. To relate this to the actual cardholder, we must go through the "credit_card" table which contains credit card number and holder id. Using holder id, we can then link to the actual name via the "card_holder" table, which maps card number to name. This requires a join across these three tables, at which point we can search all transactions for a particular cardholder.

*Count the transactions that are less than $2.00 per cardholder*

The "small_tran_cardholder" view in queries.sql counts the transactions that are less than $2.00 per cardholder. The results show a total of 350 (out of 3500) total transactions, with Megan Price, Stephanie Dalton, and Peter Mckay having the largest amount of such transactions.

*Is there any evidence to suggest that a credit card has been hacked?*

Given the merchants in our dataset are restuarants, bars, coffee shops, pubs, and food trucks, it is not surprising to see a fair amount of small sized transactions, and at only 10% of the data, this seems reasonable. Using the "small_tran_cardnumber" query, we can analyze such transactions by card number (as opposed to card holder) and do see that 20% of card number 376027549341849 transactions are less than $2.00. This could indicate fraud, or it could just indicate this card is used by the owner to purchase his/her daily cup of joe every morning.

*What are the top 100 highest transactions made between 7:00 am and 9:00 am? Do you see any anomalous transactions that could be fraudulent?*

The "high_tran_7to9" view in queries.sql shows the 100 highest transactions made between 7 and 9 am. Of note, there are 12 transactions of $100 or more, and 8 transactions of \\\$1,000 or more. Again, since the transactions are at restuarants and bars, it would seem odd to have these large sized transactions at this time in the morning. However, it is possible the card was used to bring in breakfast for the entire office one day.

*Is there a higher number of fraudulent transactions made during the 7 to 9 am time frame versus the rest of the day?*

To compare the 7 to 9 am time frame to the rest of the day, we use "high_tran_not7to9" and see far more larger value transactions during these other times of the day. This makes sense, as the fancy, expensive corporate dinners take place later in the evening. While there are more large value transactions, it is hard to say which are fraudulent during this later time frame. Nonetheless, with 8 transactions of $1000 or more in the 7 to 9 am time frame, we can likely conclude there are more fraudulent transactions in this earlier window. 

It is possible more fraudulent transactions occur during the morning hours as fraudsters working remotely in other parts of the world are operating during these times (https://stripe.com/guides/2017-global-fraud-report#fraud-by-day-and-time). Though, it is hard to make such conclusions given our limited dataset.

