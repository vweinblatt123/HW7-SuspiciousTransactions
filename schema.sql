-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE card_holder (
    id INT   NOT NULL,
    name VARCHAR(50)   NOT NULL,
    CONSTRAINT pk_card_holder PRIMARY KEY (
        id
     )
);

CREATE TABLE credit_card (
    card VARCHAR(20)   NOT NULL,
    cardholder_id INT   NOT NULL,
    CONSTRAINT pk_credit_card PRIMARY KEY (
        card
     )
);

CREATE TABLE merchant_category (
    id INT   NOT NULL,
    name VARCHAR(20)   NOT NULL,
    CONSTRAINT pk_merchant_category PRIMARY KEY (
        id
     )
);

CREATE TABLE merchant (
    id INT   NOT NULL,
    name VARCHAR(50)   NOT NULL,
    merchant_category INT   NOT NULL,
    CONSTRAINT pk_merchant PRIMARY KEY (
        id
     )
);

CREATE TABLE transaction (
    id INT   NOT NULL,
    date TIMESTAMP   NOT NULL,
    amount FLOAT   NOT NULL,
    card VARCHAR(20)   NOT NULL,
    id_merchant INT   NOT NULL,
    CONSTRAINT pk_transaction PRIMARY KEY (
        id
     )
);

ALTER TABLE credit_card ADD CONSTRAINT fk_credit_card_cardholder_id FOREIGN KEY(cardholder_id)
REFERENCES card_holder (id);

ALTER TABLE merchant ADD CONSTRAINT fk_merchant_merchant_category FOREIGN KEY(merchant_category)
REFERENCES merchant_category (id);

ALTER TABLE transaction ADD CONSTRAINT fk_transaction_card FOREIGN KEY(card)
REFERENCES credit_card (card);

ALTER TABLE transaction ADD CONSTRAINT fk_transaction_id_merchant FOREIGN KEY(id_merchant)
REFERENCES merchant (id);

