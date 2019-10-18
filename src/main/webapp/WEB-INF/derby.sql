create table auth_role(
    id int generated always as identity,
    role_name varchar(200) not null,
    primary key(id)
);

insert into auth_role(role_name) values
('ADMIN'), ('USER');

select * from auth_role;


-----------------------------------Viet_Start--------------------------------------------------
---- tạo bảng ShoppingCart-----
drop table ShoppingCart;
create table ShoppingCart(
    id int generated always as identity,
    productID int not null,
    accountID int not null,
    locationsID int not null,
    discountID int,
    size varchar(10) not null,
    weight float not null,
    type varchar(50) not null,
    quantity int not null,
    price float not null,
    buy_date timestamp,
    whishListID boolean,
    created_at timestamp,
    update_at timestamp,
    deleted_at timestamp,
    primary key(id),
    constraint FK_ShoppingCart_Product foreign key(productID) references product(id),
    constraint FK_ShoppingCart_Account foreign key(accountID) references account(account_id),
    constraint FK_ShoppingCart_Locations foreign key(locationsID) references locations(id),
    constraint FK_ShoppingCart_Discount foreign key(discountID) references discount(id)
);
-- ---Insert giá trị cho bảng ShoppingCart-----
insert into ShoppingCart(productID,accountID,locationsID,discountID,size,weight,type,quantity,price,whishListID) values
('ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN'), 
('ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN');
select * from ShoppingCart;

-- ---Tạo bảng chi tiết hóa đơn------
drop table Invoice_detail;
create table Invoice_detail(
    id int generated always as identity,
    productID int not null,
    size varchar(10) not null,
    weight float not null,
    type varchar(50) not null,
    price float not null,
    quantity int not null,
    discountID int,
    amount float not null,
    create_at timestamp,
    update_at timestamp,
    delete_at timestamp,
    primary key(id),
    constraint FK_Invoice_detail_Product foreign key(productID) references product(id),
    constraint FK_Invoice_detail_Discount foreign key(discountID) references discount(id),
);
-- ---Insert giá trị cho bảng chi tiết hóa đơn-----
insert into Invoice_detail(productID,size,weight,type,price,quantity,discountID,amount) values
('ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN'), 
('ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN');
select * from Invoice_detail;

-- ---tạo bảng hóa đơn-----
drop table Invoice;
create table Invoice(
    id int generated always as identity,
    accountID int not null,
    invoiceDetailID int not null,
    locationsID int not null,
    payInforID int not null,
    status varchar(100) not null,
    pay_method varchar(100) not null,
    numberCheck_invoice int,
    cancel_date timestamp,
    cancel_reason varchar(255),
    create_at timestamp,
    update_at timestamp,
    delete_at timestamp,
    primary key(id),
    constraint FK_Invoice_Account foreign key(accountID) references account(account_id),
    constraint FK_Invoice_InvoiceDetail foreign key(InvoiceDetailID) references Invoice_detail(id),
    constraint FK_Invoice_Locations foreign key(locationsID) references locations(id),
    constraint FK_Invoice_PayInforID foreign key(PayInforID) references Pay_infor(id),
);
-- --Insert giá trị cho bảng hóa đơn----
insert into Invoice(accountID,invoiceDetailID,locationsID,payInforID,status,pay_method,numberCheck_invoice,cancel_reason) values
('ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN'), 
('ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN');
select * from Invoice;

-- ---tạo bảng thông tin thanh toán của khách hàng-----
drop table Pay_infor;
create table Pay_infor(
    id int generated always as identity,
    accountID int not null,
    custNameInfor varchar(200),
    custAddInfor varchar(255),
    custPhoneInfor int,
    userBankInfor varchar(200),
    numberCardInfor varchar(50),
    cardOpenDate date,
    create_at timestamp,
    update_at timestamp,
    delete_at timestamp,
    primary key(id),
    constraint FK_Pay_infor_Customer foreign key(accountID) references account(account_id),
);
-- ---Insert giá trị cho bảng thông tin thanh toán của khách hàng----
insert into Pay_infor(accountID,custNameInfor,custAddInfor,custPhoneInfor,userBankInfor,numberCardInfor,cardOpenDate) values
('ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN'), 
('ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','ADMIN');
select * from Pay_infor;
-----------------------------------Viet_end--------------------------------------------------