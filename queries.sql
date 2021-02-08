select * from card_holder;
select * from credit_card;
select * from merchant;
select * from merchant_category;
select * from transaction;

-- Count the transactions that are less than $2.00 per cardholder.
select name, count(*)
from card_holder as a
join credit_card as b on a.id = b.cardholder_id
join transaction as c on b.card = c.card
where amount < 2.00 
group by name

