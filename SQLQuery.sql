CREATE TABLE Autors
(
	Id INT IDENTITY PRIMARY KEY,
    AutorName NVARCHAR(30) NOT NULL    
)

CREATE TABLE Books
(
    Id INT IDENTITY PRIMARY KEY,
    BookName NVARCHAR(30) NOT NULL,
    AutorId INT NOT NULL,
	FOREIGN KEY (AutorId)  REFERENCES Autors (Id), 
    YearOfManufacture INT	
)

CREATE TABLE Customers
(
    Id INT IDENTITY PRIMARY KEY,
    CustomerName NVARCHAR(30) NOT NULL
)

CREATE TABLE Providers
(
    Id INT IDENTITY PRIMARY KEY,
    ProviderName NVARCHAR(30) NOT NULL
)

CREATE TABLE BooksTransactions
(
    Id INT IDENTITY PRIMARY KEY,
	BookId INT NOT NULL,
	FOREIGN KEY (BookId)  REFERENCES Books (Id),
	ProviderId INT NOT NULL,
	FOREIGN KEY (ProviderId)  REFERENCES Providers (Id), 
    CustomerId INT NOT NULL,
	FOREIGN KEY (CustomerId)  REFERENCES Customers (Id), 
	DateOfTransaction Date NOT NULL,
	TypeOfTransaction NVARCHAR(5) NOT NULL,
	Quantity INT NOT NULL,
	Amount FLOAT NOT NULL
)

CREATE INDEX idx_books
ON Books (Id, BookName); 

CREATE INDEX idx_books
ON BooksTransactions (BookId); 

CREATE INDEX idx_provider
ON BooksTransactions (ProviderId); 

CREATE INDEX idx_customer
ON BooksTransactions (CustomerId); 