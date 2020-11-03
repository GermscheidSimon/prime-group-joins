 -- 1. Get all customers and their addresses.
    SELECT * FROM customers
        JOIN addresses ON customers.id = addresses.customer_id;

 -- 2. Get all orders and their line items (orders, quantity and product).
    SELECT * FROM orders
        JOIN line_items ON orders.id = line_items.order_id
        JOIN products ON products.id = line_items.product_id;

 -- 3. Which warehouses have cheetos?
    SELECT warehouse.id, warehouse_product.warehouse_id, warehouse_product.product_id, products.id, products.description, warehouse.warehouse FROM warehouse_product
        JOIN warehouse on warehouse.id = warehouse_product.warehouse_id
        Join products on warehouse_product.product_id = products.id 
  WHERE products.description = 'cheetos';

 -- 4. Which warehouses have diet pepsi?
 SELECT warehouse.id, warehouse_product.warehouse_id, warehouse_product.product_id, products.id, products.description, warehouse.warehouse FROM warehouse_product
        JOIN warehouse on warehouse.id = warehouse_product.warehouse_id
        Join products on warehouse_product.product_id = products.id 
  WHERE products.description = 'diet pepsi';

 -- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
    SELECT customers.first_name, count(*) FROM addresses
	JOIN customers on customers.id = addresses.customer_id
	JOIN orders on orders.address_id = addresses.id
	GROUP BY customers.first_name;

 -- 6. How many customers do we have?
SELECT count(*) from customers;

 -- 7. How many products do we carry?
SELECT count(*) from products;

 -- 8. What is the total available on-hand quantity of diet pepsi?
    SELECT sum(warehouse_product.on_hand) from warehouse_product
	Join products on warehouse_product.product_id = products.id
	WHERE products.description = 'diet pepsi';