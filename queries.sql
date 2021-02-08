select * from card_holder;
select * from credit_card;
select * from merchant;
select * from merchant_category;
select * from transaction;


select a.name, b.card
from card_holder as a
join credit_card as b on a.id = b.cardholder_id


select card, count(*) from transaction where amount < 2.00 group by card




