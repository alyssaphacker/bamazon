DROP DATABASE IF EXISTS bamazonDB;
CREATE DATABASE bamazonDB;
USE bamazonDB;

CREATE TABLE products (
  item_id INT NOT NULL AUTO_INCREMENT,
  product_name VARCHAR(45) NOT NULL,
  department_name VARCHAR(45) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  stock_quantity INT NOT NULL,
  PRIMARY KEY (item_id)
  );
  
  INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("bottle of wine", "spirits", 45.89, 100);
  INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("box of turkish delight", "dessert", 16.50, 100);
  INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("dirty handkerchief", "hardware", 45.89, 100);
  INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("random family heirloom", "artifacts", 99999999.99, 1);
  INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("expired grape jelly", "groceries", 3.99, 100);
  INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("michael jordan's sneakers", "collectibles", 1000000.00, 3);
  INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("moon rock", "artifacts", 100.00, 100);
  INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("crate of dusty records", "artifacts", 10.00, 6);
  INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("10kg golden bar", "currency", 416157.00, 100);
  INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("barrel of apples", "commodities", 54.99, 100);
  INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("bushel of wheat", "commodities", 4.89, 100);


SELECT * FROM products WHERE item_id=1
