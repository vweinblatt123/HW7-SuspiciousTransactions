select * from card_holder;
select * from credit_card;
select * from merchant;
select * from merchant_category;
select * from transaction;

-- Count the transactions that are less than $2.00 per cardholder
create view small_tran_cardholder as
select name, count(*)
from card_holder as a
join credit_card as b on a.id = b.cardholder_id
join transaction as c on b.card = c.card
where amount < 2.00 
group by name

-- Count the transactions that are less than $2.00 per credit card
create view small_tran_cardnumber as
select a.card, count(*)
from credit_card as a 
join transaction as b on a.card = b.card
where amount < 2.00 
group by a.card


-- Top 100 highest transactions made between 7:00 am and 9:00 am
create view high_tran_7to9 as 
select * 
from transaction 
where extract (hour from date) >= 7 and extract (hour from date) <= 9
order by amount desc
limit 100

-- Top 100 highest transactions made at times other than between 7:00 am and 9:00 am
create view high_tran_not7to9 as 
select * 
from transaction 
where extract (hour from date) < 7 or extract (hour from date) > 9
order by amount desc
limit 100

-- Top 5 merchants prone to being hacked using small transactions
create view small_tran_merchants as 
select name, count(*)
from merchant as a
join transaction as b on a.id = b.id_merchant
where amount < 2.00 
group by name
order by count(*) desc

select * from small_tran_cardholder;
select * from small_tran_cardnumber;
select * from high_tran_7to9;
select * from high_tran_not7to9;
select * from small_tran_merchants;


