/*
  Create a graph database for an e-commerce shop. The database will contain the following nodes:
  - Product (Products sold in the e-commerce store)
  - Category (Categories for the products, like Electronics, Accessories, etc.)
  - Customer (Users who purchase products)
  - Sale (Transactions where customers buy products)

  The relationships between nodes:
  - A Product can belong to one or more Categories.
  - A Customer can make multiple Purchases.
  - A Sale links a Customer to the Products they purchased.
  - A Product can be part of multiple Sales.
*/

// Create Nodes
CREATE 
    (laptop:PRODUCT {name: "Laptop", price: 1200}),
    (smartphone:PRODUCT {name: "Smartphone", price: 800}),
    (headphones:PRODUCT {name: "Headphones", price: 150}),

    (electronics:CATEGORY {name: "Electronics"}),
    (accessories:CATEGORY {name: "Accessories"}),

    (anuary:CUSTOMER {name: "Anuary Mulombi", email: "mulombiannuar@gmail.com"}),
    (grace:CUSTOMER {name: "Grace Gitau", email: "gracegitau@gmail.com"}),

    (sale101:SALE {sale_id: 101, date: "2024-02-08"}),
    (sale102:SALE {sale_id: 102, date: "2024-02-09"});


//Create Relationships
//MATCH + CREATE – creates the relationship only if it doesn’t exist to avoid duplications
MATCH (laptop:PRODUCT {name: "Laptop"}) 
MATCH (electronics:CATEGORY {name: "Electronics"})
CREATE (laptop)-[:BELONGS_TO]->(electronics);

MATCH (smartphone:PRODUCT {name: "Smartphone"})
MATCH (electronics:CATEGORY {name: "Electronics"})
CREATE (smartphone)-[:BELONGS_TO]->(electronics);

MATCH (headphones:PRODUCT {name: "Headphones"})
MATCH (accessories:CATEGORY {name: "Accessories"})
CREATE (headphones)-[:BELONGS_TO]->(accessories);

MATCH (anuary:CUSTOMER {name: "Anuary Mulombi"})
MATCH (sale101:SALE {sale_id: 101})
CREATE (anuary)-[:PURCHASED]->(sale101);

MATCH (grace:CUSTOMER {name: "Grace Gitau"})
MATCH (sale102:SALE {sale_id: 102})
CREATE (grace)-[:PURCHASED]->(sale102);

MATCH (sale101:SALE {sale_id: 101})
MATCH (laptop:PRODUCT {name: "Laptop"})
CREATE (sale101)-[:INCLUDES]->(laptop);

MATCH (sale101:SALE {sale_id: 101})
MATCH (headphones:PRODUCT {name: "Headphones"})
CREATE (sale101)-[:INCLUDES]->(headphones);

MATCH (sale102:SALE {sale_id: 102})
MATCH (smartphone:PRODUCT {name: "Smartphone"})
CREATE (sale102)-[:INCLUDES]->(smartphone);

