-- 1. Standardize Email

update ecommerce_sales
set email = null
where email = "";

update ecommerce_sales
set email = lower(email)	
where email  is not null;


-- Normalize Country Names
update ecommerce_sales
set country = upper(country);


-- Clean Numeric Fields
UPDATE ecommerce_sales
SET Quantity = NULL
where Quantity < 1 or quantity > 100;

UPDATE ecommerce_sales
set totalamount = price*quantity 
where totalamount is null and quantity is not null


-- Handle Missing Addresses
UPDATE ecommerce_sales
set shippingaddress = 'adress not provides'
where shippingaddress = " ";


--Validate PaymentMethod
UPDATE ecommerce_sales
set paymentmethod = " credit card"
where paymentmethod not in  ('credit card','paypal,bank', 'transfer');


-- Standardize OrderStatus
UPDATE ecommerce_sales
SET OrderStatus = CONCAT(
    UPPER(LEFT(OrderStatus, 1)),
    LOWER(SUBSTRING(OrderStatus, 2))
)
WHERE OrderStatus IS NOT NULL;

-- ADD Primary key
ALTER TABLE ecommerce_sales ADD id INT AUTO_INCREMENT PRIMARY KEY;

-- Remove Duplicates

DELETE t1
FROM ecommerce_sales t1
JOIN ecommerce_sales t2
ON t1.OrderID = t2.OrderID
AND t1.id > t2.id;









