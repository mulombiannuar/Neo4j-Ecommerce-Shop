//Get everything in the graph
MATCH (node) RETURN node;

//Get all products and their categories
MATCH (product:PRODUCT)-[relationship:BELONGS_TO]->(category:CATEGORY)  
RETURN product, relationship, category;

// Get all customers and their purchases
MATCH (customer:CUSTOMER)-[relationship:PURCHASED]->(sale:SALE)  
RETURN customer, relationship, sale;

// Get all sales and the products Included
MATCH (sale:SALE)-[relationship:INCLUDES]->(product:PRODUCT)  
RETURN sale, relationship, product;

