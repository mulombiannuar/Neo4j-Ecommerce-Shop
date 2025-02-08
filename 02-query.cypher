//update nodes data
MATCH (asmaa:CUSTOMER {name: 'Asmaa Abubakar'})
SET asmaa.birthdate = date('2003-09-01')
RETURN asmaa;

// deleting a node
MATCH (john:Person {name: 'John Doe'})
DELETE john;


