/* ----------------------------------------------------------------------- */
/* 
CREATE a database: to store all tables. 
*/

/* Q2.1. CREATE database for BrandLux */
CREATE DATABASE IF NOT EXISTS brandlux;

USE brandlux;

/* 
CREATE: Please note, there are all tables created but not all with data (depending if were needed to perform tasks as the date is artificial anyway). 
*/
/* ----------------------------------------------------------------------- */
/*  Dropping of tables in a correct dependency order
/* ----------------------------------------------------------------------- */
DROP TABLE IF EXISTS Tracking;
DROP TABLE IF EXISTS OrderItems;
DROP TABLE IF EXISTS ReturnedItems;
DROP TABLE IF EXISTS Stock;
DROP TABLE IF EXISTS ModelNames;
DROP TABLE IF EXISTS BrandNames;
DROP TABLE IF EXISTS Colours;
DROP TABLE IF EXISTS OrderReturn;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS ShipAdrs;
DROP TABLE IF EXISTS BillAdrs;
DROP TABLE IF EXISTS Countries;
DROP TABLE IF EXISTS Payments;
DROP TABLE IF EXISTS PayStates;
DROP TABLE IF EXISTS OrderStatus;
DROP TABLE IF EXISTS PaymentMethods;
DROP TABLE IF EXISTS Staff;
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Roles;
DROP TABLE IF EXISTS Suppliers;
DROP TABLE IF EXISTS ContactPersons;
DROP TABLE IF EXISTS DeliveryCompany;
DROP TABLE IF EXISTS Representatives;
DROP TABLE IF EXISTS Locations;

/* ----------------------------------------------------------------------- */
/* Q2.2. CREATE tables */
/* ----------------------------------------------------------------------- */
/* Tables needed for main table ‘Stock’ */
/* Support Tables for ‘Suppliers’ */
CREATE TABLE ContactPersons
(
    ContactPersonID int NOT NULL PRIMARY KEY,
    FirstName varchar(20) NOT NULL,
    Surname varchar(20) NOT NULL
);

/* Main table ‘Suppliers’ */
CREATE TABLE Suppliers
(
    SupplierID int NOT NULL PRIMARY KEY,
    SupplierName VARCHAR(50),
    PhoneNo VARCHAR(35),
    eMail VARCHAR(50),
    ContactPersonID int NOT NULL,

    CONSTRAINT FK_ContactPersonID FOREIGN KEY (ContactPersonID) REFERENCES ContactPersons(ContactPersonID)
);

/* Table ‘ModelName’ */
CREATE TABLE ModelNames
(
    ModelNameID int NOT NULL PRIMARY KEY,
    ModelName varchar(15) NOT NULL
);

/* Table ‘BrandName’ */
CREATE TABLE BrandNames
(
    BrandNameID int NOT NULL PRIMARY KEY,
    BrandName varchar(15) NOT NULL
);

/* Table ‘Colour’ */
CREATE TABLE Colours
(
    ColourID int NOT NULL PRIMARY KEY,
    Colour varchar(10) NOT NULL
);

/* Table ‘Location’ */
CREATE TABLE Locations
(
    LocationID int NOT NULL PRIMARY KEY,
    LocationN varchar(10) NOT NULL
);

/* Main table ‘Stock’ */
CREATE TABLE Stock
(
    ItemID int NOT NULL PRIMARY KEY,
    BrandNameID int NOT NULL,
    ModelNameID int NOT NULL,
    ColourID int NOT NULL,
    Size int,
    UnitPrice float,
    LocationID int,
    Quantity int,
    SupplierID int NOT NULL,
    
    CONSTRAINT FK_BrandNameID FOREIGN KEY (BrandNameID) REFERENCES BrandNames(BrandNameID),
    CONSTRAINT FK_ModelNameID FOREIGN KEY (ModelNameID) REFERENCES ModelNames(ModelNameID),
    CONSTRAINT FK_ColourID FOREIGN KEY (ColourID) REFERENCES Colours(ColourID),
    CONSTRAINT FK_LocationID FOREIGN KEY (LocationID) REFERENCES Locations(LocationID),
    CONSTRAINT FK_SupplierID FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
); 

/* ----------------------------------------------------------------------- */
/*  Tables for Customers */
/* ----------------------------------------------------------------------- */
/* Table ‘Country’ */
CREATE TABLE Countries
(
    CountryID int NOT NULL PRIMARY KEY,
    Country varchar(50)
);

/* Table ‘BillAdrs’ */
CREATE TABLE BillAdrs
(
    BillAdrsID int NOT NULL PRIMARY KEY,
    Address1 varchar(50) NOT NULL,
    Address2 varchar(50),
    City varchar(30) NOT NULL,
    PostCode varchar(10) NOT NULL,
    CountryID int NOT NULL,

    CONSTRAINT FK_CountryID FOREIGN KEY (CountryID) REFERENCES Countries(CountryID)
);

/* Table ‘ShipAdrs’ */
CREATE TABLE ShipAdrs
(
    ShipAdrsID int NOT NULL PRIMARY KEY,
    Address1 varchar(50) NOT NULL,
    Address2 varchar(50),
    City varchar(30) NOT NULL,
    PostCode varchar(10) NOT NULL,
    CountryID int NOT NULL,

    CONSTRAINT FK_ShipCountryID FOREIGN KEY (CountryID) REFERENCES Countries(CountryID)
);

/* Main table ‘Customers’ */
CREATE TABLE Customers
(
    CustomerID int NOT NULL PRIMARY KEY,
    FName varchar(15) NOT NULL,
    Surname varchar(15) NOT NULL,
    PhoneNo varchar(35) NOT NULL,
    eMail varchar(50),
    BillAdrsID int NOT NULL,
    ShipAdrsID int NOT NULL,

    CONSTRAINT FK_BillAdrsID FOREIGN KEY (BillAdrsID) REFERENCES BillAdrs(BillAdrsID),
    CONSTRAINT FK_ShipAdrsID FOREIGN KEY (ShipAdrsID) REFERENCES ShipAdrs(ShipAdrsID)
);

/* ----------------------------------------------------------------------- */
/*  Tables for Staff */
/* ----------------------------------------------------------------------- */

/* Table ‘Department’ */
CREATE TABLE Departments
(
    DepartmID int NOT NULL PRIMARY KEY,
    DepartmName varchar(50) NOT NULL
);

/* Table ‘Position */
CREATE TABLE Roles
(
    RoleID int NOT NULL PRIMARY KEY,
    RoleName varchar(30) NOT NULL
);

/* Main table ‘Staff’ */
CREATE TABLE Staff
(
    StaffID int NOT NULL PRIMARY KEY,
    FirstName varchar(15) NOT NULL,
    Surname varchar(15) NOT NULL,
    DepartmentID int NOT NULL, 
    RoleID int,
    AddressInfo VARCHAR(80),
    PhoneNo varchar(35),
    StartDate date,

    CONSTRAINT FK_DepartmentID FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmID),
    CONSTRAINT FK_RoleID FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
);

/* ----------------------------------------------------------------------- */
/* Tables for Payments */
/* ----------------------------------------------------------------------- */
/* Table PayStates */
CREATE TABLE PayStates
(
    PayStatusID int NOT NULL PRIMARY KEY,
    StatusP varchar(10)
);

/* Table ‘Payments’ */
CREATE TABLE Payments
(
    PaymentID int NOT NULL PRIMARY KEY,
    PayStateID int,
    CONSTRAINT FK_PayStateID FOREIGN KEY (PayStateID) REFERENCES PayStates(PayStatusID)
);

/* ----------------------------------------------------------------------- */
/* Tables for Orders */
/* ----------------------------------------------------------------------- */
/* Table for OrderStatus */
CREATE TABLE OrderStatus
(
    OrderStatusID int NOT NULL PRIMARY KEY,
    StatusName varchar(50) NOT NULL
);

/* Tables for OrderItems */
CREATE TABLE OrderItems
(
    OrderItemID int NOT NULL PRIMARY KEY,
    ItemID int NOT NULL,
    Quantity int NOT NULL,
    OrderID int NOT NULL,

    CONSTRAINT FK_ItemID FOREIGN KEY (ItemID) REFERENCES Stock(ItemID),
    CONSTRAINT FK_OrderItemsOrderID FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

/* Main Table ‘Orders’ */
CREATE TABLE Orders
(
    OrderID int NOT NULL PRIMARY KEY,
    OrderDate DATE,
    TotalPrice DECIMAL(6,2) NOT NULL,
    PaymentID int NOT NULL,
    OrderStatusID int NOT NULL,
    StaffID int NOT NULL,
    CustomerID int NOT NULL,

    CONSTRAINT FK_OrderStatusID FOREIGN KEY (OrderStatusID) REFERENCES OrderStatus(OrderStatusID),
    CONSTRAINT FK_PaymentID FOREIGN KEY (PaymentID) REFERENCES Payments(PaymentID),
    CONSTRAINT FK_StaffID FOREIGN KEY (StaffID) REFERENCES Staff(StaffID),
    CONSTRAINT FK_CustomerID FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

/* ----------------------------------------------------------------------- */
/* Tables for Returns */
/* ----------------------------------------------------------------------- */
/* Table ‘PayTypes’ */
CREATE TABLE PaymentMethods
(
    MethodID int NOT NULL PRIMARY KEY,
    Method varchar(20)
);

/* Table `ReturnedItems’ */
CREATE TABLE ReturnedItems
(
    ReturnNo int NOT NULL PRIMARY KEY,
    ItemID int NOT NULL,
    Quantity int NOT NULL,

    CONSTRAINT FK_ReturnItemID FOREIGN KEY (ItemID) REFERENCES Stock(ItemID)
);

/* Main table ‘Returns’ */
CREATE TABLE OrderReturn
(
    ReturnID int NOT NULL PRIMARY KEY,
    ReturnDate date,
    OrderID int NOT NULL,
    PayMethodID int NOT NULL,
    StaffID int NOT NULL,

    CONSTRAINT FK_ReturnOrderID FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    CONSTRAINT FK_ReturnPayTypeID FOREIGN KEY (PayMethodID) REFERENCES PaymentMethods(MethodID),
    CONSTRAINT FK_ReturnStaffID FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

/* ----------------------------------------------------------------------- */
/* Tables for Shipping */
/* ----------------------------------------------------------------------- */
/* Table ‘Representative’ */
CREATE TABLE Representatives
(
    RepresentID int NOT NULL PRIMARY KEY,
    RepFirstName varchar(20) NOT NULL,
    RepLastName varchar(30) NOT NULL
);

/* Table ‘Tracking’ */
CREATE TABLE Tracking
(
    TransportID int NOT NULL PRIMARY KEY,
    OrderID int NOT NULL,
    CONSTRAINT FK_TrackingOrderID FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

/* Table ‘Shipping’ */
CREATE TABLE DeliveryCompany
(
    CompanyID int NOT NULL PRIMARY KEY,
    CompanyName varchar(30),
    PhoneNo varchar(35),
    RepresentID int NOT NULL,
    AddressInfo varchar(80),

    CONSTRAINT FK_RepresentID FOREIGN KEY (RepresentID) REFERENCES Representatives(RepresentID)
);

/* ----------------------------------------------------------------------- */
/* ----------------------------------------------------------------------- */
/* ----------------------------------------------------------------------- */
/* ----------------------------------------------------------------------- */
/*  Q2.3 Inserts of 3 to 4 tables with some data
/* ----------------------------------------------------------------------- */
/* Adding data to table Departments */
insert into Departments (DepartmID, DepartmName) values (1, 'Sales');
insert into Departments (DepartmID, DepartmName) values (2, 'Support');
insert into Departments (DepartmID, DepartmName) values (3, 'Returns');
insert into Departments (DepartmID, DepartmName) values (4, 'Service');

/* Adding data to table Roles */
insert into Roles (RoleID, RoleName) values (1, 'Sales Assistant');
insert into Roles (RoleID, RoleName) values (2, 'Sales Manager');
insert into Roles (RoleID, RoleName) values (3, 'Trainee');
insert into Roles (RoleID, RoleName) values (4, 'Customer Support');

/* Adding data to table Staff */
insert into Staff (StaffID, FirstName, Surname, DepartmentID, RoleID, AddressInfo, PhoneNo, StartDate) values (1, 'Erma', 'Kidner', 3, 1, '37 Dahle Place', '+66 (507) 234-1381', '2016/10/03');
insert into Staff (StaffID, FirstName, Surname, DepartmentID, RoleID, AddressInfo, PhoneNo, StartDate) values (2, 'Elisabetta', 'Dungay', 2, 2, '810 Steensland Junction', '+62 (364) 566-6105', '2011/04/07');
insert into Staff (StaffID, FirstName, Surname, DepartmentID, RoleID, AddressInfo, PhoneNo, StartDate) values (3, 'Forrester', 'Marzella', 3, 2, '077 Cardinal Parkway', '+86 (539) 815-9012', '2020/12/23');
insert into Staff (StaffID, FirstName, Surname, DepartmentID, RoleID, AddressInfo, PhoneNo, StartDate) values (4, 'Candida', 'Howlett', 3, 4, '6598 Union Park', '+54 (947) 443-4814', '2020/06/03');
insert into Staff (StaffID, FirstName, Surname, DepartmentID, RoleID, AddressInfo, PhoneNo, StartDate) values (5, 'Kane', 'Alesin', 4, 3, '0 Londonderry Drive', '+420 (961) 276-3722', '2011/09/15');
insert into Staff (StaffID, FirstName, Surname, DepartmentID, RoleID, AddressInfo, PhoneNo, StartDate) values (6, 'Orren', 'McLelland', 4, 2, '33 Ilene Parkway', '+242 (999) 915-8657', '2014/10/31');
insert into Staff (StaffID, FirstName, Surname, DepartmentID, RoleID, AddressInfo, PhoneNo, StartDate) values (7, 'Katalin', 'Vairow', 3, 1, '30012 Crest Line Crossing', '+7 (620) 766-8603', '2017/05/12');
insert into Staff (StaffID, FirstName, Surname, DepartmentID, RoleID, AddressInfo, PhoneNo, StartDate) values (8, 'Florenza', 'Pilsworth', 4, 3, '84379 Farmco Plaza', '+7 (500) 629-4149', '2015/11/16');
insert into Staff (StaffID, FirstName, Surname, DepartmentID, RoleID, AddressInfo, PhoneNo, StartDate) values (9, 'Jenelle', 'Martensen', 2, 1, '1 Springview Hill', '+355 (871) 646-8034', '2014/02/17');
insert into Staff (StaffID, FirstName, Surname, DepartmentID, RoleID, AddressInfo, PhoneNo, StartDate) values (10, 'Courtney', 'Collecott', 2, 2, '727 Petterle Crossing', '+420 (102) 622-2760', '2018/03/17');
insert into Staff (StaffID, FirstName, Surname, DepartmentID, RoleID, AddressInfo, PhoneNo, StartDate) values (11, 'Sande', 'Bowkley', 2, 4, '6 Forest Court', '+53 (361) 626-6125', '2011/04/20');
insert into Staff (StaffID, FirstName, Surname, DepartmentID, RoleID, AddressInfo, PhoneNo, StartDate) values (12, 'Ryley', 'Eliyahu', 3, 3, '2 Waywood Center', '+7 (680) 830-8336', '2014/09/19');
insert into Staff (StaffID, FirstName, Surname, DepartmentID, RoleID, AddressInfo, PhoneNo, StartDate) values (13, 'Saul', 'Dalyell', 2, 2, '603 Utah Point', '+86 (306) 822-5751', '2014/10/31');
insert into Staff (StaffID, FirstName, Surname, DepartmentID, RoleID, AddressInfo, PhoneNo, StartDate) values (14, 'Dirk', 'Goade', 1, 4, '2 Columbus Terrace', '+86 (363) 946-0919', '2020/09/13');
insert into Staff (StaffID, FirstName, Surname, DepartmentID, RoleID, AddressInfo, PhoneNo, StartDate) values (15, 'Shawn', 'Nono', 4, 4, '2222 Dapin Hill', '+594 (303) 759-5179', '2014/06/25');
insert into Staff (StaffID, FirstName, Surname, DepartmentID, RoleID, AddressInfo, PhoneNo, StartDate) values (16, 'Maxwell', 'Hudel', 1, 2, '3 Everett Hill', '+7 (388) 709-0840', '2015/02/22');
insert into Staff (StaffID, FirstName, Surname, DepartmentID, RoleID, AddressInfo, PhoneNo, StartDate) values (17, 'Crista', 'Zanussii', 3, 3, '3851 Mayfield Road', '+234 (595) 591-5894', '2017/02/01');
insert into Staff (StaffID, FirstName, Surname, DepartmentID, RoleID, AddressInfo, PhoneNo, StartDate) values (18, 'Sandro', 'Carson', 3, 1, '15 Michigan Plaza', '+86 (951) 199-6185', '2012/07/25');
insert into Staff (StaffID, FirstName, Surname, DepartmentID, RoleID, AddressInfo, PhoneNo, StartDate) values (19, 'Shepherd', 'Mungane', 1, 3, '49618 Kensington Road', '+351 (215) 549-4962', '2018/07/06');
insert into Staff (StaffID, FirstName, Surname, DepartmentID, RoleID, AddressInfo, PhoneNo, StartDate) values (20, 'Torrin', 'Tomich', 4, 2, '86 Ridgeway Road', '+7 (449) 472-2496', '2016/03/22');
insert into Staff (StaffID, FirstName, Surname, DepartmentID, RoleID, AddressInfo, PhoneNo, StartDate) values (21, 'Xymenes', 'Donhardt', 2, 2, '6 Green Avenue', '+86 (856) 886-1664', '2013/02/12');
insert into Staff (StaffID, FirstName, Surname, DepartmentID, RoleID, AddressInfo, PhoneNo, StartDate) values (22, 'Kathrine', 'Tripney', 2, 4, '168 Annamark Road', '+86 (306) 327-0983', '2019/03/31');
insert into Staff (StaffID, FirstName, Surname, DepartmentID, RoleID, AddressInfo, PhoneNo, StartDate) values (23, 'Wynn', 'Trewhitt', 3, 1, '43 Sutteridge Plaza', '+86 (887) 831-3748', '2012/02/04');
insert into Staff (StaffID, FirstName, Surname, DepartmentID, RoleID, AddressInfo, PhoneNo, StartDate) values (24, 'Pia', 'Greetham', 1, 4, '79444 Buena Vista Circle', '+86 (549) 364-9695', '2015/04/12');
insert into Staff (StaffID, FirstName, Surname, DepartmentID, RoleID, AddressInfo, PhoneNo, StartDate) values (25, 'Charyl', 'Scintsbury', 1, 2, '63325 Forest Run Hill', '+62 (632) 619-5029', '2016/08/11');
insert into Staff (StaffID, FirstName, Surname, DepartmentID, RoleID, AddressInfo, PhoneNo, StartDate) values (26, 'Keary', 'Ogilvy', 4, 2, '190 Rockefeller Alley', '+86 (482) 842-2821', '2012/11/19');
insert into Staff (StaffID, FirstName, Surname, DepartmentID, RoleID, AddressInfo, PhoneNo, StartDate) values (27, 'Ogdan', 'Dradey', 1, 3, '74 Sutteridge Point', '+66 (408) 443-4638', '2011/07/29');
insert into Staff (StaffID, FirstName, Surname, DepartmentID, RoleID, AddressInfo, PhoneNo, StartDate) values (28, 'Horst', 'Arnout', 3, 1, '22460 Spohn Terrace', '+351 (520) 287-2633', '2016/07/09');
insert into Staff (StaffID, FirstName, Surname, DepartmentID, RoleID, AddressInfo, PhoneNo, StartDate) values (29, 'Benn', 'Skeat', 3, 2, '1 Stang Place', '+86 (281) 991-6926', '2013/06/07');
insert into Staff (StaffID, FirstName, Surname, DepartmentID, RoleID, AddressInfo, PhoneNo, StartDate) values (30, 'Flynn', 'Petronis', 4, 2, '3530 Pepper Wood Trail', '+86 (127) 720-3815', '2019/06/01');


/* ------------------------------------------------------------------------------------------- */
/* Adding data to table ContactPerson for Suppliers Table */
insert into ContactPersons (ContactPersonID, FirstName, Surname) values (1, 'Paten', 'Gasquoine');
insert into ContactPersons (ContactPersonID, FirstName, Surname) values (2, 'Sonya', 'Southon');
insert into ContactPersons (ContactPersonID, FirstName, Surname) values (3, 'Nedi', 'Newsham');
insert into ContactPersons (ContactPersonID, FirstName, Surname) values (4, 'Rosalyn', 'Lilian');
insert into ContactPersons (ContactPersonID, FirstName, Surname) values (5, 'Clara', 'Bum');
insert into ContactPersons (ContactPersonID, FirstName, Surname) values (6, 'Tine', 'Szubert');
insert into ContactPersons (ContactPersonID, FirstName, Surname) values (7, 'Lydie', 'MacCart');
insert into ContactPersons (ContactPersonID, FirstName, Surname) values (8, 'Martie', 'Duchenne');
insert into ContactPersons (ContactPersonID, FirstName, Surname) values (9, 'Myrwyn', 'Moakes');
insert into ContactPersons (ContactPersonID, FirstName, Surname) values (10, 'Tulley', 'Jacquemy');


/* Adding data to table ContactPerson for Suppliers Table */
insert into Suppliers (SupplierID, SupplierName, PhoneNo, eMail, ContactPersonID) values (1, 'Gigazoom', '+7 (579) 739-5285', 'tdancer0@bravesites.com', 7);
insert into Suppliers (SupplierID, SupplierName, PhoneNo, eMail, ContactPersonID) values (2, 'Roombo', '+86 (970) 260-5496', 'hburkett1@bloglovin.com', 5);
insert into Suppliers (SupplierID, SupplierName, PhoneNo, eMail, ContactPersonID) values (3, 'Skyndu', '+86 (489) 404-1951', 'gcapnor2@irs.gov', 1);
insert into Suppliers (SupplierID, SupplierName, PhoneNo, eMail, ContactPersonID) values (4, 'Dablist', '+30 (180) 481-1989', 'csparsholt3@eventbrite.com', 8);
insert into Suppliers (SupplierID, SupplierName, PhoneNo, eMail, ContactPersonID) values (5, 'Skyvu', '+1 (605) 191-3826', 'bpocknell4@unc.edu', 7);
insert into Suppliers (SupplierID, SupplierName, PhoneNo, eMail, ContactPersonID) values (6, 'Linktype', '+81 (193) 940-8060', 'ghenriksson5@europa.eu', 9);
insert into Suppliers (SupplierID, SupplierName, PhoneNo, eMail, ContactPersonID) values (7, 'Fiveclub', '+39 (364) 664-7125', 'dsimenel6@oakley.com', 3);
insert into Suppliers (SupplierID, SupplierName, PhoneNo, eMail, ContactPersonID) values (8, 'Tekfly', '+84 (713) 630-8844', 'ecowderoy7@zimbio.com', 9);
insert into Suppliers (SupplierID, SupplierName, PhoneNo, eMail, ContactPersonID) values (9, 'LiveZ', '+51 (742) 675-5646', 'cyukhin8@aol.com', 8);
insert into Suppliers (SupplierID, SupplierName, PhoneNo, eMail, ContactPersonID) values (10, 'Vimbo', '+351 (905) 389-4807', 'gcurm9@state.gov', 3);
insert into Suppliers (SupplierID, SupplierName, PhoneNo, eMail, ContactPersonID) values (11, 'Tagcat', '+7 (901) 314-0067', 'sblaszczyka@elegantthemes.com', 6);
insert into Suppliers (SupplierID, SupplierName, PhoneNo, eMail, ContactPersonID) values (12, 'Reallinks', '+62 (330) 122-6128', 'hbelderfieldb@samsung.com', 1);
insert into Suppliers (SupplierID, SupplierName, PhoneNo, eMail, ContactPersonID) values (13, 'Meembee', '+237 (490) 682-0293', 'ktrodlerc@vistaprint.com', 9);
insert into Suppliers (SupplierID, SupplierName, PhoneNo, eMail, ContactPersonID) values (14, 'Topicware', '+48 (429) 182-3735', 'msurgoodd@shareasale.com', 5);
insert into Suppliers (SupplierID, SupplierName, PhoneNo, eMail, ContactPersonID) values (15, 'Aimbu', '+82 (502) 842-3180', 'ssamsonsene@wordpress.org', 1);
insert into Suppliers (SupplierID, SupplierName, PhoneNo, eMail, ContactPersonID) values (16, 'Meeveo', '+62 (428) 203-9169', 'eetchinghamf@foxnews.com', 3);
insert into Suppliers (SupplierID, SupplierName, PhoneNo, eMail, ContactPersonID) values (17, 'Thoughtbridge', '+57 (596) 212-1351', 'wmomeryg@va.gov', 9);
insert into Suppliers (SupplierID, SupplierName, PhoneNo, eMail, ContactPersonID) values (18, 'Gabcube', '+7 (972) 594-0805', 'nmcgeochh@addthis.com', 1);
insert into Suppliers (SupplierID, SupplierName, PhoneNo, eMail, ContactPersonID) values (19, 'Zoonoodle', '+48 (718) 428-6825', 'slynaghi@cmu.edu', 10);
insert into Suppliers (SupplierID, SupplierName, PhoneNo, eMail, ContactPersonID) values (20, 'Jetwire', '+63 (923) 192-8114', 'lmcalindenj@weebly.com', 4);
insert into Suppliers (SupplierID, SupplierName, PhoneNo, eMail, ContactPersonID) values (21, 'Twimm', '+385 (375) 747-2798', 'mgareisrk@noaa.gov', 5);
insert into Suppliers (SupplierID, SupplierName, PhoneNo, eMail, ContactPersonID) values (22, 'Blogpad', '+86 (422) 934-8425', 'dmccanel@ameblo.jp', 5);
insert into Suppliers (SupplierID, SupplierName, PhoneNo, eMail, ContactPersonID) values (23, 'Divanoodle', '+63 (214) 470-1314', 'dtodmanm@qq.com', 9);
insert into Suppliers (SupplierID, SupplierName, PhoneNo, eMail, ContactPersonID) values (24, 'Meembee', '+1 (917) 439-1695', 'mronaldn@mozilla.com', 1);
insert into Suppliers (SupplierID, SupplierName, PhoneNo, eMail, ContactPersonID) values (25, 'Zooveo', '+55 (334) 291-8214', 'cgriolio@nyu.edu', 10);
insert into Suppliers (SupplierID, SupplierName, PhoneNo, eMail, ContactPersonID) values (26, 'Vitz', '+358 (675) 160-4052', 'megerp@hexun.com', 5);
insert into Suppliers (SupplierID, SupplierName, PhoneNo, eMail, ContactPersonID) values (27, 'Latz', '+86 (984) 901-2316', 'eblandamoreq@macromedia.com', 1);
insert into Suppliers (SupplierID, SupplierName, PhoneNo, eMail, ContactPersonID) values (28, 'Jaxnation', '+33 (255) 868-9538', 'lstollmanr@ning.com', 8);
insert into Suppliers (SupplierID, SupplierName, PhoneNo, eMail, ContactPersonID) values (29, 'Photojam', '+51 (390) 972-8066', 'efordhams@forbes.com', 3);
insert into Suppliers (SupplierID, SupplierName, PhoneNo, eMail, ContactPersonID) values (30, 'Skajo', '+66 (343) 514-7250', 'aobriant@nydailynews.com', 4);

/* ------------------------------------------------------------------------------------------- */
/* Adding data to tables Country for Customers Table */
insert into Countries (CountryID, Country) values (1, 'Mexico');
insert into Countries (CountryID, Country) values (2, 'France');
insert into Countries (CountryID, Country) values (3, 'Philippines');
insert into Countries (CountryID, Country) values (4, 'Indonesia');
insert into Countries (CountryID, Country) values (5, 'China');
insert into Countries (CountryID, Country) values (6, 'China');
insert into Countries (CountryID, Country) values (7, 'United States');
insert into Countries (CountryID, Country) values (8, 'China');
insert into Countries (CountryID, Country) values (9, 'Canada');
insert into Countries (CountryID, Country) values (10, 'Portugal');
insert into Countries (CountryID, Country) values (11, 'Czech Republic');
insert into Countries (CountryID, Country) values (12, 'Russia');
insert into Countries (CountryID, Country) values (13, 'China');
insert into Countries (CountryID, Country) values (14, 'Brazil');
insert into Countries (CountryID, Country) values (15, 'Hungary');
insert into Countries (CountryID, Country) values (16, 'Morocco');
insert into Countries (CountryID, Country) values (17, 'Sweden');
insert into Countries (CountryID, Country) values (18, 'Tanzania');
insert into Countries (CountryID, Country) values (19, 'China');
insert into Countries (CountryID, Country) values (20, 'Kosovo');
insert into Countries (CountryID, Country) values (21, 'Portugal');
insert into Countries (CountryID, Country) values (22, 'China');
insert into Countries (CountryID, Country) values (23, 'China');
insert into Countries (CountryID, Country) values (24, 'Poland');
insert into Countries (CountryID, Country) values (25, 'France');
insert into Countries (CountryID, Country) values (26, 'Albania');
insert into Countries (CountryID, Country) values (27, 'Finland');
insert into Countries (CountryID, Country) values (28, 'Czech Republic');
insert into Countries (CountryID, Country) values (29, 'United States');
insert into Countries (CountryID, Country) values (30, 'Turkey');
insert into Countries (CountryID, Country) values (31, 'Czech Republic');
insert into Countries (CountryID, Country) values (32, 'Indonesia');
insert into Countries (CountryID, Country) values (33, 'Chad');
insert into Countries (CountryID, Country) values (34, 'China');
insert into Countries (CountryID, Country) values (35, 'Cameroon');
insert into Countries (CountryID, Country) values (36, 'Portugal');
insert into Countries (CountryID, Country) values (37, 'France');
insert into Countries (CountryID, Country) values (38, 'Philippines');
insert into Countries (CountryID, Country) values (39, 'Netherlands');
insert into Countries (CountryID, Country) values (40, 'Philippines');
insert into Countries (CountryID, Country) values (41, 'Uganda');
insert into Countries (CountryID, Country) values (42, 'Philippines');
insert into Countries (CountryID, Country) values (43, 'China');
insert into Countries (CountryID, Country) values (44, 'China');
insert into Countries (CountryID, Country) values (45, 'Brazil');
insert into Countries (CountryID, Country) values (46, 'Tajikistan');
insert into Countries (CountryID, Country) values (47, 'Iran');
insert into Countries (CountryID, Country) values (48, 'China');
insert into Countries (CountryID, Country) values (49, 'Faroe Islands');
insert into Countries (CountryID, Country) values (50, 'Peru');

/* ------------------------------------------------------------------------------------------- */
/* Adding data to tables BillAdrs for Customers Table */
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (1, '9818 Clyde Gallagher Crossing', 'Abruzzi', 'Pescara', '14783-313', 49);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (2, '7885 Anthes Court', 'Abruzzi', 'Pescara', '58118-0105', 12);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (3, '3851 Ludington Hill', 'Abruzzi', 'Pescara', '0363-0831', 44);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (4, '068 Sunnyside Center', 'Abruzzi', 'Pescara', '64125-130', 9);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (5, '5695 American Ash Place', 'Abruzzi', 'Pescara', '60429-301', 48);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (6, '3 Manufacturers Plaza', 'Abruzzi', 'Pescara', '13107-054', 33);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (7, '7 Sachs Road', 'Abruzzi', 'Pescara', '25021-806', 6);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (8, '29 Northport Trail', 'Abruzzi', 'Pescara', '68084-060', 1);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (9, '33 Northland Place', 'Abruzzi', 'Pescara', '0268-0890', 44);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (10, '65 Cambridge Place', 'Abruzzi', 'Pescara', '54868-5749', 35);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (11, '33632 Dovetail Parkway', 'Abruzzi', 'Pescara', '0781-2274', 50);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (12, '466 Londonderry Crossing', 'Abruzzi', 'Pescara', '63629-3332', 40);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (13, '606 Redwing Court', 'Abruzzi', 'Pescara', '11523-7207', 32);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (14, '4 Esch Center', 'Abruzzi', 'Pescara', '41250-016', 24);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (15, '3329 Sauthoff Circle', 'Abruzzi', 'Pescara', '60232-8581', 2);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (16, '048 Westend Lane', 'Abruzzi', 'Pescara', '49348-471', 7);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (17, '2 Maple Wood Trail', 'Abruzzi', 'Pescara', '66975-350', 6);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (18, '1 Morning Terrace', 'Abruzzi', 'Pescara', '42508-163', 30);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (19, '5949 Mallory Junction', 'Abruzzi', 'Pescara', '60927-116', 24);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (20, '9 Mifflin Hill', 'Abruzzi', 'Pescara', '64613-5800', 17);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (21, '8 Sunbrook Avenue', 'Abruzzi', 'Pescara', '59630-750', 22);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (22, '60246 Becker Hill', 'Abruzzi', 'Pescara', '0641-0497', 18);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (23, '8 Bultman Crossing', 'Abruzzi', 'Pescara', '49288-0483', 31);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (24, '6861 Lukken Lane', 'Abruzzi', 'Pescara', '52125-413', 6);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (25, '8 Eliot Lane', 'Abruzzi', 'Pescara', '55714-2242', 24);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (26, '0 Northview Plaza', 'Abruzzi', 'Pescara', '0378-0088', 49);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (27, '8266 Fairfield Court', 'Abruzzi', 'Pescara', '62678-207', 28);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (28, '011 American Street', 'Abruzzi', 'Pescara', '59762-1004', 19);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (29, '57 Graedel Alley', 'Abruzzi', 'Pescara', '51143-124', 34);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (30, '9091 Forest Dale Park', 'Abruzzi', 'Pescara', '65044-5222', 41);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (31, '6 Victoria Plaza', 'Abruzzi', 'Pescara', '55301-003', 1);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (32, '3 Hauk Court', 'Abruzzi', 'Pescara', '76340-4001', 49);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (33, '7990 Fuller Circle', 'Abruzzi', 'Pescara', '54868-5095', 3);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (34, '2 Everett Park', 'Abruzzi', 'Pescara', '25021-803', 21);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (35, '04630 Rieder Lane', 'Abruzzi', 'Pescara', '59779-006', 47);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (36, '4700 Carioca Plaza', 'Abruzzi', 'Pescara', '41616-882', 30);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (37, '79649 Mesta Road', 'Abruzzi', 'Pescara', '50563-177', 22);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (38, '32 Warrior Court', 'Abruzzi', 'Pescara', '68001-184', 42);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (39, '809 Golf View Drive', 'Abruzzi', 'Pescara', '55154-0748', 31);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (40, '9880 Bartelt Court', 'Abruzzi', 'Pescara', '46994-612', 19);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (41, '5427 Bultman Alley', 'Abruzzi', 'Pescara', '55154-4351', 31);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (42, '55 Emmet Crossing', 'Abruzzi', 'Pescara', '65044-2677', 13);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (43, '7 Magdeline Road', 'Abruzzi', 'Pescara', '69043-003', 41);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (44, '94618 Anzinger Road', 'Abruzzi', 'Pescara', '31722-729', 3);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (45, '50440 Blackbird Drive', 'Abruzzi', 'Pescara', '44237-002', 15);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (46, '03 Westerfield Parkway', 'Abruzzi', 'Pescara', '49288-0927', 45);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (47, '2 Washington Junction', 'Abruzzi', 'Pescara', '0065-0325', 41);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (48, '547 Welch Crossing', 'Abruzzi', 'Pescara', '43063-439', 21);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (49, '2581 Commercial Circle', 'Abruzzi', 'Pescara', '59148-018', 38);
insert into BillAdrs (BillAdrsID, Address1, Address2, City, PostCode, CountryID) values (50, '13 Shasta Hill', 'Abruzzi', 'Pescara', '13537-152', 6);


/* ------------------------------------------------------------------------------------------- */
/* Adding data to tables ShipAdreess for Customers Table */
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (1, '9592 John Wall Street', 'Abruzzi', 'Pescara', '43063-244', 22);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (2, '9 Garrison Hill', 'Abruzzi', 'Pescara', '49514-253', 14);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (3, '8377 Waxwing Terrace', 'Abruzzi', 'Pescara', '52125-105', 45);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (4, '40 Farmco Crossing', 'Abruzzi', 'Pescara', '0168-0071', 31);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (5, '1905 Lotheville Road', 'Abruzzi', 'Pescara', '52380-0005', 38);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (6, '8373 Carey Alley', 'Abruzzi', 'Pescara', '43419-363', 9);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (7, '26 Shoshone Place', 'Abruzzi', 'Pescara', '41520-980', 37);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (8, '53 Kropf Parkway', 'Abruzzi', 'Pescara', '43063-481', 38);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (9, '3312 Talmadge Alley', 'Abruzzi', 'Pescara', '11673-447', 16);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (10, '11180 Monument Trail', 'Abruzzi', 'Pescara', '55648-737', 21);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (11, '2792 Delladonna Crossing', 'Abruzzi', 'Pescara', '66975-415', 5);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (12, '22 Bashford Place', 'Abruzzi', 'Pescara', '17478-060', 40);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (13, '7597 Northridge Center', 'Abruzzi', 'Pescara', '0280-8050', 16);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (14, '9 Johnson Way', 'Abruzzi', 'Pescara', '68788-9798', 32);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (15, '4090 Delaware Pass', 'Abruzzi', 'Pescara', '61328-001', 34);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (16, '1 Clarendon Street', 'Abruzzi', 'Pescara', '52862-200', 41);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (17, '41615 Cascade Point', 'Abruzzi', 'Pescara', '76439-122', 45);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (18, '6486 Mendota Hill', 'Abruzzi', 'Pescara', '55154-4036', 21);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (19, '811 Eastlawn Place', 'Abruzzi', 'Pescara', '61957-1830', 29);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (20, '39441 Karstens Alley', 'Abruzzi', 'Pescara', '59260-135', 18);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (21, '16 Menomonie Drive', 'Abruzzi', 'Pescara', '58479-004', 45);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (22, '03702 Namekagon Drive', 'Abruzzi', 'Pescara', '54868-6745', 49);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (23, '54 Scott Crossing', 'Abruzzi', 'Pescara', '21695-551', 7);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (24, '2925 Spohn Terrace', 'Abruzzi', 'Pescara', '56062-302', 6);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (25, '9 Ludington Way', 'Abruzzi', 'Pescara', '54973-2925', 12);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (26, '89404 Katie Junction', 'Abruzzi', 'Pescara', '76485-1040', 19);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (27, '4922 Duke Hill', 'Abruzzi', 'Pescara', '55301-343', 41);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (28, '661 Rigney Parkway', 'Abruzzi', 'Pescara', '35356-952', 31);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (29, '64 Springview Point', 'Abruzzi', 'Pescara', '60429-767', 8);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (30, '412 Gulseth Road', 'Abruzzi', 'Pescara', '0363-0125', 38);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (31, '1 Kenwood Hill', 'Abruzzi', 'Pescara', '60840-0200', 7);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (32, '72244 Luster Parkway', 'Abruzzi', 'Pescara', '63629-1507', 15);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (33, '9382 Erie Street', 'Abruzzi', 'Pescara', '57955-5024', 9);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (34, '27 Lawn Drive', 'Abruzzi', 'Pescara', '62672-221', 19);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (35, '6 Golf View Junction', 'Abruzzi', 'Pescara', '59779-107', 16);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (36, '6 Charing Cross Avenue', 'Abruzzi', 'Pescara', '68428-040', 37);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (37, '25935 Anderson Hill', 'Abruzzi', 'Pescara', '11673-106', 16);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (38, '7766 Carey Trail', 'Abruzzi', 'Pescara', '51545-120', 50);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (39, '8 Columbus Alley', 'Abruzzi', 'Pescara', '36987-1742', 49);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (40, '140 Arapahoe Point', 'Abruzzi', 'Pescara', '59779-182', 9);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (41, '6 Schurz Road', 'Abruzzi', 'Pescara', '10889-102', 16);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (42, '0115 Towne Street', 'Abruzzi', 'Pescara', '68382-079', 39);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (43, '596 Twin Pines Hill', 'Abruzzi', 'Pescara', '0078-0337', 37);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (44, '5 Dwight Court', 'Abruzzi', 'Pescara', '63941-370', 37);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (45, '744 Esker Road', 'Abruzzi', 'Pescara', '57520-0303', 24);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (46, '17 Trailsway Street', 'Abruzzi', 'Pescara', '61787-557', 3);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (47, '08 Killdeer Center', 'Abruzzi', 'Pescara', '54569-3335', 49);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (48, '529 Wayridge Center', 'Abruzzi', 'Pescara', '46122-193', 16);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (49, '5158 Riverside Lane', 'Abruzzi', 'Pescara', '49967-050', 16);
insert into ShipAdrs (ShipAdrsID, Address1, Address2, City, PostCode, CountryID) values (50, '3923 East Way', 'Abruzzi', 'Pescara', '36987-3094', 6);



/* ------------------------------------------------------------------------------------------- */
/* Adding data to Customers table */
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (1, 'Addy', 'Cruickshank', '+55 (184) 414-4465', 'acruickshank0@google.nl', 25, 16);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (2, 'Daryle', 'Littlefair', '+57 (619) 528-5977', 'dlittlefair1@dailymotion.com', 19, 6);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (3, 'Daffi', 'Strowan', '+994 (732) 815-9552', 'dstrowan2@hugedomains.com', 2, 5);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (4, 'Kerry', 'Spohrmann', '+502 (288) 387-7298', 'kspohrmann3@nationalgeographic.com', 26, 28);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (5, 'Tobin', 'Le Noir', '+381 (983) 788-6951', 'tlenoir4@nature.com', 47, 39);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (6, 'Carlin', 'Clemmow', '+56 (447) 664-1144', 'cclemmow5@yahoo.com', 1, 16);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (7, 'Harli', 'Shakespeare', '+86 (381) 724-7143', 'hshakespeare6@discuz.net', 20, 4);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (8, 'Felike', 'Boulsher', '+81 (272) 266-9073', 'fboulsher7@xrea.com', 10, 6);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (9, 'Charisse', 'McLae', '+48 (195) 494-8622', 'cmclae8@illinois.edu', 34, 42);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (10, 'Corie', 'Karlsson', '+375 (746) 645-9822', 'ckarlsson9@etsy.com', 47, 11);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (11, 'Goober', 'Scanlin', '+20 (427) 901-2640', 'gscanlina@usda.gov', 7, 26);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (12, 'Ignazio', 'Froment', '+972 (826) 910-4006', 'ifromentb@weibo.com', 46, 9);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (13, 'Gun', 'Andreutti', '+1 (573) 371-4356', 'gandreuttic@alibaba.com', 40, 40);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (14, 'Harmon', 'Banat', '+52 (626) 843-9357', 'hbanatd@nsw.gov.au', 47, 37);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (15, 'Jerrold', 'Apedaile', '+993 (480) 348-9274', 'japedailee@dot.gov', 29, 33);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (16, 'Hartley', 'Kinahan', '+55 (258) 432-7167', 'hkinahanf@phpbb.com', 40, 32);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (17, 'Cyndy', 'Davidsen', '+64 (376) 541-8614', 'cdavidseng@booking.com', 15, 49);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (18, 'Ellsworth', 'Sissens', '+1 (332) 802-3244', 'esissensh@furl.net', 37, 49);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (19, 'Elwood', 'Bailes', '+880 (136) 500-0317', 'ebailesi@fema.gov', 14, 34);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (20, 'Rheba', 'Ugoletti', '+86 (436) 145-9466', 'rugolettij@whitehouse.gov', 41, 2);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (21, 'Dukie', 'Britian', '+970 (371) 522-2059', 'dbritiank@columbia.edu', 34, 40);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (22, 'Jackqueline', 'D''Alesco', '+7 (610) 310-2573', 'jdalescol@dailymotion.com', 20, 35);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (23, 'Marj', 'Norcross', '+95 (833) 336-7004', 'mnorcrossm@amazon.de', 24, 48);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (24, 'Fancy', 'Morilla', '+86 (375) 383-1414', 'fmorillan@independent.co.uk', 43, 37);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (25, 'Shoshana', 'De Roeck', '+856 (135) 220-1871', 'sderoecko@freewebs.com', 46, 11);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (26, 'Clarisse', 'Fallis', '+962 (814) 719-3446', 'cfallisp@soundcloud.com', 49, 33);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (27, 'Corissa', 'Pettengell', '+44 (317) 721-3475', 'cpettengellq@engadget.com', 8, 23);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (28, 'Jonathan', 'Rolls', '+55 (765) 593-6269', 'jrollsr@usatoday.com', 19, 29);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (29, 'Camella', 'Killingbeck', '+225 (216) 713-9422', 'ckillingbecks@biblegateway.com', 46, 31);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (30, 'Jackelyn', 'Kitt', '+351 (965) 532-9578', 'jkittt@booking.com', 23, 31);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (31, 'Carlin', 'Eaklee', '+86 (793) 907-5624', 'ceakleeu@adobe.com', 1, 3);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (32, 'Foss', 'Daburn', '+33 (531) 728-3311', 'fdaburnv@t.co', 1, 27);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (33, 'Kasey', 'Logue', '+86 (634) 464-3597', 'kloguew@rambler.ru', 49, 20);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (34, 'Gayle', 'Landreth', '+86 (724) 495-9814', 'glandrethx@bravesites.com', 49, 2);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (35, 'Montgomery', 'Ivanchov', '+86 (637) 310-2370', 'mivanchovy@scientificamerican.com', 39, 50);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (36, 'Suki', 'Malmar', '+62 (692) 951-2590', 'smalmarz@answers.com', 17, 21);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (37, 'Ber', 'Armytage', '+1 (255) 881-7003', 'barmytage10@opensource.org', 48, 39);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (38, 'Lyda', 'Mikalski', '+373 (414) 656-9955', 'lmikalski11@arstechnica.com', 19, 24);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (39, 'Burk', 'Hamill', '+86 (919) 573-7494', 'bhamill12@miibeian.gov.cn', 21, 43);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (40, 'Rebekkah', 'Burtonwood', '+93 (678) 268-2738', 'rburtonwood13@jugem.jp', 9, 46);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (41, 'Genevieve', 'Scarce', '+507 (707) 380-6668', 'gscarce14@printfriendly.com', 5, 32);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (42, 'Ambrosio', 'Beeby', '+46 (556) 168-4102', 'abeeby15@rediff.com', 33, 34);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (43, 'Kylie', 'Reef', '+62 (381) 341-1947', 'kreef16@reference.com', 34, 14);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (44, 'Jeniffer', 'Yarr', '+56 (612) 520-7863', 'jyarr17@godaddy.com', 32, 9);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (45, 'Ronny', 'Cranna', '+420 (738) 649-2461', 'rcranna18@mit.edu', 31, 5);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (46, 'Fernanda', 'Lohmeyer', '+57 (226) 295-1636', 'flohmeyer19@techcrunch.com', 28, 18);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (47, 'Stanislaw', 'Bernollet', '+62 (106) 600-4353', 'sbernollet1a@independent.co.uk', 43, 39);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (48, 'Elfrida', 'Yitshak', '+55 (683) 795-9563', 'eyitshak1b@myspace.com', 49, 8);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (49, 'Allayne', 'Critcher', '+86 (445) 869-1035', 'acritcher1c@myspace.com', 26, 34);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (50, 'Averell', 'Mourant', '+351 (442) 896-6157', 'amourant1d@ft.com', 19, 11);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (51, 'Pris', 'Varfalameev', '+86 (222) 860-8186', 'pvarfalameev1e@netscape.com', 7, 8);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (52, 'Rea', 'Bonin', '+62 (218) 354-1671', 'rbonin1f@free.fr', 28, 13);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (53, 'Camila', 'Reinger', '+971 (968) 256-7488', 'creinger1g@theglobeandmail.com', 2, 22);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (54, 'Robinette', 'Golton', '+51 (104) 682-7787', 'rgolton1h@icq.com', 28, 9);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (55, 'Licha', 'Jewitt', '+51 (272) 234-2841', 'ljewitt1i@state.gov', 15, 31);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (56, 'Judas', 'Peasee', '+7 (953) 384-1596', 'jpeasee1j@pcworld.com', 46, 27);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (57, 'Gerri', 'Bointon', '+54 (403) 245-3156', 'gbointon1k@latimes.com', 24, 21);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (58, 'Jed', 'Slite', '+968 (539) 663-3686', 'jslite1l@comsenz.com', 22, 36);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (59, 'Cornie', 'Neary', '+7 (504) 610-0709', 'cneary1m@furl.net', 22, 12);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (60, 'Verney', 'Oxby', '+7 (809) 407-8599', 'voxby1n@dot.gov', 12, 25);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (61, 'Trisha', 'Stormonth', '+1 (713) 843-1897', 'tstormonth1o@hatena.ne.jp', 5, 38);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (62, 'Neda', 'Davidzon', '+86 (885) 417-8648', 'ndavidzon1p@forbes.com', 6, 8);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (63, 'Cicily', 'Puddefoot', '+62 (428) 943-8115', 'cpuddefoot1q@oakley.com', 40, 33);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (64, 'Hoyt', 'McKague', '+63 (795) 181-6193', 'hmckague1r@thetimes.co.uk', 19, 13);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (65, 'Gaston', 'Lowerson', '+81 (607) 999-8539', 'glowerson1s@yahoo.co.jp', 1, 35);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (66, 'Pincus', 'MacKeeg', '+7 (586) 574-5874', 'pmackeeg1t@booking.com', 7, 31);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (67, 'Josi', 'Wyett', '+381 (394) 887-0565', 'jwyett1u@cocolog-nifty.com', 27, 9);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (68, 'Lelia', 'Arthars', '+63 (731) 510-5321', 'larthars1v@nyu.edu', 43, 5);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (69, 'Dexter', 'Le Quesne', '+57 (670) 839-9167', 'dlequesne1w@webmd.com', 37, 46);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (70, 'Kirk', 'Rathborne', '+53 (474) 880-8535', 'krathborne1x@washingtonpost.com', 14, 3);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (71, 'Preston', 'Jenyns', '+880 (405) 411-5877', 'pjenyns1y@icio.us', 3, 46);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (72, 'Francis', 'Defau', '+86 (409) 333-6592', 'fdefau1z@shareasale.com', 46, 49);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (73, 'Olenolin', 'Durbin', '+52 (918) 313-7614', 'odurbin20@abc.net.au', 45, 11);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (74, 'Sawyere', 'Brogioni', '+1 (954) 542-7273', 'sbrogioni21@tripod.com', 34, 43);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (75, 'Bonny', 'Griggs', '+1 (520) 494-7699', 'bgriggs22@unicef.org', 29, 16);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (76, 'Torey', 'MacNelly', '+223 (114) 678-5494', 'tmacnelly23@apache.org', 40, 43);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (77, 'Felizio', 'Hamlen', '+358 (656) 145-9821', 'fhamlen24@friendfeed.com', 26, 23);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (78, 'Andrea', 'Roper', '+62 (255) 934-2062', 'aroper25@jimdo.com', 37, 36);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (79, 'Troy', 'Farquarson', '+1 (518) 257-0689', 'tfarquarson26@bloglines.com', 34, 18);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (80, 'Wilburt', 'Zima', '+86 (631) 566-0449', 'wzima27@hc360.com', 46, 32);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (81, 'Philbert', 'Perotti', '+86 (470) 373-0430', 'pperotti28@globo.com', 3, 20);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (82, 'Thaddus', 'Averall', '+86 (245) 854-5579', 'taverall29@nasa.gov', 2, 50);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (83, 'Matthieu', 'Cootes', '+886 (554) 360-2187', 'mcootes2a@usnews.com', 23, 12);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (84, 'Patty', 'Baggelley', '+62 (582) 983-2566', 'pbaggelley2b@irs.gov', 12, 5);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (85, 'Kirsti', 'Spat', '+46 (903) 464-9936', 'kspat2c@google.com.hk', 46, 34);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (86, 'Jaquelyn', 'Wareham', '+7 (692) 903-6924', 'jwareham2d@blog.com', 29, 7);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (87, 'Maudie', 'Ball', '+86 (963) 243-0631', 'mball2e@t.co', 34, 7);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (88, 'Charil', 'Sandbach', '+86 (741) 201-3264', 'csandbach2f@engadget.com', 24, 34);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (89, 'Florinda', 'Cisson', '+62 (417) 100-6930', 'fcisson2g@nsw.gov.au', 16, 39);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (90, 'Ddene', 'Kinloch', '+967 (174) 560-0947', 'dkinloch2h@desdev.cn', 14, 7);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (91, 'Alex', 'Simyson', '+972 (871) 719-2498', 'asimyson2i@jugem.jp', 43, 5);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (92, 'Ira', 'Jacobsen', '+7 (267) 815-9053', 'ijacobsen2j@desdev.cn', 35, 46);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (93, 'Jeramie', 'Bartak', '+48 (782) 955-4484', 'jbartak2k@livejournal.com', 5, 15);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (94, 'Lida', 'Lothlorien', '+994 (550) 570-2585', 'llothlorien2l@csmonitor.com', 7, 11);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (95, 'Stafani', 'Wickardt', '+86 (462) 166-0509', 'swickardt2m@goo.ne.jp', 36, 23);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (96, 'Jess', 'Mulhill', '+1 (501) 361-9434', 'jmulhill2n@who.int', 37, 17);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (97, 'Orrin', 'Keneforde', '+420 (364) 302-3820', 'okeneforde2o@vistaprint.com', 45, 14);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (98, 'Horst', 'Velte', '+351 (782) 546-8152', 'hvelte2p@deviantart.com', 33, 32);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (99, 'Lorri', 'Sharvill', '+420 (569) 553-9317', 'lsharvill2q@nifty.com', 48, 12);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (100, 'Margarette', 'Macon', '+30 (250) 180-8867', 'mmacon2r@exblog.jp', 47, 15);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (101, 'Elwin', 'Rampley', '+63 (599) 119-0689', 'erampley2s@opera.com', 23, 50);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (102, 'Alfred', 'Dansey', '+55 (848) 212-1843', 'adansey2t@buzzfeed.com', 43, 18);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (103, 'Terrill', 'Westcott', '+86 (479) 963-8984', 'twestcott2u@nifty.com', 11, 39);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (104, 'Katalin', 'Capps', '+86 (391) 555-5786', 'kcapps2v@ucoz.com', 10, 16);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (105, 'Uriah', 'Tenniswood', '+86 (764) 521-4394', 'utenniswood2w@twitpic.com', 24, 13);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (106, 'Farlee', 'Alelsandrovich', '+41 (403) 335-0157', 'falelsandrovich2x@photobucket.com', 41, 49);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (107, 'Edin', 'Kringe', '+63 (879) 597-1069', 'ekringe2y@theguardian.com', 23, 14);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (108, 'Cheri', 'Machans', '+93 (877) 860-5537', 'cmachans2z@indiatimes.com', 15, 32);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (109, 'Sonya', 'Ianiello', '+998 (983) 639-4629', 'sianiello30@berkeley.edu', 27, 2);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (110, 'Jacquie', 'Fulle', '+963 (155) 586-3032', 'jfulle31@barnesandnoble.com', 45, 10);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (111, 'Eugene', 'Roycroft', '+46 (990) 290-1804', 'eroycroft32@booking.com', 25, 14);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (112, 'Minni', 'McGhie', '+86 (656) 432-6485', 'mmcghie33@blinklist.com', 37, 22);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (113, 'Alvina', 'Aplin', '+62 (492) 575-1426', 'aaplin34@rambler.ru', 47, 50);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (114, 'Harlene', 'Covelle', '+63 (655) 244-3160', 'hcovelle35@weather.com', 12, 4);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (115, 'Samaria', 'Romain', '+380 (509) 718-1412', 'sromain36@icio.us', 16, 25);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (116, 'Berty', 'Reeder', '+62 (568) 922-0592', 'breeder37@sohu.com', 1, 15);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (117, 'Nadya', 'Breckin', '+81 (492) 209-8139', 'nbreckin38@slideshare.net', 3, 37);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (118, 'Phylis', 'Keynd', '+54 (172) 391-6985', 'pkeynd39@prlog.org', 48, 47);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (119, 'Chloette', 'Dudden', '+351 (363) 888-1596', 'cdudden3a@alibaba.com', 47, 34);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (120, 'Karina', 'Nasi', '+352 (696) 218-1479', 'knasi3b@last.fm', 44, 20);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (121, 'Verla', 'Abramovici', '+48 (821) 715-9129', 'vabramovici3c@blog.com', 44, 11);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (122, 'Roosevelt', 'Ebenezer', '+46 (736) 578-9520', 'rebenezer3d@thetimes.co.uk', 29, 15);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (123, 'Misty', 'Antoshin', '+212 (671) 612-4752', 'mantoshin3e@wiley.com', 44, 31);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (124, 'Ignatius', 'Kennealy', '+1 (614) 657-0572', 'ikennealy3f@clickbank.net', 22, 20);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (125, 'Elwood', 'Reinert', '+389 (474) 916-5179', 'ereinert3g@mapy.cz', 6, 5);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (126, 'Carmel', 'Dolling', '+383 (636) 501-8742', 'cdolling3h@blogger.com', 25, 17);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (127, 'Bryant', 'Johl', '+86 (145) 314-2169', 'bjohl3i@apache.org', 16, 4);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (128, 'Natasha', 'Caustic', '+86 (826) 853-9133', 'ncaustic3j@usgs.gov', 2, 25);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (129, 'Merline', 'Yakubovics', '+63 (941) 827-7561', 'myakubovics3k@instagram.com', 38, 32);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (130, 'Clarabelle', 'Duding', '+86 (310) 395-0236', 'cduding3l@nydailynews.com', 11, 29);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (131, 'Kali', 'Vanne', '+57 (836) 413-2862', 'kvanne3m@washington.edu', 17, 16);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (132, 'Berri', 'Corday', '+502 (473) 851-5768', 'bcorday3n@engadget.com', 18, 50);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (133, 'Ania', 'Boyat', '+593 (345) 323-1103', 'aboyat3o@eventbrite.com', 21, 36);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (134, 'Leicester', 'Fairest', '+62 (333) 667-1358', 'lfairest3p@slate.com', 39, 6);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (135, 'Phillipp', 'Trouel', '+86 (337) 364-4776', 'ptrouel3q@sohu.com', 47, 36);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (136, 'Red', 'Kellen', '+86 (519) 609-5101', 'rkellen3r@homestead.com', 31, 34);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (137, 'Nolan', 'Yerson', '+86 (750) 387-7570', 'nyerson3s@trellian.com', 44, 17);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (138, 'Sean', 'O''Neary', '+86 (356) 458-3580', 'soneary3t@census.gov', 37, 4);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (139, 'Peder', 'Stilling', '+381 (860) 337-5317', 'pstilling3u@reuters.com', 27, 30);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (140, 'Lacie', 'Janisson', '+62 (826) 758-5574', 'ljanisson3v@youku.com', 21, 12);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (141, 'Jenn', 'Consadine', '+353 (133) 447-0224', 'jconsadine3w@amazon.co.uk', 45, 11);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (142, 'Miquela', 'Djorevic', '+62 (956) 370-6778', 'mdjorevic3x@businesswire.com', 32, 30);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (143, 'Ignacio', 'Chichgar', '+86 (319) 666-1782', 'ichichgar3y@youtube.com', 44, 14);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (144, 'Penrod', 'Bridgwood', '+856 (106) 764-0312', 'pbridgwood3z@sitemeter.com', 26, 2);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (145, 'Myron', 'Bembrigg', '+375 (524) 757-3572', 'mbembrigg40@spotify.com', 44, 43);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (146, 'Thain', 'Layhe', '+7 (287) 658-8706', 'tlayhe41@nifty.com', 50, 2);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (147, 'Petronia', 'Zannelli', '+7 (418) 630-1048', 'pzannelli42@cbc.ca', 28, 1);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (148, 'Allayne', 'Olenchenko', '+7 (678) 292-3759', 'aolenchenko43@w3.org', 46, 32);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (149, 'Johny', 'Winckle', '+509 (645) 986-6194', 'jwinckle44@theguardian.com', 26, 45);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (150, 'Konstantine', 'Dukesbury', '+63 (653) 746-5288', 'kdukesbury45@zdnet.com', 21, 21);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (151, 'Lavinie', 'Osmon', '+385 (663) 484-5372', 'losmon46@free.fr', 44, 48);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (152, 'Garfield', 'Rumsby', '+49 (832) 660-9303', 'grumsby47@hp.com', 17, 48);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (153, 'Evin', 'Haskur', '+7 (810) 666-9354', 'ehaskur48@list-manage.com', 2, 22);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (154, 'Renaldo', 'Aspinall', '+55 (754) 971-3595', 'raspinall49@bandcamp.com', 18, 7);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (155, 'Leola', 'Rudolf', '+509 (110) 367-7551', 'lrudolf4a@etsy.com', 1, 39);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (156, 'Pooh', 'Crennan', '+385 (211) 977-1832', 'pcrennan4b@theatlantic.com', 27, 48);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (157, 'Agnese', 'Mogford', '+52 (170) 521-6194', 'amogford4c@walmart.com', 24, 1);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (158, 'Silvester', 'Beldon', '+51 (995) 767-1270', 'sbeldon4d@altervista.org', 33, 13);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (159, 'Meyer', 'Gittens', '+7 (520) 683-1656', 'mgittens4e@apache.org', 25, 25);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (160, 'Chery', 'Francom', '+964 (944) 741-9410', 'cfrancom4f@nifty.com', 40, 26);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (161, 'Cathyleen', 'Dawes', '+7 (560) 963-5941', 'cdawes4g@chronoengine.com', 28, 17);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (162, 'Keelia', 'Hannah', '+1 (891) 853-2361', 'khannah4h@artisteer.com', 23, 14);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (163, 'Dalis', 'Sivess', '+55 (787) 742-6492', 'dsivess4i@redcross.org', 48, 7);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (164, 'Shana', 'Batthew', '+86 (587) 742-9633', 'sbatthew4j@google.pl', 10, 21);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (165, 'Katrine', 'Fownes', '+7 (153) 246-3766', 'kfownes4k@engadget.com', 20, 39);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (166, 'Alick', 'Hatto', '+84 (583) 291-5152', 'ahatto4l@themeforest.net', 38, 7);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (167, 'Claudie', 'Gergely', '+86 (901) 692-8920', 'cgergely4m@google.it', 3, 49);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (168, 'Jorgan', 'Oddey', '+7 (525) 188-6422', 'joddey4n@ifeng.com', 19, 28);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (169, 'Bendite', 'Tromans', '+48 (783) 264-8889', 'btromans4o@edublogs.org', 33, 13);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (170, 'Irwin', 'Banaszewski', '+86 (420) 650-1714', 'ibanaszewski4p@tinyurl.com', 32, 47);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (171, 'Giustino', 'Ferguson', '+86 (131) 541-7133', 'gferguson4q@dailymail.co.uk', 49, 34);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (172, 'Jenine', 'Dyball', '+60 (847) 985-6432', 'jdyball4r@163.com', 45, 25);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (173, 'Caesar', 'Herries', '+351 (523) 629-0847', 'cherries4s@netvibes.com', 8, 19);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (174, 'Adah', 'Arpin', '+86 (662) 821-9746', 'aarpin4t@admin.ch', 17, 27);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (175, 'Kerrie', 'Roubay', '+1 (913) 835-4559', 'kroubay4u@psu.edu', 17, 33);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (176, 'Ferrell', 'Nisby', '+86 (655) 914-8070', 'fnisby4v@wix.com', 48, 50);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (177, 'Fabiano', 'Browett', '+86 (720) 842-5663', 'fbrowett4w@businessweek.com', 14, 42);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (178, 'Barnard', 'Jimenez', '+82 (160) 355-0010', 'bjimenez4x@ca.gov', 50, 41);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (179, 'Monti', 'Bamlett', '+86 (101) 178-0544', 'mbamlett4y@slate.com', 18, 45);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (180, 'Wilburt', 'Matteini', '+351 (107) 870-2642', 'wmatteini4z@cdbaby.com', 23, 9);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (181, 'Salomi', 'Hackinge', '+62 (881) 790-9208', 'shackinge50@buzzfeed.com', 50, 30);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (182, 'Jory', 'Roycroft', '+420 (103) 911-3534', 'jroycroft51@ustream.tv', 15, 33);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (183, 'Nelia', 'Mayes', '+351 (634) 689-0260', 'nmayes52@huffingtonpost.com', 24, 29);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (184, 'Marchall', 'Tallboy', '+84 (556) 558-8376', 'mtallboy53@example.com', 37, 30);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (185, 'Randy', 'Coverlyn', '+62 (592) 731-6449', 'rcoverlyn54@accuweather.com', 31, 2);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (186, 'Amandi', 'Groombridge', '+63 (570) 331-3699', 'agroombridge55@mapy.cz', 46, 34);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (187, 'Brok', 'Tyler', '+380 (635) 857-8119', 'btyler56@about.me', 36, 13);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (188, 'Rudie', 'Getcliffe', '+45 (418) 245-5765', 'rgetcliffe57@microsoft.com', 21, 4);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (189, 'Raina', 'Stephens', '+216 (998) 212-3148', 'rstephens58@usda.gov', 41, 41);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (190, 'Abe', 'Gashion', '+86 (770) 223-9548', 'agashion59@biblegateway.com', 45, 29);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (191, 'Bjorn', 'Buckerfield', '+86 (379) 486-9352', 'bbuckerfield5a@mozilla.org', 18, 50);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (192, 'Manon', 'Gylle', '+380 (181) 392-0920', 'mgylle5b@fema.gov', 16, 40);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (193, 'Zebulen', 'Billington', '+54 (674) 420-0630', 'zbillington5c@clickbank.net', 25, 20);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (194, 'Terrijo', 'Kosiada', '+86 (985) 594-5940', 'tkosiada5d@skyrock.com', 31, 26);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (195, 'Boony', 'Thombleson', '+7 (954) 370-1998', 'bthombleson5e@google.nl', 37, 15);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (196, 'Dari', 'Trenfield', '+30 (392) 323-6725', 'dtrenfield5f@is.gd', 40, 6);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (197, 'Kimberlyn', 'Beer', '+48 (192) 775-9434', 'kbeer5g@icio.us', 15, 27);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (198, 'Estevan', 'Rivilis', '+63 (741) 175-3440', 'erivilis5h@spiegel.de', 18, 16);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (199, 'Arlana', 'Gadeaux', '+86 (349) 675-7662', 'agadeaux5i@sogou.com', 15, 42);
insert into Customers (CustomerID, FName, Surname, PhoneNo, eMail, BillAdrsID, ShipAdrsID) values (200, 'Eimile', 'Guinan', '+502 (397) 647-2971', 'eguinan5j@cnn.com', 27, 38);

/* ------------------------------------------------------------------------------------------- */
/* Adding data BrandNames for Stock table */
insert into BrandNames (BrandNameID, BrandName) values (1, 'Chanel');
insert into BrandNames (BrandNameID, BrandName) values (2, 'Hermes');
insert into BrandNames (BrandNameID, BrandName) values (3, 'Dior');
insert into BrandNames (BrandNameID, BrandName) values (4, 'Celine');
insert into BrandNames (BrandNameID, BrandName) values (5, 'Gucci');
insert into BrandNames (BrandNameID, BrandName) values (6, 'Louis Vuitton');

/* ------------------------------------------------------------------------------------------- */
/* Adding data ModelNames for Stock table */
insert into ModelNames (ModelNameID, ModelName) values (1, 'Speedy');
insert into ModelNames (ModelNameID, ModelName) values (2, 'Tote');
insert into ModelNames (ModelNameID, ModelName) values (3, 'Nil');
insert into ModelNames (ModelNameID, ModelName) values (4, 'Keepall');
insert into ModelNames (ModelNameID, ModelName) values (5, 'Pouch');
insert into ModelNames (ModelNameID, ModelName) values (6, 'Elise');
insert into ModelNames (ModelNameID, ModelName) values (7, 'Neverfull');
insert into ModelNames (ModelNameID, ModelName) values (8, 'Note');
insert into ModelNames (ModelNameID, ModelName) values (9, 'Saumur');
insert into ModelNames (ModelNameID, ModelName) values (10, 'Birkin');
insert into ModelNames (ModelNameID, ModelName) values (11, 'Timeless');

/* ------------------------------------------------------------------------------------------- */
/* Adding data colours for Stock table */
insert into Colours (ColourID, Colour) values (1, 'Purple');
insert into Colours (ColourID, Colour) values (2, 'Aquamarine');
insert into Colours (ColourID, Colour) values (3, 'Fuscia');
insert into Colours (ColourID, Colour) values (4, 'Turquoise');
insert into Colours (ColourID, Colour) values (5, 'Maroon');
insert into Colours (ColourID, Colour) values (6, 'Indigo');
insert into Colours (ColourID, Colour) values (7, 'Turquoise');
insert into Colours (ColourID, Colour) values (8, 'Aquamarine');
insert into Colours (ColourID, Colour) values (9, 'Goldenrod');

/* ------------------------------------------------------------------------------------------- */
/* Adding data locations for Stock table */
insert into Locations (LocationID, LocationN) values (1, 'Dublin S1');
insert into Locations (LocationID, LocationN) values (2, 'Dublin S2');
insert into Locations (LocationID, LocationN) values (3, 'Cork Store');
insert into Locations (LocationID, LocationN) values (4, 'Warehouse');

/* ------------------------------------------------------------------------------------------- */
/* Adding data for Stock table */
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (1, 2, 8, 1, 41, 1943.1, 1, 20, 28);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (2, 6, 1, 1, 44, 2573.44, 2, 35, 27);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (3, 1, 9, 6, 44, 2876.43, 4, 36, 15);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (4, 3, 6, 1, 11, 6865.71, 1, 35, 1);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (5, 2, 9, 2, 16, 1753.27, 2, 15, 2);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (6, 6, 5, 8, 27, 2299.13, 4, 31, 1);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (7, 3, 2, 7, 28, 5918.5, 1, 14, 2);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (8, 5, 8, 8, 14, 2306.57, 4, 8, 28);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (9, 4, 5, 9, 31, 5338.12, 4, 20, 27);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (10, 4, 7, 8, 50, 4229.29, 1, 22, 4);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (11, 2, 9, 9, 14, 3730.7, 1, 18, 1);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (12, 4, 3, 6, 32, 4318.82, 4, 14, 11);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (13, 3, 8, 2, 50, 2553.25, 4, 26, 26);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (14, 2, 10, 3, 13, 1567.2, 2, 7, 3);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (15, 4, 11, 8, 48, 6919.54, 4, 33, 25);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (16, 1, 5, 3, 36, 1316.98, 2, 17, 20);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (17, 2, 6, 6, 15, 6373.21, 1, 2, 8);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (18, 5, 5, 5, 32, 747.75, 1, 16, 17);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (19, 6, 2, 5, 43, 6998.07, 1, 28, 14);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (20, 1, 3, 6, 17, 3353.93, 1, 39, 6);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (21, 4, 9, 7, 21, 328.79, 4, 5, 23);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (22, 2, 1, 2, 20, 6120.81, 4, 28, 23);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (23, 1, 11, 6, 20, 3483.85, 1, 9, 12);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (24, 3, 11, 8, 36, 6142.8, 1, 6, 29);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (25, 4, 1, 7, 42, 5635.77, 2, 30, 13);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (26, 2, 11, 4, 20, 1053.71, 3, 19, 2);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (27, 6, 2, 1, 28, 1561.34, 3, 5, 17);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (28, 3, 5, 2, 49, 3549.2, 3, 26, 1);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (29, 3, 1, 9, 35, 4695.77, 4, 38, 18);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (30, 1, 3, 3, 32, 936.66, 1, 34, 8);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (31, 3, 11, 4, 44, 1016.31, 4, 23, 19);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (32, 2, 8, 4, 19, 6060.85, 4, 26, 4);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (33, 3, 11, 8, 36, 5748.81, 4, 39, 1);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (34, 3, 2, 5, 38, 596.51, 1, 37, 26);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (35, 1, 3, 4, 12, 2897.73, 1, 31, 30);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (36, 3, 5, 4, 28, 2374.75, 1, 39, 3);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (37, 6, 3, 6, 41, 6756.3, 1, 3, 26);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (38, 6, 1, 5, 12, 6945.18, 1, 20, 12);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (39, 4, 6, 1, 14, 4796.42, 1, 4, 5);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (40, 6, 8, 1, 25, 2444.96, 2, 9, 5);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (41, 1, 11, 7, 29, 1972.03, 4, 28, 12);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (42, 3, 9, 9, 20, 1660.24, 4, 5, 16);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (43, 4, 7, 9, 40, 4720.85, 3, 37, 3);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (44, 1, 4, 8, 48, 2225.84, 3, 8, 11);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (45, 3, 1, 7, 28, 4419.03, 4, 39, 24);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (46, 1, 7, 1, 38, 4385.0, 1, 13, 11);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (47, 4, 3, 4, 48, 6332.0, 1, 15, 27);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (48, 4, 2, 9, 34, 5651.09, 1, 23, 30);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (49, 1, 4, 3, 10, 1765.67, 1, 39, 20);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (50, 3, 10, 6, 10, 6024.79, 3, 12, 7);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (51, 1, 3, 1, 24, 4612.84, 4, 35, 3);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (52, 6, 7, 4, 49, 2400.87, 2, 11, 3);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (53, 1, 10, 9, 18, 2441.12, 4, 2, 1);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (54, 6, 3, 6, 32, 1999.42, 1, 36, 27);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (55, 1, 3, 3, 17, 1726.15, 2, 7, 23);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (56, 5, 8, 7, 19, 3288.07, 4, 30, 21);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (57, 5, 11, 1, 40, 3378.13, 4, 19, 15);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (58, 3, 6, 7, 14, 2012.94, 4, 36, 30);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (59, 4, 2, 9, 27, 565.79, 4, 4, 12);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (60, 1, 4, 5, 30, 4095.04, 1, 27, 29);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (61, 6, 5, 8, 41, 4637.98, 2, 15, 4);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (62, 6, 7, 2, 38, 777.69, 2, 15, 29);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (63, 4, 11, 3, 32, 2271.2, 2, 21, 14);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (64, 5, 1, 5, 48, 5823.03, 2, 16, 12);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (65, 1, 4, 5, 38, 2875.91, 3, 27, 19);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (66, 3, 4, 1, 45, 495.53, 1, 10, 16);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (67, 2, 5, 4, 42, 6972.53, 3, 12, 8);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (68, 6, 3, 6, 28, 4508.76, 2, 13, 23);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (69, 5, 11, 4, 28, 3022.8, 1, 28, 28);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (70, 4, 3, 5, 21, 4381.27, 2, 36, 26);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (71, 1, 9, 3, 22, 6762.52, 1, 31, 9);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (72, 2, 11, 1, 28, 3568.03, 3, 2, 7);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (73, 2, 6, 3, 24, 393.23, 1, 26, 27);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (74, 6, 11, 8, 14, 5317.53, 2, 34, 20);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (75, 4, 2, 8, 47, 3901.87, 4, 11, 6);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (76, 6, 6, 6, 40, 1205.47, 3, 27, 18);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (77, 2, 11, 3, 47, 423.74, 4, 4, 14);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (78, 2, 3, 2, 29, 5003.45, 4, 20, 7);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (79, 3, 11, 2, 33, 1250.52, 1, 10, 13);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (80, 5, 3, 4, 19, 2707.39, 4, 28, 19);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (81, 2, 7, 3, 49, 2280.23, 2, 18, 11);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (82, 4, 10, 6, 17, 1746.83, 3, 18, 22);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (83, 5, 11, 8, 29, 580.85, 4, 11, 7);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (84, 2, 4, 6, 29, 3500.6, 4, 25, 21);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (85, 6, 1, 1, 13, 2361.53, 4, 6, 16);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (86, 5, 10, 3, 18, 5127.12, 2, 9, 5);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (87, 6, 4, 1, 44, 3023.64, 1, 4, 26);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (88, 1, 8, 6, 24, 1593.46, 2, 28, 21);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (89, 3, 1, 9, 33, 2928.45, 3, 23, 27);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (90, 5, 6, 1, 16, 4461.02, 1, 24, 25);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (91, 3, 4, 3, 17, 3046.49, 3, 5, 11);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (92, 4, 7, 9, 16, 5069.9, 3, 15, 21);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (93, 4, 4, 1, 32, 3958.08, 3, 4, 12);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (94, 5, 11, 5, 20, 4415.59, 3, 13, 22);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (95, 3, 8, 5, 17, 5386.19, 4, 40, 12);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (96, 6, 1, 3, 35, 2722.98, 3, 38, 19);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (97, 5, 2, 7, 32, 3558.33, 2, 38, 8);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (98, 2, 11, 6, 50, 4549.37, 3, 32, 14);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (99, 6, 10, 2, 38, 5116.79, 4, 31, 6);
insert into Stock (ItemID, BrandNameID, ModelNameID, ColourID, Size, UnitPrice, LocationID, Quantity, SupplierID) values (100, 3, 9, 2, 19, 1164.54, 3, 3, 11);



/* ------------------------------------------------------------------------------------------- */
/* Q2.4. */
/* Adding 2021 sales data for Orders table */
/* ---------------------------------------------------------------------------------------------*/

/* Table data for OrderStatus*/
insert into OrderStatus (OrderStatusID, StatusName) values (1, 'Open');
insert into OrderStatus (OrderStatusID, StatusName) values (2, 'Processed');
insert into OrderStatus (OrderStatusID, StatusName) values (3, 'In Progress');

/* Table data for PayStatus*/
insert into PayStates (PayStatusID, StatusP) values (1, 'Pending');
insert into PayStates (PayStatusID, StatusP) values (2, 'Received');
insert into PayStates (PayStatusID, StatusP) values (3, 'Declined');

/* Table data for Payments*/
insert into Payments (PaymentID, PayStateID) values (1, 1);
insert into Payments (PaymentID, PayStateID) values (2, 3);
insert into Payments (PaymentID, PayStateID) values (3, 3);
insert into Payments (PaymentID, PayStateID) values (4, 3);
insert into Payments (PaymentID, PayStateID) values (5, 3);
insert into Payments (PaymentID, PayStateID) values (6, 1);
insert into Payments (PaymentID, PayStateID) values (7, 3);
insert into Payments (PaymentID, PayStateID) values (8, 2);
insert into Payments (PaymentID, PayStateID) values (9, 1);
insert into Payments (PaymentID, PayStateID) values (10, 1);
insert into Payments (PaymentID, PayStateID) values (11, 1);
insert into Payments (PaymentID, PayStateID) values (12, 3);
insert into Payments (PaymentID, PayStateID) values (13, 2);
insert into Payments (PaymentID, PayStateID) values (14, 1);
insert into Payments (PaymentID, PayStateID) values (15, 2);
insert into Payments (PaymentID, PayStateID) values (16, 3);
insert into Payments (PaymentID, PayStateID) values (17, 3);
insert into Payments (PaymentID, PayStateID) values (18, 1);
insert into Payments (PaymentID, PayStateID) values (19, 2);
insert into Payments (PaymentID, PayStateID) values (20, 3);
insert into Payments (PaymentID, PayStateID) values (21, 3);
insert into Payments (PaymentID, PayStateID) values (22, 2);
insert into Payments (PaymentID, PayStateID) values (23, 2);
insert into Payments (PaymentID, PayStateID) values (24, 2);
insert into Payments (PaymentID, PayStateID) values (25, 1);
insert into Payments (PaymentID, PayStateID) values (26, 3);
insert into Payments (PaymentID, PayStateID) values (27, 1);
insert into Payments (PaymentID, PayStateID) values (28, 1);
insert into Payments (PaymentID, PayStateID) values (29, 2);
insert into Payments (PaymentID, PayStateID) values (30, 3);
insert into Payments (PaymentID, PayStateID) values (31, 1);
insert into Payments (PaymentID, PayStateID) values (32, 2);
insert into Payments (PaymentID, PayStateID) values (33, 2);
insert into Payments (PaymentID, PayStateID) values (34, 3);
insert into Payments (PaymentID, PayStateID) values (35, 3);
insert into Payments (PaymentID, PayStateID) values (36, 2);
insert into Payments (PaymentID, PayStateID) values (37, 1);
insert into Payments (PaymentID, PayStateID) values (38, 2);
insert into Payments (PaymentID, PayStateID) values (39, 2);
insert into Payments (PaymentID, PayStateID) values (40, 3);
insert into Payments (PaymentID, PayStateID) values (41, 1);
insert into Payments (PaymentID, PayStateID) values (42, 1);
insert into Payments (PaymentID, PayStateID) values (43, 3);
insert into Payments (PaymentID, PayStateID) values (44, 1);
insert into Payments (PaymentID, PayStateID) values (45, 2);
insert into Payments (PaymentID, PayStateID) values (46, 2);
insert into Payments (PaymentID, PayStateID) values (47, 2);
insert into Payments (PaymentID, PayStateID) values (48, 3);
insert into Payments (PaymentID, PayStateID) values (49, 3);
insert into Payments (PaymentID, PayStateID) values (50, 1);
insert into Payments (PaymentID, PayStateID) values (51, 1);
insert into Payments (PaymentID, PayStateID) values (52, 1);
insert into Payments (PaymentID, PayStateID) values (53, 1);
insert into Payments (PaymentID, PayStateID) values (54, 2);
insert into Payments (PaymentID, PayStateID) values (55, 3);
insert into Payments (PaymentID, PayStateID) values (56, 3);
insert into Payments (PaymentID, PayStateID) values (57, 2);
insert into Payments (PaymentID, PayStateID) values (58, 3);
insert into Payments (PaymentID, PayStateID) values (59, 2);
insert into Payments (PaymentID, PayStateID) values (60, 1);
insert into Payments (PaymentID, PayStateID) values (61, 1);
insert into Payments (PaymentID, PayStateID) values (62, 1);
insert into Payments (PaymentID, PayStateID) values (63, 2);
insert into Payments (PaymentID, PayStateID) values (64, 2);
insert into Payments (PaymentID, PayStateID) values (65, 3);
insert into Payments (PaymentID, PayStateID) values (66, 3);
insert into Payments (PaymentID, PayStateID) values (67, 3);
insert into Payments (PaymentID, PayStateID) values (68, 2);
insert into Payments (PaymentID, PayStateID) values (69, 2);
insert into Payments (PaymentID, PayStateID) values (70, 3);
insert into Payments (PaymentID, PayStateID) values (71, 3);
insert into Payments (PaymentID, PayStateID) values (72, 1);
insert into Payments (PaymentID, PayStateID) values (73, 2);
insert into Payments (PaymentID, PayStateID) values (74, 1);
insert into Payments (PaymentID, PayStateID) values (75, 2);
insert into Payments (PaymentID, PayStateID) values (76, 2);
insert into Payments (PaymentID, PayStateID) values (77, 1);
insert into Payments (PaymentID, PayStateID) values (78, 3);
insert into Payments (PaymentID, PayStateID) values (79, 3);
insert into Payments (PaymentID, PayStateID) values (80, 1);
insert into Payments (PaymentID, PayStateID) values (81, 2);
insert into Payments (PaymentID, PayStateID) values (82, 3);
insert into Payments (PaymentID, PayStateID) values (83, 1);
insert into Payments (PaymentID, PayStateID) values (84, 3);
insert into Payments (PaymentID, PayStateID) values (85, 2);
insert into Payments (PaymentID, PayStateID) values (86, 1);
insert into Payments (PaymentID, PayStateID) values (87, 1);
insert into Payments (PaymentID, PayStateID) values (88, 3);
insert into Payments (PaymentID, PayStateID) values (89, 1);
insert into Payments (PaymentID, PayStateID) values (90, 1);
insert into Payments (PaymentID, PayStateID) values (91, 3);
insert into Payments (PaymentID, PayStateID) values (92, 3);
insert into Payments (PaymentID, PayStateID) values (93, 2);
insert into Payments (PaymentID, PayStateID) values (94, 2);
insert into Payments (PaymentID, PayStateID) values (95, 3);
insert into Payments (PaymentID, PayStateID) values (96, 3);
insert into Payments (PaymentID, PayStateID) values (97, 3);
insert into Payments (PaymentID, PayStateID) values (98, 2);
insert into Payments (PaymentID, PayStateID) values (99, 1);
insert into Payments (PaymentID, PayStateID) values (100, 3);
insert into Payments (PaymentID, PayStateID) values (101, 3);
insert into Payments (PaymentID, PayStateID) values (102, 1);
insert into Payments (PaymentID, PayStateID) values (103, 3);
insert into Payments (PaymentID, PayStateID) values (104, 1);
insert into Payments (PaymentID, PayStateID) values (105, 3);
insert into Payments (PaymentID, PayStateID) values (106, 3);
insert into Payments (PaymentID, PayStateID) values (107, 2);
insert into Payments (PaymentID, PayStateID) values (108, 2);
insert into Payments (PaymentID, PayStateID) values (109, 2);
insert into Payments (PaymentID, PayStateID) values (110, 2);
insert into Payments (PaymentID, PayStateID) values (111, 1);
insert into Payments (PaymentID, PayStateID) values (112, 1);
insert into Payments (PaymentID, PayStateID) values (113, 1);
insert into Payments (PaymentID, PayStateID) values (114, 1);
insert into Payments (PaymentID, PayStateID) values (115, 2);
insert into Payments (PaymentID, PayStateID) values (116, 1);
insert into Payments (PaymentID, PayStateID) values (117, 1);
insert into Payments (PaymentID, PayStateID) values (118, 1);
insert into Payments (PaymentID, PayStateID) values (119, 2);
insert into Payments (PaymentID, PayStateID) values (120, 1);
insert into Payments (PaymentID, PayStateID) values (121, 2);
insert into Payments (PaymentID, PayStateID) values (122, 1);
insert into Payments (PaymentID, PayStateID) values (123, 3);
insert into Payments (PaymentID, PayStateID) values (124, 3);
insert into Payments (PaymentID, PayStateID) values (125, 1);
insert into Payments (PaymentID, PayStateID) values (126, 3);
insert into Payments (PaymentID, PayStateID) values (127, 3);
insert into Payments (PaymentID, PayStateID) values (128, 1);
insert into Payments (PaymentID, PayStateID) values (129, 2);
insert into Payments (PaymentID, PayStateID) values (130, 1);
insert into Payments (PaymentID, PayStateID) values (131, 1);
insert into Payments (PaymentID, PayStateID) values (132, 2);
insert into Payments (PaymentID, PayStateID) values (133, 1);
insert into Payments (PaymentID, PayStateID) values (134, 3);
insert into Payments (PaymentID, PayStateID) values (135, 3);
insert into Payments (PaymentID, PayStateID) values (136, 1);
insert into Payments (PaymentID, PayStateID) values (137, 2);
insert into Payments (PaymentID, PayStateID) values (138, 3);
insert into Payments (PaymentID, PayStateID) values (139, 1);
insert into Payments (PaymentID, PayStateID) values (140, 3);
insert into Payments (PaymentID, PayStateID) values (141, 2);
insert into Payments (PaymentID, PayStateID) values (142, 1);
insert into Payments (PaymentID, PayStateID) values (143, 1);
insert into Payments (PaymentID, PayStateID) values (144, 1);
insert into Payments (PaymentID, PayStateID) values (145, 2);
insert into Payments (PaymentID, PayStateID) values (146, 3);
insert into Payments (PaymentID, PayStateID) values (147, 1);
insert into Payments (PaymentID, PayStateID) values (148, 2);
insert into Payments (PaymentID, PayStateID) values (149, 1);
insert into Payments (PaymentID, PayStateID) values (150, 2);
insert into Payments (PaymentID, PayStateID) values (151, 2);
insert into Payments (PaymentID, PayStateID) values (152, 1);
insert into Payments (PaymentID, PayStateID) values (153, 3);
insert into Payments (PaymentID, PayStateID) values (154, 3);
insert into Payments (PaymentID, PayStateID) values (155, 1);
insert into Payments (PaymentID, PayStateID) values (156, 1);
insert into Payments (PaymentID, PayStateID) values (157, 1);
insert into Payments (PaymentID, PayStateID) values (158, 3);
insert into Payments (PaymentID, PayStateID) values (159, 2);
insert into Payments (PaymentID, PayStateID) values (160, 2);
insert into Payments (PaymentID, PayStateID) values (161, 2);
insert into Payments (PaymentID, PayStateID) values (162, 3);
insert into Payments (PaymentID, PayStateID) values (163, 3);
insert into Payments (PaymentID, PayStateID) values (164, 2);
insert into Payments (PaymentID, PayStateID) values (165, 1);
insert into Payments (PaymentID, PayStateID) values (166, 1);
insert into Payments (PaymentID, PayStateID) values (167, 2);
insert into Payments (PaymentID, PayStateID) values (168, 2);
insert into Payments (PaymentID, PayStateID) values (169, 3);
insert into Payments (PaymentID, PayStateID) values (170, 2);
insert into Payments (PaymentID, PayStateID) values (171, 2);
insert into Payments (PaymentID, PayStateID) values (172, 1);
insert into Payments (PaymentID, PayStateID) values (173, 1);
insert into Payments (PaymentID, PayStateID) values (174, 1);
insert into Payments (PaymentID, PayStateID) values (175, 2);
insert into Payments (PaymentID, PayStateID) values (176, 2);
insert into Payments (PaymentID, PayStateID) values (177, 1);
insert into Payments (PaymentID, PayStateID) values (178, 3);
insert into Payments (PaymentID, PayStateID) values (179, 1);
insert into Payments (PaymentID, PayStateID) values (180, 3);
insert into Payments (PaymentID, PayStateID) values (181, 2);
insert into Payments (PaymentID, PayStateID) values (182, 3);
insert into Payments (PaymentID, PayStateID) values (183, 1);
insert into Payments (PaymentID, PayStateID) values (184, 1);
insert into Payments (PaymentID, PayStateID) values (185, 3);
insert into Payments (PaymentID, PayStateID) values (186, 2);
insert into Payments (PaymentID, PayStateID) values (187, 2);
insert into Payments (PaymentID, PayStateID) values (188, 2);
insert into Payments (PaymentID, PayStateID) values (189, 3);
insert into Payments (PaymentID, PayStateID) values (190, 3);
insert into Payments (PaymentID, PayStateID) values (191, 2);
insert into Payments (PaymentID, PayStateID) values (192, 3);
insert into Payments (PaymentID, PayStateID) values (193, 3);
insert into Payments (PaymentID, PayStateID) values (194, 1);
insert into Payments (PaymentID, PayStateID) values (195, 2);
insert into Payments (PaymentID, PayStateID) values (196, 3);
insert into Payments (PaymentID, PayStateID) values (197, 1);
insert into Payments (PaymentID, PayStateID) values (198, 3);
insert into Payments (PaymentID, PayStateID) values (199, 2);
insert into Payments (PaymentID, PayStateID) values (200, 2);
insert into Payments (PaymentID, PayStateID) values (201, 1);
insert into Payments (PaymentID, PayStateID) values (202, 3);
insert into Payments (PaymentID, PayStateID) values (203, 3);
insert into Payments (PaymentID, PayStateID) values (204, 3);
insert into Payments (PaymentID, PayStateID) values (205, 3);
insert into Payments (PaymentID, PayStateID) values (206, 1);
insert into Payments (PaymentID, PayStateID) values (207, 3);
insert into Payments (PaymentID, PayStateID) values (208, 1);
insert into Payments (PaymentID, PayStateID) values (209, 3);
insert into Payments (PaymentID, PayStateID) values (210, 1);
insert into Payments (PaymentID, PayStateID) values (211, 1);
insert into Payments (PaymentID, PayStateID) values (212, 3);
insert into Payments (PaymentID, PayStateID) values (213, 1);
insert into Payments (PaymentID, PayStateID) values (214, 1);
insert into Payments (PaymentID, PayStateID) values (215, 1);
insert into Payments (PaymentID, PayStateID) values (216, 1);
insert into Payments (PaymentID, PayStateID) values (217, 2);
insert into Payments (PaymentID, PayStateID) values (218, 3);
insert into Payments (PaymentID, PayStateID) values (219, 2);
insert into Payments (PaymentID, PayStateID) values (220, 1);
insert into Payments (PaymentID, PayStateID) values (221, 3);
insert into Payments (PaymentID, PayStateID) values (222, 1);
insert into Payments (PaymentID, PayStateID) values (223, 3);
insert into Payments (PaymentID, PayStateID) values (224, 2);
insert into Payments (PaymentID, PayStateID) values (225, 3);
insert into Payments (PaymentID, PayStateID) values (226, 1);
insert into Payments (PaymentID, PayStateID) values (227, 2);
insert into Payments (PaymentID, PayStateID) values (228, 2);
insert into Payments (PaymentID, PayStateID) values (229, 1);
insert into Payments (PaymentID, PayStateID) values (230, 1);
insert into Payments (PaymentID, PayStateID) values (231, 1);
insert into Payments (PaymentID, PayStateID) values (232, 3);
insert into Payments (PaymentID, PayStateID) values (233, 1);
insert into Payments (PaymentID, PayStateID) values (234, 1);
insert into Payments (PaymentID, PayStateID) values (235, 3);
insert into Payments (PaymentID, PayStateID) values (236, 3);
insert into Payments (PaymentID, PayStateID) values (237, 3);
insert into Payments (PaymentID, PayStateID) values (238, 3);
insert into Payments (PaymentID, PayStateID) values (239, 2);
insert into Payments (PaymentID, PayStateID) values (240, 3);
insert into Payments (PaymentID, PayStateID) values (241, 2);
insert into Payments (PaymentID, PayStateID) values (242, 1);
insert into Payments (PaymentID, PayStateID) values (243, 3);
insert into Payments (PaymentID, PayStateID) values (244, 1);
insert into Payments (PaymentID, PayStateID) values (245, 3);
insert into Payments (PaymentID, PayStateID) values (246, 2);
insert into Payments (PaymentID, PayStateID) values (247, 2);
insert into Payments (PaymentID, PayStateID) values (248, 3);
insert into Payments (PaymentID, PayStateID) values (249, 2);
insert into Payments (PaymentID, PayStateID) values (250, 1);
insert into Payments (PaymentID, PayStateID) values (251, 2);
insert into Payments (PaymentID, PayStateID) values (252, 1);
insert into Payments (PaymentID, PayStateID) values (253, 3);
insert into Payments (PaymentID, PayStateID) values (254, 3);
insert into Payments (PaymentID, PayStateID) values (255, 1);
insert into Payments (PaymentID, PayStateID) values (256, 3);
insert into Payments (PaymentID, PayStateID) values (257, 2);
insert into Payments (PaymentID, PayStateID) values (258, 1);
insert into Payments (PaymentID, PayStateID) values (259, 3);
insert into Payments (PaymentID, PayStateID) values (260, 1);
insert into Payments (PaymentID, PayStateID) values (261, 3);
insert into Payments (PaymentID, PayStateID) values (262, 2);
insert into Payments (PaymentID, PayStateID) values (263, 1);
insert into Payments (PaymentID, PayStateID) values (264, 2);
insert into Payments (PaymentID, PayStateID) values (265, 2);
insert into Payments (PaymentID, PayStateID) values (266, 2);
insert into Payments (PaymentID, PayStateID) values (267, 1);
insert into Payments (PaymentID, PayStateID) values (268, 2);
insert into Payments (PaymentID, PayStateID) values (269, 2);
insert into Payments (PaymentID, PayStateID) values (270, 1);
insert into Payments (PaymentID, PayStateID) values (271, 1);
insert into Payments (PaymentID, PayStateID) values (272, 2);
insert into Payments (PaymentID, PayStateID) values (273, 2);
insert into Payments (PaymentID, PayStateID) values (274, 2);
insert into Payments (PaymentID, PayStateID) values (275, 2);
insert into Payments (PaymentID, PayStateID) values (276, 1);
insert into Payments (PaymentID, PayStateID) values (277, 3);
insert into Payments (PaymentID, PayStateID) values (278, 1);
insert into Payments (PaymentID, PayStateID) values (279, 2);
insert into Payments (PaymentID, PayStateID) values (280, 3);
insert into Payments (PaymentID, PayStateID) values (281, 2);
insert into Payments (PaymentID, PayStateID) values (282, 1);
insert into Payments (PaymentID, PayStateID) values (283, 3);
insert into Payments (PaymentID, PayStateID) values (284, 1);
insert into Payments (PaymentID, PayStateID) values (285, 3);
insert into Payments (PaymentID, PayStateID) values (286, 1);
insert into Payments (PaymentID, PayStateID) values (287, 1);
insert into Payments (PaymentID, PayStateID) values (288, 2);
insert into Payments (PaymentID, PayStateID) values (289, 1);
insert into Payments (PaymentID, PayStateID) values (290, 3);
insert into Payments (PaymentID, PayStateID) values (291, 2);
insert into Payments (PaymentID, PayStateID) values (292, 2);
insert into Payments (PaymentID, PayStateID) values (293, 3);
insert into Payments (PaymentID, PayStateID) values (294, 1);
insert into Payments (PaymentID, PayStateID) values (295, 3);
insert into Payments (PaymentID, PayStateID) values (296, 3);
insert into Payments (PaymentID, PayStateID) values (297, 2);
insert into Payments (PaymentID, PayStateID) values (298, 1);
insert into Payments (PaymentID, PayStateID) values (299, 2);
insert into Payments (PaymentID, PayStateID) values (300, 3);
insert into Payments (PaymentID, PayStateID) values (301, 3);
insert into Payments (PaymentID, PayStateID) values (302, 3);
insert into Payments (PaymentID, PayStateID) values (303, 2);
insert into Payments (PaymentID, PayStateID) values (304, 2);
insert into Payments (PaymentID, PayStateID) values (305, 1);
insert into Payments (PaymentID, PayStateID) values (306, 1);
insert into Payments (PaymentID, PayStateID) values (307, 1);
insert into Payments (PaymentID, PayStateID) values (308, 1);
insert into Payments (PaymentID, PayStateID) values (309, 2);
insert into Payments (PaymentID, PayStateID) values (310, 3);
insert into Payments (PaymentID, PayStateID) values (311, 2);
insert into Payments (PaymentID, PayStateID) values (312, 1);
insert into Payments (PaymentID, PayStateID) values (313, 3);
insert into Payments (PaymentID, PayStateID) values (314, 3);
insert into Payments (PaymentID, PayStateID) values (315, 1);
insert into Payments (PaymentID, PayStateID) values (316, 3);
insert into Payments (PaymentID, PayStateID) values (317, 3);
insert into Payments (PaymentID, PayStateID) values (318, 2);
insert into Payments (PaymentID, PayStateID) values (319, 2);
insert into Payments (PaymentID, PayStateID) values (320, 3);
insert into Payments (PaymentID, PayStateID) values (321, 3);
insert into Payments (PaymentID, PayStateID) values (322, 3);
insert into Payments (PaymentID, PayStateID) values (323, 2);
insert into Payments (PaymentID, PayStateID) values (324, 2);
insert into Payments (PaymentID, PayStateID) values (325, 1);
insert into Payments (PaymentID, PayStateID) values (326, 2);
insert into Payments (PaymentID, PayStateID) values (327, 3);
insert into Payments (PaymentID, PayStateID) values (328, 3);
insert into Payments (PaymentID, PayStateID) values (329, 2);
insert into Payments (PaymentID, PayStateID) values (330, 1);
insert into Payments (PaymentID, PayStateID) values (331, 3);
insert into Payments (PaymentID, PayStateID) values (332, 3);
insert into Payments (PaymentID, PayStateID) values (333, 2);
insert into Payments (PaymentID, PayStateID) values (334, 2);
insert into Payments (PaymentID, PayStateID) values (335, 1);
insert into Payments (PaymentID, PayStateID) values (336, 3);
insert into Payments (PaymentID, PayStateID) values (337, 1);
insert into Payments (PaymentID, PayStateID) values (338, 3);
insert into Payments (PaymentID, PayStateID) values (339, 3);
insert into Payments (PaymentID, PayStateID) values (340, 1);
insert into Payments (PaymentID, PayStateID) values (341, 3);
insert into Payments (PaymentID, PayStateID) values (342, 3);
insert into Payments (PaymentID, PayStateID) values (343, 3);
insert into Payments (PaymentID, PayStateID) values (344, 2);
insert into Payments (PaymentID, PayStateID) values (345, 1);
insert into Payments (PaymentID, PayStateID) values (346, 1);
insert into Payments (PaymentID, PayStateID) values (347, 2);
insert into Payments (PaymentID, PayStateID) values (348, 3);
insert into Payments (PaymentID, PayStateID) values (349, 3);
insert into Payments (PaymentID, PayStateID) values (350, 1);
insert into Payments (PaymentID, PayStateID) values (351, 1);
insert into Payments (PaymentID, PayStateID) values (352, 1);
insert into Payments (PaymentID, PayStateID) values (353, 2);
insert into Payments (PaymentID, PayStateID) values (354, 1);
insert into Payments (PaymentID, PayStateID) values (355, 1);
insert into Payments (PaymentID, PayStateID) values (356, 2);
insert into Payments (PaymentID, PayStateID) values (357, 1);
insert into Payments (PaymentID, PayStateID) values (358, 3);
insert into Payments (PaymentID, PayStateID) values (359, 1);
insert into Payments (PaymentID, PayStateID) values (360, 2);
insert into Payments (PaymentID, PayStateID) values (361, 1);
insert into Payments (PaymentID, PayStateID) values (362, 3);
insert into Payments (PaymentID, PayStateID) values (363, 1);
insert into Payments (PaymentID, PayStateID) values (364, 3);
insert into Payments (PaymentID, PayStateID) values (365, 2);
insert into Payments (PaymentID, PayStateID) values (366, 1);
insert into Payments (PaymentID, PayStateID) values (367, 2);
insert into Payments (PaymentID, PayStateID) values (368, 1);
insert into Payments (PaymentID, PayStateID) values (369, 1);
insert into Payments (PaymentID, PayStateID) values (370, 1);
insert into Payments (PaymentID, PayStateID) values (371, 3);
insert into Payments (PaymentID, PayStateID) values (372, 1);
insert into Payments (PaymentID, PayStateID) values (373, 1);
insert into Payments (PaymentID, PayStateID) values (374, 1);
insert into Payments (PaymentID, PayStateID) values (375, 2);
insert into Payments (PaymentID, PayStateID) values (376, 1);
insert into Payments (PaymentID, PayStateID) values (377, 1);
insert into Payments (PaymentID, PayStateID) values (378, 2);
insert into Payments (PaymentID, PayStateID) values (379, 2);
insert into Payments (PaymentID, PayStateID) values (380, 3);
insert into Payments (PaymentID, PayStateID) values (381, 1);
insert into Payments (PaymentID, PayStateID) values (382, 1);
insert into Payments (PaymentID, PayStateID) values (383, 2);
insert into Payments (PaymentID, PayStateID) values (384, 2);
insert into Payments (PaymentID, PayStateID) values (385, 1);
insert into Payments (PaymentID, PayStateID) values (386, 2);
insert into Payments (PaymentID, PayStateID) values (387, 3);
insert into Payments (PaymentID, PayStateID) values (388, 2);
insert into Payments (PaymentID, PayStateID) values (389, 3);
insert into Payments (PaymentID, PayStateID) values (390, 3);
insert into Payments (PaymentID, PayStateID) values (391, 1);
insert into Payments (PaymentID, PayStateID) values (392, 2);
insert into Payments (PaymentID, PayStateID) values (393, 2);
insert into Payments (PaymentID, PayStateID) values (394, 2);
insert into Payments (PaymentID, PayStateID) values (395, 3);
insert into Payments (PaymentID, PayStateID) values (396, 2);
insert into Payments (PaymentID, PayStateID) values (397, 3);
insert into Payments (PaymentID, PayStateID) values (398, 1);
insert into Payments (PaymentID, PayStateID) values (399, 3);
insert into Payments (PaymentID, PayStateID) values (400, 2);


/* table data for Orders  */
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (112, '2021-03-22', 3209.24, 2, 1, 21, 41);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (226, '2021-03-10', 8126.25, 2, 2, 4, 114);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (293, '2021-07-14', 4295.78, 2, 3, 3, 75);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (196, '2021-12-23', 1337.84, 2, 1, 5, 184);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (164, '2021-02-09', 5945.85, 2, 1, 9, 2);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (181, '2021-04-27', 4519.76, 3, 1, 29, 83);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (243, '2021-09-24', 9300.33, 1, 1, 26, 29);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (268, '2021-09-18', 7351.26, 3, 2, 21, 44);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (165, '2021-11-07', 9176.99, 2, 3, 15, 40);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (220, '2021-09-27', 1894.46, 3, 3, 22, 12);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (291, '2021-11-05', 9575.93, 2, 1, 30, 189);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (137, '2021-04-10', 4478.6, 2, 1, 26, 198);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (153, '2021-12-03', 2576.52, 1, 3, 27, 106);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (181, '2021-05-29', 4360.79, 2, 2, 14, 147);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (94, '2021-11-04', 1069.69, 3, 3, 22, 52);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (239, '2021-03-11', 3429.79, 3, 2, 27, 198);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (143, '2021-07-02', 6907.31, 3, 3, 8, 166);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (289, '2021-04-24', 8056.45, 1, 1, 14, 5);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (180, '2021-11-20', 9180.72, 2, 3, 19, 184);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (182, '2021-11-02', 9229.8, 2, 2, 8, 66);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (119, '2021-03-07', 5508.28, 2, 2, 6, 132);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (98, '2021-12-28', 4717.75, 2, 1, 11, 97);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (163, '2021-02-23', 3697.0, 1, 3, 10, 91);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (181, '2021-02-26', 7328.36, 1, 3, 27, 73);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (289, '2021-12-29', 2975.42, 3, 3, 8, 161);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (262, '2021-02-26', 3401.69, 1, 1, 30, 188);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (225, '2021-09-10', 6548.98, 3, 1, 26, 84);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (198, '2021-04-01', 8101.68, 3, 1, 8, 152);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (209, '2021-07-16', 3469.95, 3, 1, 10, 69);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (164, '2021-10-11', 4689.27, 3, 1, 17, 117);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (128, '2021-01-12', 5399.4, 3, 2, 27, 108);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (207, '2021-10-04', 3067.59, 2, 2, 4, 160);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (162, '2021-08-07', 9373.82, 1, 1, 1, 105);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (279, '2021-01-09', 1267.15, 2, 2, 13, 113);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (162, '2021-03-08', 3372.92, 3, 3, 25, 34);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (287, '2021-11-10', 1000.68, 2, 2, 4, 114);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (283, '2021-07-10', 4920.6, 3, 3, 1, 139);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (119, '2021-03-09', 9351.43, 3, 1, 23, 58);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (299, '2021-08-03', 5693.3, 3, 2, 22, 106);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (168, '2021-10-23', 332.36, 1, 1, 28, 123);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (103, '2021-12-21', 3416.85, 2, 2, 28, 81);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (110, '2021-08-19', 4176.21, 3, 1, 13, 108);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (113, '2021-10-12', 3475.55, 1, 3, 21, 150);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (298, '2021-01-09', 4645.17, 2, 1, 5, 119);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (141, '2021-10-15', 1966.17, 1, 2, 5, 112);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (116, '2021-09-07', 8925.2, 1, 1, 16, 42);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (93, '2021-02-26', 4201.44, 1, 1, 21, 157);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (171, '2021-08-03', 3191.7, 2, 1, 1, 1);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (163, '2021-01-10', 9577.96, 1, 3, 6, 90);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (183, '2021-03-21', 2070.73, 1, 3, 14, 37);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (243, '2021-05-31', 1668.12, 3, 1, 1, 129);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (222, '2021-04-05', 1974.88, 2, 3, 9, 66);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (164, '2021-02-23', 903.96, 3, 3, 18, 133);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (126, '2021-05-27', 956.37, 2, 3, 22, 51);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (110, '2021-06-12', 7196.94, 3, 1, 11, 128);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (297, '2021-11-12', 1113.77, 2, 1, 24, 161);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (185, '2021-09-21', 6248.55, 2, 2, 23, 50);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (122, '2021-04-19', 5985.62, 2, 1, 8, 49);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (161, '2021-07-17', 8605.15, 3, 2, 11, 2);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (253, '2021-04-13', 5444.98, 3, 2, 19, 189);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (135, '2021-03-26', 2952.63, 1, 3, 21, 196);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (282, '2021-10-10', 8897.65, 3, 2, 7, 36);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (243, '2021-07-11', 9686.11, 2, 2, 2, 197);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (209, '2021-12-18', 6227.51, 3, 1, 25, 12);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (100, '2021-12-02', 4670.03, 1, 2, 27, 153);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (93, '2021-11-27', 3604.06, 2, 1, 7, 131);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (203, '2021-06-23', 8721.31, 3, 2, 4, 103);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (239, '2021-07-21', 4457.34, 1, 1, 21, 167);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (161, '2021-08-21', 5766.87, 2, 1, 18, 101);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (119, '2021-03-08', 2107.63, 2, 2, 8, 93);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (226, '2021-07-25', 1980.29, 2, 3, 30, 45);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (243, '2021-08-06', 9092.21, 2, 1, 19, 15);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (124, '2021-06-18', 2686.28, 2, 3, 8, 30);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (138, '2021-05-11', 701.1, 1, 3, 22, 115);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (200, '2021-05-13', 9823.61, 2, 1, 15, 128);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (284, '2021-02-20', 4574.5, 1, 1, 6, 169);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (267, '2021-03-28', 8220.4, 1, 3, 19, 76);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (207, '2021-03-21', 9028.01, 1, 2, 23, 84);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (140, '2021-01-23', 3188.12, 1, 2, 26, 15);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (102, '2021-11-16', 4134.73, 2, 1, 23, 161);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (278, '2021-01-01', 5521.73, 1, 2, 30, 133);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (236, '2021-01-25', 2753.0, 1, 1, 14, 193);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (99, '2021-02-15', 8137.6, 1, 2, 26, 23);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (130, '2021-07-24', 2452.36, 1, 2, 3, 141);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (190, '2021-11-30', 4994.34, 2, 3, 20, 60);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (134, '2021-05-13', 3537.9, 2, 2, 28, 175);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (114, '2021-04-23', 2833.83, 2, 2, 21, 125);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (126, '2021-08-31', 1217.88, 1, 1, 10, 176);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (212, '2021-10-18', 6199.49, 2, 1, 30, 171);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (109, '2021-06-13', 6705.23, 2, 3, 8, 16);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (295, '2021-02-21', 5261.53, 1, 3, 30, 183);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (252, '2021-11-12', 8948.06, 2, 2, 25, 186);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (270, '2021-09-29', 2202.59, 3, 3, 28, 10);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (238, '2021-08-20', 5584.36, 1, 1, 29, 186);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (99, '2021-05-02', 9758.46, 3, 2, 18, 132);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (164, '2021-07-21', 7617.34, 3, 3, 25, 34);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (266, '2021-03-20', 3989.64, 3, 1, 9, 161);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (125, '2021-01-13', 2474.3, 2, 1, 25, 50);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (279, '2021-05-31', 3331.11, 3, 1, 3, 94);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (200, '2021-05-06', 1612.1, 3, 2, 28, 50);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (196, '2021-02-21', 8948.61, 3, 3, 7, 100);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (131, '2021-11-17', 5322.05, 2, 2, 12, 124);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (217, '2021-01-28', 6421.39, 3, 2, 4, 137);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (290, '2021-11-04', 2359.08, 3, 1, 28, 30);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (291, '2021-06-16', 1427.38, 3, 3, 16, 117);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (291, '2021-09-06', 8940.86, 1, 2, 7, 98);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (263, '2021-07-23', 7755.52, 3, 2, 6, 181);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (262, '2021-07-20', 855.12, 1, 1, 9, 124);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (123, '2021-08-21', 6426.58, 2, 2, 26, 51);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (196, '2021-11-20', 7371.43, 1, 1, 18, 195);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (257, '2021-01-04', 2448.14, 3, 2, 8, 155);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (134, '2021-03-23', 4428.17, 1, 1, 23, 68);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (203, '2021-03-07', 6624.82, 1, 2, 2, 11);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (107, '2021-10-12', 8405.8, 1, 1, 26, 93);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (107, '2021-07-17', 9466.63, 1, 2, 25, 114);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (125, '2021-11-22', 2819.95, 2, 3, 9, 102);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (264, '2021-11-23', 7073.23, 1, 1, 10, 21);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (165, '2021-07-21', 4724.47, 2, 1, 7, 160);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (203, '2021-04-20', 5205.09, 1, 1, 29, 104);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (161, '2021-11-04', 7172.95, 3, 1, 15, 22);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (194, '2021-01-24', 8083.76, 2, 2, 25, 134);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (153, '2021-04-15', 2678.05, 2, 1, 27, 78);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (300, '2021-03-12', 999.59, 3, 2, 24, 70);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (255, '2021-07-20', 4329.72, 3, 3, 8, 186);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (194, '2021-03-04', 3780.91, 2, 1, 26, 167);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (295, '2021-01-19', 2551.83, 2, 2, 5, 28);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (153, '2021-08-17', 9984.45, 1, 2, 16, 196);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (242, '2021-09-30', 1664.8, 2, 3, 26, 87);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (96, '2021-12-07', 9476.57, 2, 1, 5, 120);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (191, '2021-02-22', 5671.83, 3, 1, 26, 159);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (221, '2021-09-06', 5926.98, 1, 3, 9, 121);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (214, '2021-08-02', 1295.01, 2, 3, 4, 180);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (134, '2021-05-09', 4512.51, 1, 3, 11, 158);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (182, '2021-11-18', 7413.84, 3, 3, 12, 90);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (94, '2021-06-20', 9799.91, 1, 3, 14, 40);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (206, '2021-09-27', 1396.56, 3, 2, 18, 63);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (247, '2021-12-08', 4802.58, 1, 3, 24, 78);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (101, '2021-06-06', 7346.38, 2, 2, 21, 50);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (203, '2021-01-14', 8442.56, 1, 1, 7, 90);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (227, '2021-03-17', 2584.99, 2, 2, 4, 15);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (113, '2021-03-02', 1627.57, 3, 1, 25, 167);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (217, '2021-11-29', 652.87, 3, 2, 24, 83);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (248, '2021-10-01', 3089.16, 3, 2, 2, 129);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (174, '2021-09-25', 9986.12, 2, 2, 5, 74);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (209, '2021-11-20', 7259.51, 2, 3, 27, 143);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (138, '2021-10-06', 5191.23, 1, 2, 24, 137);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (163, '2021-07-11', 3590.12, 3, 1, 1, 101);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (260, '2021-05-04', 9363.7, 1, 3, 4, 113);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (244, '2021-02-26', 2961.83, 3, 1, 12, 21);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (272, '2021-09-04', 6422.08, 1, 1, 21, 82);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (108, '2021-07-03', 9937.84, 1, 1, 9, 73);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (265, '2021-06-28', 1748.48, 1, 2, 5, 174);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (149, '2021-03-09', 9891.65, 3, 3, 20, 89);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (162, '2021-11-29', 1497.63, 3, 1, 20, 22);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (174, '2021-12-16', 544.4, 1, 3, 7, 152);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (256, '2021-09-28', 3300.86, 3, 2, 14, 179);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (114, '2021-11-30', 9953.75, 2, 1, 2, 94);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (131, '2021-10-15', 3720.6, 3, 3, 20, 3);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (164, '2021-02-10', 6963.36, 3, 2, 18, 155);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (205, '2021-07-24', 4436.96, 1, 1, 4, 166);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (256, '2021-10-11', 2495.4, 2, 1, 17, 66);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (299, '2021-12-22', 7024.8, 1, 3, 19, 60);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (162, '2021-12-30', 4778.99, 3, 2, 30, 13);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (157, '2021-02-18', 4640.63, 3, 1, 21, 154);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (199, '2021-08-11', 9213.51, 1, 1, 2, 43);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (300, '2021-11-14', 3231.83, 3, 2, 5, 80);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (205, '2021-09-24', 6073.6, 3, 2, 11, 90);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (241, '2021-03-30', 713.5, 1, 1, 13, 108);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (262, '2021-04-27', 5504.17, 2, 3, 14, 172);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (136, '2021-11-30', 550.58, 3, 1, 10, 139);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (276, '2021-07-17', 8832.6, 3, 2, 25, 131);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (240, '2021-10-25', 2560.12, 1, 1, 15, 198);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (113, '2021-12-04', 9244.01, 1, 2, 30, 83);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (213, '2021-11-06', 7938.6, 2, 3, 12, 182);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (231, '2021-03-01', 3003.07, 3, 1, 2, 33);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (279, '2021-06-06', 1439.45, 3, 3, 13, 156);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (176, '2021-06-15', 625.39, 1, 3, 6, 102);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (118, '2021-08-31', 2413.89, 2, 1, 16, 37);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (256, '2021-04-23', 4080.68, 3, 3, 8, 58);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (244, '2021-04-17', 2124.7, 1, 3, 18, 55);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (264, '2021-01-29', 9883.67, 3, 3, 23, 142);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (108, '2021-04-12', 4822.73, 3, 1, 6, 193);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (94, '2021-09-27', 8270.52, 3, 1, 26, 84);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (280, '2021-10-09', 6812.44, 1, 3, 29, 31);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (245, '2021-10-28', 804.95, 2, 2, 25, 19);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (96, '2021-11-05', 6200.4, 1, 3, 29, 78);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (278, '2021-03-22', 4409.42, 3, 2, 29, 151);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (292, '2021-08-24', 2468.32, 3, 3, 15, 194);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (213, '2021-12-06', 4125.0, 3, 3, 29, 187);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (240, '2021-04-10', 8829.8, 3, 2, 20, 5);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (94, '2021-12-01', 8979.73, 1, 1, 14, 139);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (126, '2021-08-03', 8161.41, 3, 1, 10, 26);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (209, '2021-09-18', 2417.98, 1, 3, 25, 129);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (265, '2021-03-21', 4664.08, 3, 1, 12, 138);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (155, '2021-10-04', 4259.13, 3, 1, 21, 195);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (121, '2021-10-24', 2328.06, 3, 2, 8, 14);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (224, '2021-10-15', 2748.16, 2, 2, 6, 6);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (183, '2021-08-14', 7032.43, 1, 3, 13, 182);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (154, '2021-11-24', 462.6, 1, 1, 10, 71);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (263, '2021-05-10', 8719.55, 3, 1, 7, 180);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (239, '2021-11-15', 2281.58, 1, 2, 18, 59);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (137, '2021-08-11', 7264.69, 3, 3, 12, 185);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (146, '2021-01-22', 912.87, 1, 3, 10, 176);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (100, '2021-04-12', 7697.8, 3, 1, 9, 113);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (100, '2021-10-29', 2105.49, 1, 3, 18, 191);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (141, '2021-02-02', 3306.03, 3, 1, 23, 28);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (204, '2021-08-06', 7836.86, 1, 1, 9, 3);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (174, '2021-01-19', 656.82, 1, 1, 9, 130);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (94, '2021-11-10', 6483.14, 2, 3, 28, 57);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (1, '2020-05-28', 7088.3, 1, 3, 28, 167);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (2, '2020-10-19', 5040.73, 2, 1, 21, 122);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (3, '2020-05-03', 1524.52, 1, 3, 28, 112);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (4, '2020-08-25', 6001.32, 1, 1, 13, 61);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (5, '2020-03-09', 8586.15, 3, 3, 25, 69);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (6, '2020-05-24', 9136.27, 2, 3, 29, 148);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (7, '2020-08-19', 5392.25, 1, 3, 24, 164);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (8, '2020-07-23', 5812.76, 1, 1, 6, 141);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (9, '2020-09-16', 9540.39, 1, 1, 29, 90);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (10, '2020-08-03', 8861.28, 2, 2, 11, 189);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (11, '2020-05-01', 6732.64, 3, 1, 10, 53);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (12, '2020-11-07', 3001.88, 1, 3, 28, 12);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (13, '2020-03-19', 2158.47, 3, 2, 26, 194);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (14, '2020-08-08', 5341.07, 1, 2, 10, 80);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (15, '2020-11-27', 8236.59, 3, 1, 13, 6);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (16, '2020-08-12', 3894.42, 1, 3, 21, 192);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (17, '2020-06-07', 553.54, 1, 3, 8, 188);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (18, '2020-10-13', 2375.91, 2, 3, 30, 169);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (19, '2020-06-25', 6722.41, 3, 3, 8, 125);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (20, '2020-11-25', 1114.67, 2, 2, 19, 8);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (21, '2020-05-24', 2204.88, 1, 2, 29, 1);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (22, '2020-06-02', 6117.01, 3, 3, 8, 6);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (23, '2020-02-18', 5843.99, 3, 1, 4, 83);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (24, '2020-03-26', 5373.11, 2, 2, 4, 24);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (25, '2020-12-06', 4791.97, 3, 1, 1, 51);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (26, '2020-07-12', 4459.83, 1, 3, 30, 160);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (27, '2020-05-11', 9769.39, 3, 3, 23, 123);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (28, '2020-01-10', 1624.86, 3, 1, 1, 149);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (29, '2020-10-09', 514.1, 1, 2, 18, 122);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (30, '2020-10-19', 4401.56, 1, 2, 10, 46);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (31, '2020-06-18', 6927.91, 2, 2, 4, 173);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (32, '2020-12-29', 8313.64, 2, 2, 26, 66);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (33, '2020-10-03', 6337.63, 3, 1, 26, 54);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (34, '2020-03-02', 1611.47, 2, 3, 21, 45);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (35, '2020-05-23', 792.06, 1, 2, 15, 50);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (36, '2020-05-22', 9850.62, 3, 1, 14, 138);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (37, '2020-04-10', 4733.9, 2, 2, 27, 114);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (38, '2020-06-24', 5592.06, 3, 1, 26, 153);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (39, '2020-06-11', 8007.15, 3, 1, 26, 197);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (40, '2020-10-06', 1513.93, 3, 1, 26, 151);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (41, '2020-05-23', 2092.72, 1, 3, 19, 10);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (42, '2020-12-17', 9406.22, 2, 2, 28, 172);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (43, '2020-12-12', 971.58, 1, 2, 20, 186);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (44, '2020-06-13', 6384.19, 3, 2, 13, 54);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (45, '2020-09-07', 1145.26, 1, 3, 7, 16);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (46, '2020-08-27', 2520.45, 3, 2, 17, 85);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (47, '2020-01-13', 8274.9, 3, 1, 17, 25);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (48, '2020-04-01', 9857.92, 1, 2, 27, 175);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (49, '2020-03-31', 3070.21, 1, 3, 6, 167);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (50, '2020-06-17', 8950.26, 3, 2, 2, 67);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (51, '2020-07-14', 1749.33, 2, 1, 14, 115);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (52, '2020-07-14', 1002.0, 2, 2, 22, 58);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (53, '2020-09-29', 1164.63, 1, 3, 15, 72);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (54, '2020-03-17', 9993.82, 3, 2, 4, 36);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (55, '2020-03-11', 1502.44, 2, 3, 16, 147);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (56, '2020-02-16', 3509.68, 2, 2, 12, 141);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (57, '2020-04-14', 9677.53, 3, 1, 5, 179);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (58, '2020-08-09', 5091.02, 3, 2, 16, 173);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (59, '2020-02-15', 5207.49, 3, 3, 16, 34);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (60, '2020-05-02', 9309.83, 2, 3, 11, 155);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (61, '2020-10-10', 9768.52, 3, 2, 15, 143);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (62, '2020-02-13', 5648.92, 3, 1, 23, 79);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (63, '2020-06-23', 6028.55, 1, 3, 28, 130);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (64, '2020-12-01', 7067.95, 1, 2, 30, 64);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (65, '2020-03-01', 6375.56, 3, 2, 19, 26);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (66, '2020-05-03', 4650.15, 2, 2, 30, 175);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (67, '2020-01-18', 6693.83, 3, 2, 15, 68);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (68, '2020-11-23', 7513.53, 2, 1, 13, 49);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (69, '2020-03-19', 6791.98, 3, 3, 17, 149);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (70, '2020-02-17', 5412.84, 1, 1, 1, 20);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (71, '2020-07-06', 394.87, 2, 2, 26, 135);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (72, '2020-09-02', 4421.45, 1, 1, 10, 9);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (73, '2020-01-12', 8250.0, 3, 1, 13, 128);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (74, '2020-11-17', 9731.11, 3, 3, 23, 49);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (75, '2020-05-22', 1125.17, 2, 3, 18, 188);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (76, '2020-06-04', 5782.04, 2, 1, 9, 120);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (77, '2020-12-17', 1530.29, 3, 3, 8, 121);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (78, '2020-11-21', 6106.32, 1, 2, 13, 35);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (79, '2020-05-13', 5757.16, 1, 3, 5, 136);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (80, '2020-01-08', 5146.04, 2, 1, 9, 113);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (81, '2020-04-27', 1013.1, 1, 3, 28, 50);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (82, '2020-02-25', 5554.48, 1, 3, 21, 111);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (83, '2020-02-26', 7899.47, 1, 2, 9, 179);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (84, '2020-08-01', 8821.37, 3, 2, 9, 124);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (85, '2020-04-19', 9130.95, 3, 2, 16, 33);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (86, '2020-10-09', 8112.79, 2, 2, 27, 90);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (87, '2020-05-09', 3126.38, 3, 3, 23, 95);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (88, '2020-01-13', 949.94, 1, 2, 9, 140);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (89, '2020-07-21', 6788.73, 2, 1, 22, 77);
insert into Orders (OrderID, OrderDate, TotalPrice, PaymentID, OrderStatusID, StaffID, CustomerID) values (90, '2020-06-18', 5633.31, 1, 2, 29, 72);


/* ----------------------------------------- */
/* INSERT data into oderItems table for 3.7 */
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (1, 3, 4, 218);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (2, 49, 3, 210);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (3, 92, 5, 189);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (4, 46, 3, 137);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (5, 87, 4, 201);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (6, 50, 3, 243);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (7, 24, 4, 142);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (8, 98, 4, 148);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (9, 50, 5, 129);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (10, 26, 1, 268);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (11, 79, 5, 299);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (12, 57, 1, 82);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (13, 34, 1, 146);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (14, 38, 3, 25);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (15, 24, 5, 262);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (16, 69, 5, 146);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (17, 36, 5, 18);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (18, 92, 2, 156);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (19, 7, 3, 240);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (20, 18, 5, 173);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (21, 60, 5, 5);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (22, 20, 2, 2);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (23, 73, 3, 244);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (24, 87, 5, 298);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (25, 10, 5, 108);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (26, 70, 3, 157);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (27, 38, 1, 287);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (28, 86, 4, 245);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (29, 97, 1, 246);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (30, 1, 2, 197);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (31, 26, 4, 264);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (32, 87, 3, 78);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (33, 72, 5, 159);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (34, 10, 1, 260);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (35, 37, 1, 300);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (36, 39, 4, 191);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (37, 34, 2, 129);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (38, 29, 5, 8);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (39, 52, 2, 114);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (40, 33, 1, 78);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (41, 35, 2, 229);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (42, 19, 2, 293);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (43, 5, 3, 75);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (44, 13, 4, 205);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (45, 35, 1, 201);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (46, 63, 3, 186);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (47, 49, 2, 172);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (48, 54, 4, 279);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (49, 10, 3, 115);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (50, 2, 1, 51);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (51, 7, 3, 199);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (52, 23, 5, 80);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (53, 86, 3, 76);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (54, 15, 3, 132);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (55, 92, 4, 224);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (56, 43, 2, 169);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (57, 81, 3, 210);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (58, 22, 2, 69);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (59, 26, 1, 79);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (60, 35, 5, 278);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (61, 97, 4, 60);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (62, 46, 5, 233);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (63, 19, 1, 155);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (64, 53, 1, 254);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (65, 75, 5, 45);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (66, 32, 4, 229);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (67, 23, 1, 82);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (68, 65, 4, 60);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (69, 90, 3, 203);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (70, 37, 4, 36);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (71, 77, 5, 3);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (72, 23, 1, 17);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (73, 35, 3, 170);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (74, 100, 4, 109);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (75, 54, 5, 114);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (76, 70, 1, 101);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (77, 38, 3, 124);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (78, 21, 4, 123);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (79, 89, 4, 221);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (80, 37, 4, 235);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (81, 23, 3, 13);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (82, 60, 3, 294);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (83, 5, 3, 266);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (84, 62, 3, 111);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (85, 17, 3, 90);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (86, 35, 5, 161);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (87, 94, 3, 210);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (88, 59, 2, 176);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (89, 78, 1, 78);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (90, 75, 4, 266);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (91, 33, 4, 298);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (92, 26, 1, 92);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (93, 75, 1, 110);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (94, 30, 1, 159);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (95, 45, 3, 143);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (96, 76, 1, 234);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (97, 89, 2, 96);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (98, 11, 3, 242);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (99, 8, 2, 181);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (100, 39, 3, 25);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (101, 88, 3, 218);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (102, 81, 2, 131);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (103, 81, 5, 197);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (104, 34, 1, 176);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (105, 69, 1, 183);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (106, 62, 4, 251);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (107, 75, 4, 258);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (108, 14, 4, 110);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (109, 71, 3, 140);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (110, 76, 5, 225);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (111, 87, 2, 150);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (112, 23, 4, 193);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (113, 24, 5, 290);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (114, 97, 5, 11);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (115, 19, 5, 92);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (116, 77, 4, 239);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (117, 53, 4, 89);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (118, 85, 4, 123);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (119, 38, 4, 114);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (120, 22, 3, 110);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (121, 53, 4, 77);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (122, 82, 4, 165);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (123, 52, 1, 3);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (124, 86, 4, 222);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (125, 59, 5, 27);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (126, 77, 4, 277);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (127, 26, 5, 291);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (128, 2, 1, 286);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (129, 86, 3, 221);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (130, 52, 4, 223);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (131, 44, 3, 142);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (132, 36, 3, 296);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (133, 22, 1, 148);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (134, 1, 3, 83);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (135, 50, 2, 145);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (136, 70, 2, 68);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (137, 7, 1, 209);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (138, 95, 4, 132);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (139, 43, 1, 249);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (140, 42, 1, 223);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (141, 83, 2, 256);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (142, 40, 3, 147);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (143, 52, 3, 266);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (144, 90, 2, 12);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (145, 94, 4, 153);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (146, 22, 2, 238);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (147, 48, 5, 49);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (148, 15, 3, 252);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (149, 49, 1, 106);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (150, 71, 5, 13);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (151, 91, 1, 148);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (152, 61, 3, 193);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (153, 75, 4, 20);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (154, 4, 2, 149);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (155, 7, 1, 81);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (156, 35, 1, 265);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (157, 100, 3, 199);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (158, 90, 2, 151);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (159, 71, 5, 19);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (160, 75, 1, 77);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (161, 52, 5, 66);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (162, 55, 2, 260);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (163, 82, 4, 130);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (164, 1, 5, 195);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (165, 56, 1, 240);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (166, 3, 1, 57);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (167, 18, 2, 25);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (168, 5, 5, 142);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (169, 67, 2, 189);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (170, 78, 3, 146);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (171, 87, 2, 284);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (172, 38, 4, 277);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (173, 53, 3, 256);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (174, 67, 2, 34);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (175, 25, 5, 279);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (176, 68, 2, 101);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (177, 40, 2, 100);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (178, 47, 5, 82);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (179, 69, 2, 292);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (180, 33, 5, 126);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (181, 78, 1, 7);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (182, 67, 2, 238);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (183, 71, 2, 129);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (184, 3, 1, 296);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (185, 85, 4, 129);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (186, 18, 1, 39);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (187, 97, 5, 294);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (188, 11, 5, 286);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (189, 37, 4, 89);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (190, 2, 5, 239);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (191, 36, 4, 94);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (192, 97, 5, 128);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (193, 50, 2, 165);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (194, 91, 2, 226);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (195, 48, 5, 161);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (196, 80, 5, 135);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (197, 21, 4, 192);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (198, 87, 3, 68);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (199, 38, 4, 263);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (200, 3, 3, 143);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (201, 57, 4, 164);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (202, 71, 2, 115);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (203, 60, 4, 234);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (204, 4, 1, 232);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (205, 21, 4, 293);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (206, 70, 5, 168);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (207, 51, 5, 179);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (208, 38, 5, 261);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (209, 41, 5, 121);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (210, 36, 4, 186);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (211, 65, 2, 194);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (212, 68, 1, 182);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (213, 38, 4, 47);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (214, 71, 4, 30);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (215, 69, 3, 224);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (216, 52, 2, 39);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (217, 1, 2, 22);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (218, 47, 1, 148);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (219, 71, 4, 35);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (220, 83, 3, 279);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (221, 58, 1, 128);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (222, 64, 5, 261);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (223, 30, 1, 2);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (224, 48, 3, 294);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (225, 41, 3, 258);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (226, 72, 2, 11);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (227, 53, 5, 71);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (228, 33, 1, 187);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (229, 86, 2, 160);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (230, 24, 1, 246);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (231, 16, 3, 273);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (232, 85, 5, 25);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (233, 26, 3, 94);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (234, 41, 1, 281);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (235, 42, 3, 46);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (236, 56, 2, 183);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (237, 78, 3, 186);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (238, 89, 5, 197);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (239, 82, 5, 129);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (240, 56, 1, 101);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (241, 75, 1, 277);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (242, 66, 5, 251);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (243, 56, 2, 42);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (244, 51, 5, 184);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (245, 19, 2, 293);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (246, 52, 4, 274);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (247, 48, 4, 39);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (248, 84, 3, 177);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (249, 9, 4, 188);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (250, 26, 2, 295);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (251, 81, 4, 223);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (252, 85, 3, 26);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (253, 92, 4, 88);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (254, 42, 2, 149);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (255, 19, 1, 243);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (256, 13, 3, 209);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (257, 84, 5, 125);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (258, 4, 2, 127);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (259, 36, 5, 86);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (260, 92, 2, 177);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (261, 8, 3, 200);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (262, 9, 2, 224);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (263, 46, 5, 46);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (264, 58, 1, 274);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (265, 85, 3, 277);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (266, 44, 2, 219);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (267, 62, 1, 103);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (268, 86, 4, 241);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (269, 12, 1, 263);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (270, 57, 4, 44);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (271, 50, 4, 126);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (272, 80, 2, 58);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (273, 28, 4, 225);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (274, 86, 3, 18);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (275, 8, 2, 172);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (276, 59, 5, 259);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (277, 4, 3, 62);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (278, 12, 5, 243);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (279, 15, 1, 198);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (280, 63, 1, 164);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (281, 31, 3, 151);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (282, 42, 1, 232);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (283, 40, 2, 153);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (284, 11, 1, 188);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (285, 69, 3, 16);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (286, 70, 2, 159);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (287, 47, 4, 290);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (288, 11, 3, 113);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (289, 84, 2, 107);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (290, 29, 2, 140);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (291, 4, 3, 181);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (292, 22, 1, 150);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (293, 70, 2, 6);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (294, 89, 5, 94);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (295, 93, 4, 91);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (296, 25, 2, 142);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (297, 3, 1, 220);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (298, 96, 5, 241);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (299, 18, 4, 233);
insert into OrderItems (OrderItemID, ItemID, Quantity, OrderID) values (300, 23, 3, 245);


/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

/* ------------------------------------------------------------------------------------------- */
/* PART 3 - Statements */
/* ---------------------------------------------------------------------------------------------*/

/* Q3.1.a. - Products in stock with a greater price than €3000. */
/* ---------------------------------------------------------------------------------------------*/
use brandlux;

SELECT * FROM Stock
WHERE UnitPrice >3000.00;

/* Q3.1.b. - In order to see product details -adding join from brand name and model name to Products in stock. */
/* ------------------------------------------------------------ */
SELECT Stock.ItemID, BrandNames.BrandName, ModelNames.ModelName, UnitPrice, Quantity 
FROM Stock
LEFT JOIN BrandNames ON Stock.BrandNameID = BrandNames.BrandNameID
LEFT JOIN ModelNames ON Stock.ModelNameID = ModelNames.ModelNameID
WHERE UnitPrice >3000.00;


/* ------------------------------------------------------------ */
/* Q3.2. - Products in stock with a supplier of the item. ( Using joins) */
/* ------------------------------------------------------------ */
SELECT Stock.ItemID, BrandNames.BrandName, ModelNames.ModelName, Suppliers.SupplierName
FROM Stock
LEFT JOIN BrandNames ON Stock.BrandNameID = BrandNames.BrandNameID
LEFT JOIN ModelNames ON Stock.ModelNameID = ModelNames.ModelNameID
LEFT JOIN Suppliers ON Stock.SupplierID = Suppliers.SupplierID


/* ------------------------------------------------------------ */
/* Q3.3. - DELETE a record from a table - example on 2 tables of: Orders & Staff -
sorts Orders by Order ID and delete the first order (limit to 1), in Staff -deleted no.1 Staff ID. */
/* ------------------------------------------------------------ */
DELETE FROM Orders
ORDER BY OrderID
LIMIT 1;

/* In order to perfome some delete statemnt had to disable and later enable the foreign key: */
SET FOREIGN_KEY_CHECKS=0;
DELETE FROM Staff
WHERE StaffID = 1
LIMIT 1;
SET FOREIGN_KEY_CHECKS=1;


/* ------------------------------------------------------------ */
/* Q3.4. - Count items sold in October 2021 */
/* ------------------------------------------------------------ */
SELECT sum(OrderItems.Quantity) as ItemSalesOctober2021
FROM OrderItems
LEFT JOIN Orders ON OrderItems.OrderID = Orders.OrderID
WHERE (Orders.OrderDate BETWEEN '2021-10-01 00:00:01' AND '2021-10-30 23:59:59')


/* ------------------------------------------------------------ */
/* Q3.5. - Top 10 customers who handled the most value of orders */
/* ------------------------------------------------------------ */
SELECT sum(Orders.TotalPrice) as Total_Spent, Customers.FName as FirstName, Customers.Surname
FROM Orders
LEFT JOIN Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY Orders.CustomerID
ORDER BY Total_Spent DESC
LIMIT 10;


/* ------------------------------------------------------------ */
/* Q3.6. - Top 10 staff who handled the most value of orders */
/* ------------------------------------------------------------ */
CREATE VIEW TopStaff AS
SELECT sum(Orders.TotalPrice) as Transaction_Value, Staff.FirstName, Staff.Surname
FROM Orders
LEFT JOIN Staff ON Orders.StaffID = Staff.StaffID
GROUP BY Orders.StaffID
ORDER BY Transaction_Value DESC
LIMIT 10;


/* ------------------------------------------------------------ */
/* Q3.7. - Top most popular products -limit to 5 top */
/* ------------------------------------------------------------ */
SELECT sum(OrderItems.Quantity) as items_sold_total, OrderItems.ItemID, BrandNames.BrandName as Brand, ModelNames.ModelName as Model, count(1) as order_count
FROM OrderItems
LEFT JOIN Stock ON OrderItems.ItemID = Stock.ItemID
LEFT JOIN BrandNames ON Stock.BrandNameID = BrandNames.BrandNameID
LEFT JOIN ModelNames ON Stock.ModelNameID = ModelNames.ModelNameID
GROUP BY ItemID 
ORDER BY items_sold_total DESC
LIMIT 5;


/* ------------------------------------------------------------ */
/* Q3.8. - Orders in 2021 group by amount of items sold and prices sold per month */
/* ------------------------------------------------------------ */
CREATE VIEW Sales2021
AS
SELECT 
    YEAR(Orders.OrderDate) as Year,
    MONTH(Orders.OrderDate) as Month,
    SUM(OrderItems.Quantity) as Products,
    SUM(Orders.TotalPrice) as RevenueMonthly
FROM OrderItems
LEFT JOIN Orders ON OrderItems.OrderID = Orders.OrderID
WHERE (Orders.OrderDate BETWEEN '2021-01-01 00:00:01' AND '2021-12-31 23:59:59')
GROUP BY YEAR(Orders.OrderDate), MONTH(Orders.OrderDate) with ROLLUP;

/*------------------------------------------------------------ */
