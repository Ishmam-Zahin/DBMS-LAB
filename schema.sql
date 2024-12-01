-- example-2
CREATE TABLE employee(
    employee_name VARCHAR(100),
    street VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    PRIMARY KEY (employee_name)
);

CREATE TABLE works(
    employee_name VARCHAR(100),
    company_name VARCHAR(100) NOT NULL,
    salary INT NOT NULL,
    PRIMARY KEY (employee_name)
);


INSERT INTO employee(employee_name, street, city)
VALUES
('Arif', '51 upashahar', 'Rajshahi'),
('Sumon', '52 east', 'Moynamati'),
('Sagor', 'Neemgachhi', 'Sirajgong'),
('Abdul', 'Binodpur', 'Rajshahi'),
('Himesh', 'Nazrul avenue', 'Dhaka'),
('Amirul', 'Chawk bazar', 'Sylhet'),
('Sajib', '99 north', 'Chittagong');

INSERT INTO works(employee_name, company_name, salary)
VALUES
('Sumon', 'Agrani', 12000),
('Abdul', 'Sonali', 13000),
('Himesh', 'Agrani', 6000),
('Amirul', 'Sonali', 20000),
('Sagor', 'Sonali', 8000),
('Arif', 'Janata', 13000),
('Sajib', 'Janata', 9000);

-- example-3

CREATE TABLE person(
    nid INT,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL,
    PRIMARY KEY (nid)
);

CREATE TABLE car(
    license VARCHAR(100),
    `year` YEAR NOT NULL,
    model VARCHAR(100) NOT NULL,
    PRIMARY KEY (license)
);

CREATE TABLE accident(
    `date` DATE,
    driver VARCHAR(100),
    damage_amount INT,
    PRIMARY KEY (`date`, driver)
);

CREATE TABLE owns(
    nid INT,
    license VARCHAR(100),
    PRIMARY KEY (nid, license)
);

CREATE TABLE log(
    license VARCHAR(100),
    `date` date,
    driver VARCHAR(100),
    PRIMARY KEY (license, `date`, driver)
);

INSERT INTO person (nid, name, address)
VALUES
(123451, 'Arif', 'Rajshahi'),
(123452, 'Sumon', 'Moynamati'),
(123453, 'Sagor', 'Sirajgang'),
(123454, 'Abdul', 'Rajshahi'),
(123455, 'Himesh', 'Dhaka'),
(123456, 'Amirul', 'Sylhet'),
(123457, 'Sajib', 'Chittagang');

INSERT INTO car (license, `year`, model)
VALUES
('12-3000', 2012, 'Axio'),
('11-3000', 2008, 'Corolla'),
('12-4000', 2013, 'Axio'),
('12-5000', 2013, 'Premio'),
('11-5000', 2010, 'Nano'),
('11-6000', 2011, 'Alto'),
('12-6000', 2015, 'Nano Twist');

INSERT INTO accident (`date`, driver, damage_amount)
VALUES
('2013-12-01', 'Arif', 10000),
('2015-09-25', 'Komol', 12000),
('2014-06-20', 'Bahadur', 11000),
('2011-12-20', 'Abdul', 8000),
('2015-09-19', 'Akter', 7000),
('2013-05-15', 'Arif', 20000),
('2014-08-20', 'Arif', 15000);

INSERT INTO owns (nid, license)
VALUES
(123451, '11-3000'),
(123452, '12-4000'),
(123453, '12-5000'),
(123454, '11-5000'),
(123455, '11-6000'),
(123456, '12-6000'),
(123457, '12-3000');

INSERT INTO log (license, `date`, driver)
VALUES
('11-3000', '2013-12-01', 'Arif'),
('12-4000', '2015-09-25', 'Komol'),
('11-6000', '2014-06-20', 'Bahadur'),
('11-5000', '2011-12-20', 'Abdul'),
('12-6000', '2015-09-19', 'Akter'),
('11-3000', '2013-05-15', 'Arif'),
('11-3000', '2014-08-20', 'Arif');

-- example-4

CREATE TABLE company(
    company_name VARCHAR(100),
    city VARCHAR(100) NOT NULL,
    PRIMARY KEY (company_name)
);

CREATE TABLE manages(
    employee_name VARCHAR(100),
    manager_name VARCHAR(100),
    PRIMARY KEY (employee_name, manager_name)
);

INSERT INTO company (company_name, city)
VALUES
('Agrani', 'Rajshahi'),
('Sonali', 'Sylhet'),
('Janata', 'Dhaka');

INSERT INTO manages (employee_name, manager_name)
VALUES
('Amirul', 'Amirul'),
('Abdul', 'Amirul'),
('Sagor', 'Amirul'),
('Sumon', 'Sumon'),
('Himesh', 'Sumon'),
('Arif', 'Arif'),
('Sajib', 'Arif');

-- example-5

CREATE TABLE publisher(
    name VARCHAR(100),
    address VARCHAR(100) NOT NULL,
    phone VARCHAR(100) NOT NULL,
    PRIMARY KEY (name)
);

CREATE TABLE book(
    book_id VARCHAR(100),
    title VARCHAR(100) NOT NULL,
    publisher_name VARCHAR(100),
    PRIMARY KEY (book_id),
    FOREIGN KEY (publisher_name) REFERENCES publisher(name)
);

CREATE TABLE book_author(
    book_id VARCHAR(100),
    author_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (book_id, author_name),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);

CREATE TABLE library_branch(
    branch_id INT,
    branch_name VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL,
    PRIMARY KEY (branch_id)
);

CREATE TABLE book_copies(
    book_id VARCHAR(100),
    branch_id INT,
    no_of_copies INT NOT NULL,
    PRIMARY KEY (book_id, branch_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (branch_id) REFERENCES library_branch(branch_id)
);

CREATE TABLE borrower(
    card_no INT,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    PRIMARY KEY (card_no)
);

CREATE TABLE book_loan(
    book_id VARCHAR(100),
    branch_id INT,
    card_no INT,
    date_out DATE NOT NULL,
    due_date DATE NOT NULL,
    PRIMARY KEY (book_id, branch_id, card_no),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (branch_id) REFERENCES library_branch(branch_id),
    FOREIGN KEY (card_no) REFERENCES borrower(card_no)
);

INSERT INTO publisher (name, address, phone)
VALUES
('PHI', '20 Delhi Super Market', '01715-454678'),
('Tata', 'North Kolkata', '0156-2345445'),
('Galgotia', 'Mumbai', '0192-203490');

INSERT INTO book (book_id, title, publisher_name)
VALUES
('100.001cn', 'Computer Network', 'PHI'),
('100.002dsc', 'Database System', 'Tata'),
('100.003ds', 'Digital System', 'PHI'),
('100.004db', 'DBMS', 'PHI'),
('100.005ora', 'Oracle 2000', 'Galgotia');

INSERT INTO book_author (book_id, author_name)
VALUES
('100.001cn', 'A S Tanenbaum'),
('100.002dsc', 'Silberschatz'),
('100.003ds', 'Ronald J Tocci'),
('100.004db', 'Ivan Bayross'),
('100.005ora', 'Ivan Bayross');

INSERT INTO library_branch (branch_id, branch_name, address)
VALUES
(1001, 'CSE Seminar Library', 'Rajshahi'),
(1002, 'RU Central Library', 'Rajshahi'),
(1003, 'DU Central Library', 'Dhaka');

INSERT INTO book_copies (book_id, branch_id, no_of_copies)VALUES
('100.001cn', 1001, 2),
('100.001cn', 1002, 5),
('100.002dsc', 1001, 3),
('100.002dsc', 1002, 4),
('100.003ds', 1001, 3),
('100.003ds', 1003, 5),
('100.004db', 1001, 2),
('100.004db', 1002, 5),
('100.005ora', 1001, 2),
('100.005ora', 1002, 7);

INSERT INTO borrower (card_no, name, address, phone)
VALUES
(10001, 'Saidur', 'CSE', '01714-400567'),
(10002, 'Rafiq', 'PHYSICS', '0194-300456'),
(10003, 'Masud', 'CSE', '0156-345678'),
(10004, 'Nobir', 'ICT', '01199-203456');

INSERT INTO book_loan (book_id, branch_id, card_no, date_out, due_date)
VALUES
('100.001cn', 1001, 10001, '2015-01-15', '2015-02-15'),
('100.001cn', 1002, 10002, '2015-01-25', '2015-02-25'),
('100.002dsc', 1001, 10003, '2015-02-20', '2015-03-20'),
('100.002dsc', 1002, 10004, '2015-03-15', '2015-04-15'),
('100.003ds', 1001, 10001, '2015-06-07', '2015-07-07'),
('100.003ds', 1003, 10002, '2015-10-15', '2015-11-15'),
('100.004db', 1001, 10003, '2015-10-25', '2015-11-25'),
('100.004db', 1002, 10004, '2015-11-15', '2015-12-15'),
('100.005ora', 1001, 10003, '2015-12-22', '2016-01-22'),
('100.005ora', 1002, 10001, '2015-12-25', '2016-01-25');
