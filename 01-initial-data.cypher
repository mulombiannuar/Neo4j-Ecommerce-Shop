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
    (monitor:PRODUCT {name: "Monitor", price: 1800}),
    (keyboard:PRODUCT {name: "Keyboard", price: 500}),
    

    (electronics:CATEGORY {name: "Electronics"}),
    (accessories:CATEGORY {name: "Accessories"}),

    (asmaa:CUSTOMER {name: "Asmaa Abubakar", email: "asmaaabubakar@gmail.com"}),
    (john:CUSTOMER {name: "John Doe", email: "johndoe@gmail.com"}),

    (sale103:SALE {sale_id: 103, date: "2024-02-10"}),
    (sale104 :SALE {sale_id: 104, date: "2024-02-11"});


//Create Relationships
//MATCH + CREATE – creates the relationship only if it doesn’t exist to avoid duplications
MATCH (monitor:PRODUCT {name: "Monitor"}) 
MATCH (electronics:CATEGORY {name: "Electronics"})
CREATE (monitor)-[:BELONGS_TO]->(electronics);

MATCH (keyboard:PRODUCT {name: "Keyboard"})
MATCH (accessories:CATEGORY {name: "Accessories"})
CREATE (keyboard)-[:BELONGS_TO]->(accessories);

MATCH (asmaa:CUSTOMER {name: "Asmaa Abubakar"})
MATCH (sale103:SALE {sale_id: 103})
CREATE (asmaa)-[:PURCHASED]->(sale103);

MATCH (john:CUSTOMER {name: "John Doe"})
MATCH (sale104:SALE {sale_id: 104})
CREATE (john)-[:PURCHASED]->(sale104);

MATCH (sale103:SALE {sale_id: 104})
MATCH (monitor:PRODUCT {name: "Monitor"})
CREATE (sale103)-[:INCLUDES]->(monitor);

MATCH (sale104:SALE {sale_id: 104})
MATCH (keyboard:PRODUCT {name: "Keyboard"})
CREATE (sale104)-[:INCLUDES]->(keyboard);

MATCH (sale103:SALE {sale_id: 103})
MATCH (smartphone:PRODUCT {name: "Smartphone"})
CREATE (sale103)-[:INCLUDES]->(smartphone);

