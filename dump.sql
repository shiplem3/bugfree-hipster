/* Clean old version of the tables */
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS ItemCategories;
DROP TABLE IF EXISTS Items;
DROP TABLE IF EXISTS Carts;
DROP TABLE IF EXISTS CartItems;

/* Create tables */
CREATE TABLE IF NOT EXISTS Users(
id integer NOT NULL,
email varchar(255) NOT NULL,
name varchar(255) NOT NULL,
);

CREATE TABLE IF NOT EXISTS ItemCategories(
id integer NOT NULL;
name varchar(255) NOT NULL;
);

CREATE TABLE IF NOT EXISTS Items(
id integer NOT NULL,
name varchar(255) NOT NULL,
category_id integer NOT NULL;
price DOUBLE NOT NULL;
description TEXT NOT NULL;
image_url varchar(255);
);

CREATE TABLE IF NOT EXISTS Carts(
id integer NOT NULL,
user_id integer NOT NULL
);

CREATE TABLE IF NOT EXISTS CartItems(
id integer NOT NULL,
cart_id integer NOT NULL;
item_id integer NOT NULL;
quantity integer NOT NULL;
);

/* Create PRIMARY KEYS and AUTO_INCREMENT */
ALTER TABLE Users ADD CONSTRAINT pk_Users_id PRIMARY KEY (id);
ALTER TABLE Users MODIFY id integer AUTO_INCREMENT;
ALTER TABLE ItemCategories ADD CONSTRAINT pk_ItemCategories_id PRIMARY KEY (id);
ALTER TABLE ItemCategories MODIFY id integer AUTO_INCREMENT;
ALTER TABLE Items ADD CONSTRAINT pk_Items_id PRIMARY KEY (id);
ALTER TABLE Items MODIFY id integer AUTO_INCREMENT;
ALTER TABLE Carts ADD CONSTRAINT pk_Carts_id PRIMARY KEY (id);
ALTER TABLE Carts MODIFY id integer AUTO_INCREMENT;
ALTER TABLE CartItems ADD CONSTRAINT pk_CartItems_id PRIMARY KEY (id);
ALTER TABLE CartItems MODIFY id integer AUTO_INCREMENT;

/* Create the UNIQUE constaints */
ALTER TABLE Users ADD CONSTRAINT uk_Users_email UNIQUE (email);
ALTER TABLE Items ADD CONSTRAINT uk_Items_number UNIQUE (name,category_id);
ALTER TABLE Carts ADD CONSTRAINT uk_Carts_number UNIQUE (user_id);
ALTER TABLE CartItems ADD CONSTRAINT uk_CartsItems_username UNIQUE (cart_id);

/* Create FOREIGN KEYS */
ALTER TABLE Carts ADD CONSTRAINT fk_Carts_user FOREIGN KEY (user_id) REFERENCES Users (id);
ALTER TABLE Items ADD CONSTRAINT fk_Items_category FOREIGN KEY (category_id) REFERENCES ItemCategories(id);
ALTER TABLE CartItems ADD CONSTRAINT fk_CartItems_cart FOREIGN KEY (cart_id) REFERENCES Carts(id);
ALTER TABLE CartItems ADD CONSTRAINT fk_CartItems_item FOREIGN KEY (item_id) REFERENCES Items(id);

/* Populate databases for tests */
INSERT INTO Users (id, email, name ) VALUES
(1, 'FakeEmail@fake.com', 'Shark Mipley'),
(2, '2332@gmail.com', 'Fake Name');

INSERT INTO ItemCategories (id, name) VALUES
(1, 'Food'),
(2, 'Electronics'),
(3, 'Books');
INSERT INTO Items (id,name,category_id,price,image_url,description) VALUES
(1, 'Xbox 360',2,29.95,'https://www.google.com/images/srpr/logo11w.png','game console'),
(2, 'NooElec RF Upconverter For Software Defined Radio',2,49.99,'https://www.google.com/images/srpr/logo11w.png','radio Upconverter'),
(3, 'Rice',1,987.23,'https://www.google.com/images/srpr/logo11w.png', "Rice, random variety"),
(4, 'Harry Potter and the Order of the Default Values',3,3.50,'https://www.google.com/images/srpr/logo11w.png','The latest spy thriller by J.K. Rowling');

INSERT INTO Carts (id,user_id) VALUES
(1,2);
INSERT INTO CartItems (id, cart_id, item_id, quantity) VALUES 
(1,1,1,2),
(1,1,2,1);
