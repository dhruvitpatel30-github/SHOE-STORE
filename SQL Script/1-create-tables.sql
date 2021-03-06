DROP TABLE IF EXISTS SHOPPING_CART_TOTAL;

DROP TABLE IF EXISTS SHOPPING_CART;

DROP TABLE IF EXISTS ORDER_CONTENTS;

DROP TABLE IF EXISTS ORDERZ;

DROP TABLE IF EXISTS INVENTORY;

DROP TABLE IF EXISTS USERZ;



CREATE TABLE USERZ (
userName VARCHAR(20) PRIMARY KEY,
isEmployee BOOLEAN
);

CREATE TABLE INVENTORY (
productID INT AUTO_INCREMENT,
productName VARCHAR(20),
price INT,
qty INT,

PRIMARY KEY (productID)
);

CREATE TABLE ORDERZ (
orderID INT AUTO_INCREMENT,
userName VARCHAR(20),
billingINFO CHAR(16),
shipINFO VARCHAR(255),
ship_status VARCHAR (40) DEFAULT 'Processing',

PRIMARY KEY (orderID),
FOREIGN KEY (userName) REFERENCES USERZ (userName)

);

CREATE TABLE ORDER_CONTENTS (
    orderID INT,
    productID INT,
    orderQTY INT,

    FOREIGN KEY (orderID) REFERENCES ORDERZ (orderID),
    FOREIGN KEY (productID) REFERENCES INVENTORY (productID)

);

CREATE TABLE SHOPPING_CART (
userName VARCHAR(20) PRIMARY KEY,
productID INT,
orderQTY INT,

FOREIGN KEY (productID) REFERENCES INVENTORY(productID),
FOREIGN KEY (userName)  REFERENCES USERZ(userName)
);

CREATE TABLE SHOPPING_CART_TOTAL (
userName VARCHAR(20) PRIMARY KEY,
total INT,

FOREIGN KEY (userName) REFERENCES USERZ(userName)

);
