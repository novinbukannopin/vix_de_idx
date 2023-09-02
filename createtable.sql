CREATE TABLE DimCustomer(
	CustomerId INT PRIMARY KEY NOT NULL,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	Age INT NOT NULL,
	Gender VARCHAR(50) NOT NULL,
	City VARCHAR(50) NOT NULL,
	NoHp VARCHAR(50) NOT NULL,
);

CREATE TABLE DimProduct(
	ProductId INT PRIMARY KEY NOT NULL,
	ProductName VARCHAR(255) NOT NULL,
	ProductCategory VARCHAR(255) NOT NULL,
	ProductUnitPrice INT,
);

CREATE TABLE DimStatusOrder(
	StatusId INT PRIMARY KEY NOT NULL,
	StatusOrder VARCHAR(50) NOT NULL,
	StatusOrderDesc VARCHAR(50) NOT NULL,
);

CREATE TABLE FactSalesOrder(
	OrderId INT NOT NULL,
	CustomerId INT NOT NULL,
	ProductId INT NOT NULL,
	Quantity INT NOT NULL,
	Amount INT NOT NULL,
	StatusId INT NOT NULL,
	OrderDate Date NOT NULL
	FOREIGN KEY (CustomerId) REFERENCES DimCustomer(CustomerId),
	FOREIGN KEY (ProductId) REFERENCES DimProduct(ProductId),
	FOREIGN KEY (StatusId) REFERENCES DimStatusOrder(StatusId)
)

