create table auth_role(
    id int generated always as identity,
    role_name varchar(200) not null,
    primary key(id)
);

insert into auth_role(role_name) values
('ADMIN'), ('USER');

select * from auth_role;


-----------------------------------Viet_Start--------------------------------------------------
drop table ShoppingCart;
create table ShoppingCart(
    id int generated always as identity,
    ProductID int not null,
    CustomerID int not null,
    BranchID int not null,
    DiscountID int,
    Size varchar(10) not null,
    weight float not null,
    type varchar(50) not null,
    Quantity int not null,
    Price float not null,
    Buy_date timestamp,
    WhishListID boolean,
    created_at timestamp,
    update_at timestamp,
    deleted_at timestamp,
    primary key(id),
    constraint FK_ShoppingCart_Product foreign key(ProductID) references Product(id),
    constraint FK_ShoppingCart_Customer foreign key(CustomerID) references Customer(id),
    constraint FK_ShoppingCart_Branch foreign key(BranchID) references Branch(id),
    constraint FK_ShoppingCart_Discount foreign key(DiscountID) references Discount(id)
);


insert into ShoppingCart(ProductID,CustomerID,BranchID,DiscountID,Size,weight,type,Quantity,Price,WhishListID) values
('ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN'), 
('ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN');

select * from ShoppingCart;

drop table Invoice_detail;
create table Invoice_detail(
    id int generated always as identity,
    ProductID int not null,
    Size varchar(10) not null,
    weight float not null,
    type varchar(50) not null,
    Price float not null,
    Quantity int not null,
    DiscountID int,
    Amount float not null,
    create_at timestamp,
    update_at timestamp,
    delete_at timestamp,
    primary key(id),
    constraint FK_Invoice_detail_Product foreign key(ProductID) references Product(id),
    constraint FK_Invoice_detail_Discount foreign key(DiscountID) references Discount(id),
);

insert into Invoice_detail(ProductID,Size,weight,type,Price,Quantity,DiscountID,Amount) values
('ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN'), 
('ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN');

select * from Invoice_detail;

drop table Invoice;
create table Invoice(
    id int generated always as identity,
    CustomerID int not null,
    InvoiceDetailID int not null,
    PayInforID int not null,
    Status varchar(100) not null,
    Pay_method varchar(100) not null,
--     Status ENUM('New', 'Delivery', 'Cancel','Complete') not null,
--     Pay_method ENUM('COD', 'Debit Card') not null,
    Cancel_date timestamp,
    Cancel_reason varchar(255),
    create_at timestamp,
    update_at timestamp,
    delete_at timestamp,
    primary key(id),
    constraint FK_Invoice_Customer foreign key(CustomerID) references Customer(id),
    constraint FK_Invoice_InvoiceDetail foreign key(InvoiceDetailID) references Invoice_detail(id),
    constraint FK_Invoice_PayInforID foreign key(PayInforID) references Pay_infor(id),
);

insert into Invoice(CustomerID,InvoiceDetailID,PayInforID,Status,Pay_method,Cancel_reason) values
('ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN'), 
('ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN');

select * from Invoice;


drop table Pay_infor;
create table Pay_infor(
    id int generated always as identity,
    CustomerID int not null,
    CustNameInfor varchar(200),
    CustAddInfor varchar(255),
    CustPhoneInfor int,
    UserBankInfor varchar(200),
    NumberCardInfor varchar(50),
    CardOpenDate date,
    create_at timestamp,
    update_at timestamp,
    delete_at timestamp,
    primary key(id),
    constraint FK_Pay_infor_Customer foreign key(CustomerID) references Customer(id),
);

insert into Pay_infor(CustomerID,InvoiceDetailID,Status,Pay_method,PayInforID,Cancel_reason,CardOpenDate) values
('ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN'), 
('ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN');

select * from Pay_infor;
-----------------------------------Viet_end--------------------------------------------------
abcd