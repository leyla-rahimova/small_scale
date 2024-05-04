-- dropping tables libraries and employees (from ha3)
drop table libraries cascade constraints;
drop table employees cascade constraints;

-- creating tables libraries and employees (from ha3)
create table libraries (
   lib_id               INTEGER               not null,
   lib_name             VARCHAR2(50)          not null,
   reg_num              NUMBER                not null,
   reg_date             DATE                  not null,
   lib_address          VARCHAR2(100)         not null,
   constraint PK_libraries primary key (lib_id)
);

create table employees (
   emp_id               INTEGER               not null,
   lib_id               INTEGER               not null,
   emp_full_name        VARCHAR2(50)          not null,
   emp_birthday         DATE                  not null,
   emp_phone            VARCHAR2(1024)        not null,
   emp_email            VARCHAR2(1024)        not null,
   emp_address          VARCHAR2(100)         not null,
   start_date           DATE,
   constraint PK_employees primary key (emp_id, lib_id)
);

-- altering table employees
alter table employees
    add constraint FK_emp_lib foreign key (lib_id) references libraries(lib_id);
    
-- dropping the rest of the tables
drop table readers cascade constraints;
drop table books cascade constraints;
drop table loans cascade constraints;

-- creating the rest of the tables
create table readers (
    user_id             INTEGER               not null,
    user_full_name      VARCHAR2(50)          not null,
    user_birthday       DATE                  not null,
    user_phone          VARCHAR2(15)          not null,
    user_email          VARCHAR2(30)          not null,
    borrowed            NUMBER(1)             not null,
    constraint PK_readers primary key (user_id)
);

create table books (
    book_id             INTEGER               not null,
    lib_id              INTEGER               not null,
    book_name           VARCHAR2(50)          not null,
    author              VARCHAR2(50)          not null,
    release_date        DATE                  not null,
    b_language          VARCHAR2(15)          not null,
    b_category          VARCHAR2(30)          not null,
    num_of_copies       INTEGER               not null,
    book_status         NUMBER(1)             not null,
    constraint PK_books primary key (book_id),
    constraint FK_books2 foreign key (lib_id) references libraries(lib_id)
);

create table loans (
    loan_id             INTEGER               not null,
    book_id             INTEGER               not null,
    user_id             INTEGER               not null,
    lib_id              INTEGER               not null,
    loan_status         NUMBER(1)             not null,
    due_date            DATE                  not null,
    return_date         DATE                  not null,
    late_return         NUMBER(1)             not null,
    constraint uniques unique (loan_id, book_id, user_id, lib_id),
    constraint PK_loans primary key (loan_id),
    constraint FK_loans1 foreign key (book_id) references books(book_id),
    constraint FK_loans2 foreign key (user_id) references readers(user_id),
    constraint FK_loans3 foreign key (lib_id) references libraries(lib_id)
);

-- dropping sequences lib_seq and emp_seq
drop sequence lib_seq;
drop sequence emp_seq;
drop sequence book_seq;
drop sequence reader_seq;
drop sequence loan_seq;

-- creating sequences for lib_id and emp_id
create sequence lib_seq start with 1 increment by 1;
create sequence emp_seq start with 100 increment by 1;
create sequence book_seq start with 150 increment by 1;
create sequence reader_seq start with 200 increment by 1;
create sequence loan_seq start with 250 increment by 1;

-- inserting data into libraries (20)
insert into libraries (lib_id, lib_name, reg_num, reg_date, lib_address) values (lib_seq.NEXTVAL, 'Library 1', 1234, TO_DATE('2023-01-01', 'YYYY-MM-DD'), 'Address 1');
insert into libraries (lib_id, lib_name, reg_num, reg_date, lib_address) values (lib_seq.NEXTVAL, 'Library 2', 5678, TO_DATE('2023-02-01', 'YYYY-MM-DD'), 'Address 2');
insert into libraries (lib_id, lib_name, reg_num, reg_date, lib_address) values (lib_seq.NEXTVAL, 'Library 3', 9876, TO_DATE('2023-03-01', 'YYYY-MM-DD'), 'Address 3');
insert into libraries (lib_id, lib_name, reg_num, reg_date, lib_address) values (lib_seq.NEXTVAL, 'Library 4', 5432, TO_DATE('2023-04-01', 'YYYY-MM-DD'), 'Address 4');
insert into libraries (lib_id, lib_name, reg_num, reg_date, lib_address) values (lib_seq.NEXTVAL, 'Library 5', 2468, TO_DATE('2023-05-01', 'YYYY-MM-DD'), 'Address 5');
insert into libraries (lib_id, lib_name, reg_num, reg_date, lib_address) values (lib_seq.NEXTVAL, 'Library 6', 1357, TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'Address 6');
insert into libraries (lib_id, lib_name, reg_num, reg_date, lib_address) values (lib_seq.NEXTVAL, 'Library 7', 8642, TO_DATE('2023-07-01', 'YYYY-MM-DD'), 'Address 7');
insert into libraries (lib_id, lib_name, reg_num, reg_date, lib_address) values (lib_seq.NEXTVAL, 'Library 8', 9753, TO_DATE('2023-08-01', 'YYYY-MM-DD'), 'Address 8');
insert into libraries (lib_id, lib_name, reg_num, reg_date, lib_address) values (lib_seq.NEXTVAL, 'Library 9', 7418, TO_DATE('2023-09-01', 'YYYY-MM-DD'), 'Address 9');
insert into libraries (lib_id, lib_name, reg_num, reg_date, lib_address) values (lib_seq.NEXTVAL, 'Library 10', 3698, TO_DATE('2023-10-01', 'YYYY-MM-DD'), 'Address 10');
insert into libraries (lib_id, lib_name, reg_num, reg_date, lib_address) values (lib_seq.NEXTVAL, 'Library 11', 8025, TO_DATE('2023-11-01', 'YYYY-MM-DD'), 'Address 11');
insert into libraries (lib_id, lib_name, reg_num, reg_date, lib_address) values (lib_seq.NEXTVAL, 'Library 12', 1593, TO_DATE('2023-12-01', 'YYYY-MM-DD'), 'Address 12');
insert into libraries (lib_id, lib_name, reg_num, reg_date, lib_address) values (lib_seq.NEXTVAL, 'Library 13', 6809, TO_DATE('2024-01-01', 'YYYY-MM-DD'), 'Address 13');
insert into libraries (lib_id, lib_name, reg_num, reg_date, lib_address) values (lib_seq.NEXTVAL, 'Library 14', 2367, TO_DATE('2024-02-01', 'YYYY-MM-DD'), 'Address 14');
insert into libraries (lib_id, lib_name, reg_num, reg_date, lib_address) values (lib_seq.NEXTVAL, 'Library 15', 8956, TO_DATE('2024-03-01', 'YYYY-MM-DD'), 'Address 15');
insert into libraries (lib_id, lib_name, reg_num, reg_date, lib_address) values (lib_seq.NEXTVAL, 'Library 16', 4123, TO_DATE('2024-04-01', 'YYYY-MM-DD'), 'Address 16');
insert into libraries (lib_id, lib_name, reg_num, reg_date, lib_address) values (lib_seq.NEXTVAL, 'Library 17', 7890, TO_DATE('2024-05-01', 'YYYY-MM-DD'), 'Address 17');
insert into libraries (lib_id, lib_name, reg_num, reg_date, lib_address) values (lib_seq.NEXTVAL, 'Library 18', 4567, TO_DATE('2024-06-01', 'YYYY-MM-DD'), 'Address 18');
insert into libraries (lib_id, lib_name, reg_num, reg_date, lib_address) values (lib_seq.NEXTVAL, 'Library 19', 1234, TO_DATE('2024-07-01', 'YYYY-MM-DD'), 'Address 19');
insert into libraries (lib_id, lib_name, reg_num, reg_date, lib_address) values (lib_seq.NEXTVAL, 'Library 20', 7890, TO_DATE('2024-08-01', 'YYYY-MM-DD'), 'Address 20');

-- inserting data into employees (35)
insert into employees (emp_id, lib_id, emp_full_name, emp_birthday, emp_phone, emp_email, emp_address, start_date) values (emp_seq.NEXTVAL, 1, 'Jamila Rahimova', TO_DATE('2007-07-12', 'YYYY-MM-DD'), '123456789', 'jamila.rahimova@example.com', 'Address 1', TO_DATE('2023-05-15', 'YYYY-MM-DD'));
insert into employees (emp_id, lib_id, emp_full_name, emp_birthday, emp_phone, emp_email, emp_address, start_date) values (emp_seq.NEXTVAL, 2, 'Khai Smith', TO_DATE('1995-02-01', 'YYYY-MM-DD'), '987654321', 'khai.smith@example.com', 'Address 2', TO_DATE('2021-02-01', 'YYYY-MM-DD'));
insert into employees (emp_id, lib_id, emp_full_name, emp_birthday, emp_phone, emp_email, emp_address, start_date) values (emp_seq.NEXTVAL, 4, 'Khanim Sultanova', TO_DATE('1980-11-01', 'YYYY-MM-DD'), '5551234', 'khanim.sultanova@example.com', 'Address 3', TO_DATE('2018-03-15', 'YYYY-MM-DD'));
insert into employees (emp_id, lib_id, emp_full_name, emp_birthday, emp_phone, emp_email, emp_address, start_date) values (emp_seq.NEXTVAL, 5, 'Farah Duman', TO_DATE('1992-11-22', 'YYYY-MM-DD'), '5559876', 'farah.duman@example.com', 'Address 4', TO_DATE('2020-05-10', 'YYYY-MM-DD'));
insert into employees (emp_id, lib_id, emp_full_name, emp_birthday, emp_phone, emp_email, emp_address, start_date) values (emp_seq.NEXTVAL, 1, 'Emily Davis', TO_DATE('1997-05-18', 'YYYY-MM-DD'), '5555432', 'emily.davis@example.com', 'Address 5', TO_DATE('2022-01-02', 'YYYY-MM-DD'));
insert into employees (emp_id, lib_id, emp_full_name, emp_birthday, emp_phone, emp_email, emp_address, start_date) values (emp_seq.NEXTVAL, 4, 'John Smith', TO_DATE('1990-03-15', 'YYYY-MM-DD'), '+372 26441211', 'john.smith@gmail.com', 'Address 1', TO_DATE('2018-01-15', 'YYYY-MM-DD'));
insert into employees (emp_id, lib_id, emp_full_name, emp_birthday, emp_phone, emp_email, emp_address, start_date) values (emp_seq.NEXTVAL, 3,  'Emily Boland', TO_DATE('1992-07-22', 'YYYY-MM-DD'), '+372 26653298', 'emily.boland@gmail.com', 'Address 2', TO_DATE('2020-03-10', 'YYYY-MM-DD'));
insert into employees (emp_id, lib_id, emp_full_name, emp_birthday, emp_phone, emp_email, emp_address, start_date) values (emp_seq.NEXTVAL, 2, 'Michael Davis', TO_DATE('1988-05-11', 'YYYY-MM-DD'), '+372 26987453', 'michael.davis@gmail.com', 'Address 3', TO_DATE('2015-09-05', 'YYYY-MM-DD'));
insert into employees (emp_id, lib_id, emp_full_name, emp_birthday, emp_phone, emp_email, emp_address, start_date) values (emp_seq.NEXTVAL, 4, 'Sophia Anderson', TO_DATE('1994-11-08', 'YYYY-MM-DD'), '+372 26123789', 'sophia.anderson@gmail.com', 'Address 4', TO_DATE('2019-12-20', 'YYYY-MM-DD'));
insert into employees (emp_id, lib_id, emp_full_name, emp_birthday, emp_phone, emp_email, emp_address, start_date) values (emp_seq.NEXTVAL, 5, 'Daniel Martinez', TO_DATE('1987-02-04', 'YYYY-MM-DD'), '+372 26546789', 'daniel.martinez@gmail.com', 'Address 5', TO_DATE('2016-06-08', 'YYYY-MM-DD'));
insert into employees (emp_id, lib_id, emp_full_name, emp_birthday, emp_phone, emp_email, emp_address, start_date) values (emp_seq.NEXTVAL, 3, 'Olivia Thompson', TO_DATE('1991-09-12', 'YYYY-MM-DD'), '+372 26852147', 'olivia.thompson@gmail.com', 'Address 6', TO_DATE('2021-02-28', 'YYYY-MM-DD'));
insert into employees (emp_id, lib_id, emp_full_name, emp_birthday, emp_phone, emp_email, emp_address, start_date) values (emp_seq.NEXTVAL, 1, 'William Wilson', TO_DATE('1990-04-30', 'YYYY-MM-DD'), '+372 26358741', 'william.wilson@gmail.com', 'Address 7', TO_DATE('2017-06-12', 'YYYY-MM-DD'));
insert into employees (emp_id, lib_id, emp_full_name, emp_birthday, emp_phone, emp_email, emp_address, start_date) values (emp_seq.NEXTVAL, 3, 'Ava Garcia', TO_DATE('1993-01-19', 'YYYY-MM-DD'), '+372 26235487', 'ava.garcia@gmail.com', 'Address 8', TO_DATE('2019-09-18', 'YYYY-MM-DD'));
insert into employees (emp_id, lib_id, emp_full_name, emp_birthday, emp_phone, emp_email, emp_address, start_date) values (emp_seq.NEXTVAL, 2, 'Sophia Vergara', TO_DATE('1989-08-07', 'YYYY-MM-DD'), '+372 26698523', 'sophia.vergara@gmail.com', 'Address 9', TO_DATE('2018-04-10', 'YYYY-MM-DD'));
insert into employees (emp_id, lib_id, emp_full_name, emp_birthday, emp_phone, emp_email, emp_address, start_date) values (emp_seq.NEXTVAL, 5, 'Anar Rahimov', TO_DATE('1979-08-04', 'YYYY-MM-DD'), '+372 26698523', 'anar.rahimov@gmail.com', 'Address 9', TO_DATE('2018-04-10', 'YYYY-MM-DD'));
insert into employees (emp_id, lib_id, emp_full_name, emp_birthday, emp_phone, emp_email, emp_address, start_date) values (emp_seq.NEXTVAL, 5, 'Sophie Roberts', TO_DATE('1994-08-12', 'YYYY-MM-DD'), '5554444', 'sophie.roberts@example.com', 'Address 9', TO_DATE('2022-04-01', 'YYYY-MM-DD'));
insert into employees (emp_id, lib_id, emp_full_name, emp_birthday, emp_phone, emp_email, emp_address, start_date) values (emp_seq.NEXTVAL, 6, 'Adam Wilson', TO_DATE('1991-03-05', 'YYYY-MM-DD'), '5555555', 'adam.wilson@example.com', 'Address 10', TO_DATE('2023-02-15', 'YYYY-MM-DD'));
insert into employees (emp_id, lib_id, emp_full_name, emp_birthday, emp_phone, emp_email, emp_address, start_date) values (emp_seq.NEXTVAL, 7, 'Oliver Thompson', TO_DATE('1989-11-18', 'YYYY-MM-DD'), '5556666', 'oliver.thompson@example.com', 'Address 11', TO_DATE('2019-09-30', 'YYYY-MM-DD'));
insert into employees (emp_id, lib_id, emp_full_name, emp_birthday, emp_phone, emp_email, emp_address, start_date) values (emp_seq.NEXTVAL, 8, 'Isabella Davis', TO_DATE('1993-07-25', 'YYYY-MM-DD'), '5557777', 'isabella.davis@example.com', 'Address 12', TO_DATE('2021-05-10', 'YYYY-MM-DD'));
insert into employees (emp_id, lib_id, emp_full_name, emp_birthday, emp_phone, emp_email, emp_address, start_date) values (emp_seq.NEXTVAL, 9, 'Mason Johnson', TO_DATE('1990-09-08', 'YYYY-MM-DD'), '5558888', 'mason.johnson@example.com', 'Address 13', TO_DATE('2018-11-20', 'YYYY-MM-DD'));
insert into employees (emp_id, lib_id, emp_full_name, emp_birthday, emp_phone, emp_email, emp_address, start_date) values (emp_seq.NEXTVAL, 10, 'Mia Thompson', TO_DATE('1994-05-14', 'YYYY-MM-DD'), '5559999', 'mia.thompson@example.com', 'Address 14', TO_DATE('2020-07-01', 'YYYY-MM-DD'));
insert into employees (emp_id, lib_id, emp_full_name, emp_birthday, emp_phone, emp_email, emp_address, start_date) values (emp_seq.NEXTVAL, 11, 'Ethan Wilson', TO_DATE('1987-02-26', 'YYYY-MM-DD'), '5551010', 'ethan.wilson@example.com', 'Address 15', TO_DATE('2017-03-15', 'YYYY-MM-DD'));
insert into employees (emp_id, lib_id, emp_full_name, emp_birthday, emp_phone, emp_email, emp_address, start_date) values (emp_seq.NEXTVAL, 12, 'Amelia Smith', TO_DATE('1992-10-21', 'YYYY-MM-DD'), '5551212', 'amelia.smith@example.com', 'Address 16', TO_DATE('2019-02-05', 'YYYY-MM-DD'));
insert into employees (emp_id, lib_id, emp_full_name, emp_birthday, emp_phone, emp_email, emp_address, start_date) values (emp_seq.NEXTVAL, 13, 'Henry Johnson', TO_DATE('1991-12-15', 'YYYY-MM-DD'), '5551313', 'henry.johnson@example.com', 'Address 17', TO_DATE('2022-09-10', 'YYYY-MM-DD'));
insert into employees (emp_id, lib_id, emp_full_name, emp_birthday, emp_phone, emp_email, emp_address, start_date) values (emp_seq.NEXTVAL, 14, 'Charlotte Davis', TO_DATE('1993-04-03', 'YYYY-MM-DD'), '5551414', 'charlotte.davis@example.com', 'Address 18', TO_DATE('2021-01-20', 'YYYY-MM-DD'));
insert into employees (emp_id, lib_id, emp_full_name, emp_birthday, emp_phone, emp_email, emp_address, start_date) values (emp_seq.NEXTVAL, 15, 'Sebastian Wilson', TO_DATE('1988-09-27', 'YYYY-MM-DD'), '5551515', 'sebastian.wilson@example.com', 'Address 19', TO_DATE('2018-07-05', 'YYYY-MM-DD'));
insert into employees (emp_id, lib_id, emp_full_name, emp_birthday, emp_phone, emp_email, emp_address, start_date) values (emp_seq.NEXTVAL, 16, 'Scarlett Thompson', TO_DATE('1995-06-08', 'YYYY-MM-DD'), '5551616', 'scarlett.thompson@example.com', 'Address 20', TO_DATE('2020-03-18', 'YYYY-MM-DD'));
insert into employees (emp_id, lib_id, emp_full_name, emp_birthday, emp_phone, emp_email, emp_address, start_date) values (emp_seq.NEXTVAL, 17, 'Jack Davis', TO_DATE('1989-03-12', 'YYYY-MM-DD'), '5551717', 'jack.davis@example.com', 'Address 21', TO_DATE('2017-10-01', 'YYYY-MM-DD'));
insert into employees (emp_id, lib_id, emp_full_name, emp_birthday, emp_phone, emp_email, emp_address, start_date) values (emp_seq.NEXTVAL, 18, 'Lily Wilson', TO_DATE('1992-11-23', 'YYYY-MM-DD'), '5551818', 'lily.wilson@example.com', 'Address 22', TO_DATE('2019-08-15', 'YYYY-MM-DD'));
insert into employees (emp_id, lib_id, emp_full_name, emp_birthday, emp_phone, emp_email, emp_address, start_date) values (emp_seq.NEXTVAL, 19, 'Owen Smith', TO_DATE('1990-02-05', 'YYYY-MM-DD'), '5551919', 'owen.smith@example.com', 'Address 23', TO_DATE('2018-04-30', 'YYYY-MM-DD'));
insert into employees (emp_id, lib_id, emp_full_name, emp_birthday, emp_phone, emp_email, emp_address, start_date) values (emp_seq.NEXTVAL, 20, 'Emily Johnson', TO_DATE('1994-01-17', 'YYYY-MM-DD'), '5552020', 'emily.johnson@example.com', 'Address 24', TO_DATE('2022-12-01', 'YYYY-MM-DD'));
insert into employees (emp_id, lib_id, emp_full_name, emp_birthday, emp_phone, emp_email, emp_address, start_date) values (emp_seq.NEXTVAL, 5, 'Daniel Davis', TO_DATE('1987-07-20', 'YYYY-MM-DD'), '5552121', 'daniel.davis@example.com', 'Address 25', TO_DATE('2017-06-15', 'YYYY-MM-DD'));
insert into employees (emp_id, lib_id, emp_full_name, emp_birthday, emp_phone, emp_email, emp_address, start_date) values (emp_seq.NEXTVAL, 6, 'Grace Thompson', TO_DATE('1993-09-30', 'YYYY-MM-DD'), '5552222', 'grace.thompson@example.com', 'Address 26', TO_DATE('2021-04-01', 'YYYY-MM-DD'));
insert into employees (emp_id, lib_id, emp_full_name, emp_birthday, emp_phone, emp_email, emp_address, start_date) values (emp_seq.NEXTVAL, 7, 'Samuel Wilson', TO_DATE('1990-11-10', 'YYYY-MM-DD'), '5552323', 'samuel.wilson@example.com', 'Address 27', TO_DATE('2018-11-15', 'YYYY-MM-DD'));
insert into employees (emp_id, lib_id, emp_full_name, emp_birthday, emp_phone, emp_email, emp_address, start_date) values (emp_seq.NEXTVAL, 8, 'Sofia Davis', TO_DATE('1994-03-25', 'YYYY-MM-DD'), '5552424', 'sofia.davis@example.com', 'Address 28', TO_DATE('2020-07-30', 'YYYY-MM-DD'));

-- inserting data into books (28)
insert into books (book_id, lib_id, book_name, author, release_date, b_language, b_category, num_of_copies, book_status) values (book_seq.NEXTVAL, 1, 'The Shadow of Destiny', 'Emma Williams', TO_DATE('2020-03-15', 'YYYY-MM-DD'), 'English', 'Mystery', 3, 1);
insert into books (book_id, lib_id, book_name, author, release_date, b_language, b_category, num_of_copies, book_status) values (book_seq.NEXTVAL, 2, 'Echoes of the Past', 'Michael Thompson', TO_DATE('2018-08-22', 'YYYY-MM-DD'), 'English', 'Thriller', 5, 1);
insert into books (book_id, lib_id, book_name, author, release_date, b_language, b_category, num_of_copies, book_status) values (book_seq.NEXTVAL, 3, 'The Silent Witness', 'Sarah Johnson', TO_DATE('2019-06-10', 'YYYY-MM-DD'), 'English', 'Suspense', 2, 1);
insert into books (book_id, lib_id, book_name, author, release_date, b_language, b_category, num_of_copies, book_status) values (book_seq.NEXTVAL, 4, 'Hidden Secrets', 'David Brown', TO_DATE('2021-01-05', 'YYYY-MM-DD'), 'English', 'Drama', 1, 1);
insert into books (book_id, lib_id, book_name, author, release_date, b_language, b_category, num_of_copies, book_status) values (book_seq.NEXTVAL, 5, 'Beyond the Horizon', 'Jennifer Davis', TO_DATE('2017-11-18', 'YYYY-MM-DD'), 'English', 'Romance', 4, 1);
insert into books (book_id, lib_id, book_name, author, release_date, b_language, b_category, num_of_copies, book_status) values (book_seq.NEXTVAL, 6, 'The Lost Symbol', 'Dan Brown', TO_DATE('2009-09-15', 'YYYY-MM-DD'), 'English', 'Thriller', 2, 1);
insert into books (book_id, lib_id, book_name, author, release_date, b_language, b_category, num_of_copies, book_status) values (book_seq.NEXTVAL, 7, 'To Kill a Mockingbird', 'Harper Lee', TO_DATE('1960-07-11', 'YYYY-MM-DD'), 'English', 'Classic', 3, 1);
insert into books (book_id, lib_id, book_name, author, release_date, b_language, b_category, num_of_copies, book_status) values (book_seq.NEXTVAL, 8, 'Pride and Prejudice', 'Jane Austen', TO_DATE('1813-01-28', 'YYYY-MM-DD'), 'English', 'Classic', 4, 1);
insert into books (book_id, lib_id, book_name, author, release_date, b_language, b_category, num_of_copies, book_status) values (book_seq.NEXTVAL, 9, '1984', 'George Orwell', TO_DATE('1949-06-08', 'YYYY-MM-DD'), 'English', 'Dystopian', 1, 1);
insert into books (book_id, lib_id, book_name, author, release_date, b_language, b_category, num_of_copies, book_status) values (book_seq.NEXTVAL, 10, 'The Great Gatsby', 'F. Scott Fitzgerald', TO_DATE('1925-04-10', 'YYYY-MM-DD'), 'English', 'Classic', 2, 1);
insert into books (book_id, lib_id, book_name, author, release_date, b_language, b_category, num_of_copies, book_status) values (book_seq.NEXTVAL, 11, 'The Hobbit', 'J.R.R. Tolkien', TO_DATE('1937-09-21', 'YYYY-MM-DD'), 'English', 'Fantasy', 3, 1);
insert into books (book_id, lib_id, book_name, author, release_date, b_language, b_category, num_of_copies, book_status) values (book_seq.NEXTVAL, 12, 'The Catcher in the Rye', 'J.D. Salinger', TO_DATE('1951-07-16', 'YYYY-MM-DD'), 'English', 'Coming-of-Age', 2, 1);
insert into books (book_id, lib_id, book_name, author, release_date, b_language, b_category, num_of_copies, book_status) values (book_seq.NEXTVAL, 13, 'To Kill a Kingdom', 'Alexandra Christo', TO_DATE('2018-03-06', 'YYYY-MM-DD'), 'English', 'Fantasy', 1, 1);
insert into books (book_id, lib_id, book_name, author, release_date, b_language, b_category, num_of_copies, book_status) values (book_seq.NEXTVAL, 14, 'The Alchemist', 'Paulo Coelho', TO_DATE('1988-01-01', 'YYYY-MM-DD'), 'English', 'Fiction', 3, 1);
insert into books (book_id, lib_id, book_name, author, release_date, b_language, b_category, num_of_copies, book_status) values (book_seq.NEXTVAL, 15, 'The Da Vinci Code', 'Dan Brown', TO_DATE('2003-03-18', 'YYYY-MM-DD'), 'English', 'Thriller', 2, 1);
insert into books (book_id, lib_id, book_name, author, release_date, b_language, b_category, num_of_copies, book_status) values (book_seq.NEXTVAL, 16, 'Harry Potter and the Philosopher''s Stone', 'J.K. Rowling', TO_DATE('1997-06-26', 'YYYY-MM-DD'), 'English', 'Fantasy', 4, 1);
insert into books (book_id, lib_id, book_name, author, release_date, b_language, b_category, num_of_copies, book_status) values (book_seq.NEXTVAL, 17, 'The Hunger Games', 'Suzanne Collins', TO_DATE('2008-09-14', 'YYYY-MM-DD'), 'English', 'Dystopian', 3, 1);
insert into books (book_id, lib_id, book_name, author, release_date, b_language, b_category, num_of_copies, book_status) values (book_seq.NEXTVAL, 18, 'The Lord of the Rings', 'J.R.R. Tolkien', TO_DATE('1954-07-29', 'YYYY-MM-DD'), 'English', 'Fantasy', 5, 1);
insert into books (book_id, lib_id, book_name, author, release_date, b_language, b_category, num_of_copies, book_status) values (book_seq.NEXTVAL, 19, 'The Fault in Our Stars', 'John Green', TO_DATE('2012-01-10', 'YYYY-MM-DD'), 'English', 'Young Adult', 2, 1);
insert into books (book_id, lib_id, book_name, author, release_date, b_language, b_category, num_of_copies, book_status) values (book_seq.NEXTVAL, 20, 'Gone Girl', 'Gillian Flynn', TO_DATE('2012-06-05', 'YYYY-MM-DD'), 'English', 'Mystery', 1, 1);
insert into books (book_id, lib_id, book_name, author, release_date, b_language, b_category, num_of_copies, book_status) values (book_seq.NEXTVAL, 1, 'The Girl on the Train', 'Paula Hawkins', TO_DATE('2015-01-13', 'YYYY-MM-DD'), 'English', 'Thriller', 3, 1);
insert into books (book_id, lib_id, book_name, author, release_date, b_language, b_category, num_of_copies, book_status) values (book_seq.NEXTVAL, 2, 'The Chronicles of Narnia', 'C.S. Lewis', TO_DATE('1950-10-16', 'YYYY-MM-DD'), 'English', 'Fantasy', 4, 1);
insert into books (book_id, lib_id, book_name, author, release_date, b_language, b_category, num_of_copies, book_status) values (book_seq.NEXTVAL, 3, 'The Kite Runner', 'Khaled Hosseini', TO_DATE('2003-05-29', 'YYYY-MM-DD'), 'English', 'Historical Fiction', 2, 1);
insert into books (book_id, lib_id, book_name, author, release_date, b_language, b_category, num_of_copies, book_status) values (book_seq.NEXTVAL, 4, 'The Help', 'Kathryn Stockett', TO_DATE('2009-02-10', 'YYYY-MM-DD'), 'English', 'Historical Fiction', 3, 1);
insert into books (book_id, lib_id, book_name, author, release_date, b_language, b_category, num_of_copies, book_status) values (book_seq.NEXTVAL, 5, 'The Girl with the Dragon Tattoo', 'Stieg Larsson', TO_DATE('2005-08-01', 'YYYY-MM-DD'), 'English', 'Mystery', 1, 1);
insert into books (book_id, lib_id, book_name, author, release_date, b_language, b_category, num_of_copies, book_status) values (book_seq.NEXTVAL, 6, 'The Maze Runner', 'James Dashner', TO_DATE('2009-10-06', 'YYYY-MM-DD'), 'English', 'Science Fiction', 2, 1);
insert into books (book_id, lib_id, book_name, author, release_date, b_language, b_category, num_of_copies, book_status) values (book_seq.NEXTVAL, 7, 'The Book Thief', 'Markus Zusak', TO_DATE('2005-03-14', 'YYYY-MM-DD'), 'English', 'Historical Fiction', 3, 1);
insert into books (book_id, lib_id, book_name, author, release_date, b_language, b_category, num_of_copies, book_status) values (book_seq.NEXTVAL, 8, 'The Lovely Bones', 'Alice Sebold', TO_DATE('2002-07-03', 'YYYY-MM-DD'), 'English', 'Mystery', 1, 1);

-- inserting data into readers (26)
insert into readers (user_id, user_full_name, user_birthday, user_phone, user_email, borrowed) values (reader_seq.nextval, 'Jamila Rahimova', TO_DATE('2007-07-12', 'YYYY-MM-DD'), '1234567890', 'jamila@example.com', 1);
insert into readers (user_id, user_full_name, user_birthday, user_phone, user_email, borrowed) values (reader_seq.nextval, 'Khanim Sultanova', TO_DATE('1979-11-01', 'YYYY-MM-DD'), '9876543210', 'khanim@example.com', 1);
insert into readers (user_id, user_full_name, user_birthday, user_phone, user_email, borrowed) values (reader_seq.nextval, 'John Doe', TO_DATE('1990-05-15', 'YYYY-MM-DD'), '5551234567', 'john.doe@example.com', 0);
insert into readers (user_id, user_full_name, user_birthday, user_phone, user_email, borrowed) values (reader_seq.nextval, 'Emily Smith', TO_DATE('1985-12-18', 'YYYY-MM-DD'), '5559876543', 'emily.smith@example.com', 0);
insert into readers (user_id, user_full_name, user_birthday, user_phone, user_email, borrowed) values (reader_seq.nextval, 'David Johnson', TO_DATE('1993-08-04', 'YYYY-MM-DD'), '5552345678', 'david.johnson@example.com', 1);
insert into readers (user_id, user_full_name, user_birthday, user_phone, user_email, borrowed) values (reader_seq.nextval, 'Sophia Brown', TO_DATE('1988-03-22', 'YYYY-MM-DD'), '5558765432', 'sophia.brown@example.com', 0);
insert into readers (user_id, user_full_name, user_birthday, user_phone, user_email, borrowed) values (reader_seq.nextval, 'Michael Wilson', TO_DATE('1976-09-10', 'YYYY-MM-DD'), '5553456789', 'michael.wilson@example.com', 0);
insert into readers (user_id, user_full_name, user_birthday, user_phone, user_email, borrowed) values (reader_seq.nextval, 'Olivia Anderson', TO_DATE('1995-02-28', 'YYYY-MM-DD'), '5557654321', 'olivia.anderson@example.com', 0);
insert into readers (user_id, user_full_name, user_birthday, user_phone, user_email, borrowed) values (reader_seq.nextval, 'Daniel Martinez', TO_DATE('1982-06-09', 'YYYY-MM-DD'), '5554567890', 'daniel.martinez@example.com', 0);
insert into readers (user_id, user_full_name, user_birthday, user_phone, user_email, borrowed) values (reader_seq.nextval, 'Ava Taylor', TO_DATE('1998-11-27', 'YYYY-MM-DD'), '5559876543', 'ava.taylor@example.com', 0);
insert into readers (user_id, user_full_name, user_birthday, user_phone, user_email, borrowed) values (reader_seq.nextval, 'James Wilson', TO_DATE('1991-04-13', 'YYYY-MM-DD'), '5552345678', 'james.wilson@example.com', 1);
insert into readers (user_id, user_full_name, user_birthday, user_phone, user_email, borrowed) values (reader_seq.nextval, 'Mia Thompson', TO_DATE('1994-12-06', 'YYYY-MM-DD'), '5558765432', 'mia.thompson@example.com', 0);
insert into readers (user_id, user_full_name, user_birthday, user_phone, user_email, borrowed) values (reader_seq.nextval, 'Benjamin Harris', TO_DATE('1987-08-19', 'YYYY-MM-DD'), '5553456789', 'benjamin.harris@example.com', 0);
insert into readers (user_id, user_full_name, user_birthday, user_phone, user_email, borrowed) values (reader_seq.nextval, 'Charlotte Davis', TO_DATE('1999-03-04', 'YYYY-MM-DD'), '5557654321', 'charlotte.davis@example.com', 1);
insert into readers (user_id, user_full_name, user_birthday, user_phone, user_email, borrowed) values (reader_seq.nextval, 'Alexander Moore', TO_DATE('1983-06-22', 'YYYY-MM-DD'), '5551234567', 'alexander.moore@example.com', 0);
insert into readers (user_id, user_full_name, user_birthday, user_phone, user_email, borrowed) values (reader_seq.nextval, 'Emma Johnson', TO_DATE('1992-09-10', 'YYYY-MM-DD'), '5559876543', 'emma.johnson@example.com', 0);
insert into readers (user_id, user_full_name, user_birthday, user_phone, user_email, borrowed) values (reader_seq.nextval, 'Noah Davis', TO_DATE('1985-02-28', 'YYYY-MM-DD'), '5552345678', 'noah.davis@example.com', 0);
insert into readers (user_id, user_full_name, user_birthday, user_phone, user_email, borrowed) values (reader_seq.nextval, 'Sophia Wilson', TO_DATE('1979-04-13', 'YYYY-MM-DD'), '5558765432', 'sophia.wilson@example.com', 0);
insert into readers (user_id, user_full_name, user_birthday, user_phone, user_email, borrowed) values (reader_seq.nextval, 'Ethan Thompson', TO_DATE('1997-11-06', 'YYYY-MM-DD'), '5553456789', 'ethan.thompson@example.com', 1);
insert into readers (user_id, user_full_name, user_birthday, user_phone, user_email, borrowed) values (reader_seq.nextval, 'Isabella Anderson', TO_DATE('1990-08-19', 'YYYY-MM-DD'), '5557654321', 'isabella.anderson@example.com', 1);
insert into readers (user_id, user_full_name, user_birthday, user_phone, user_email, borrowed) values (reader_seq.nextval, 'Jameson Martinez', TO_DATE('1988-03-04', 'YYYY-MM-DD'), '5552345678', 'jameson.martinez@example.com', 0);
insert into readers (user_id, user_full_name, user_birthday, user_phone, user_email, borrowed) values (reader_seq.nextval, 'Mila Taylor', TO_DATE('1993-06-09', 'YYYY-MM-DD'), '5559876543', 'mila.taylor@example.com', 0);
insert into readers (user_id, user_full_name, user_birthday, user_phone, user_email, borrowed) values (reader_seq.nextval, 'Benjamin Smith', TO_DATE('1995-11-27', 'YYYY-MM-DD'), '5558765432', 'benjamin.smith@example.com', 0);
insert into readers (user_id, user_full_name, user_birthday, user_phone, user_email, borrowed) values (reader_seq.nextval, 'Avery Johnson', TO_DATE('1989-04-13', 'YYYY-MM-DD'), '5552345678', 'avery.johnson@example.com', 1);
insert into readers (user_id, user_full_name, user_birthday, user_phone, user_email, borrowed) values (reader_seq.nextval, 'Scarlett Thompson', TO_DATE('1994-12-06', 'YYYY-MM-DD'), '5553456789', 'scarlett.thompson@example.com', 0);
insert into readers (user_id, user_full_name, user_birthday, user_phone, user_email, borrowed) values (reader_seq.nextval, 'Henry Wilson', TO_DATE('1991-08-19', 'YYYY-MM-DD'), '5557654321', 'henry.wilson@example.com', 1);

-- inserting data into loans (29)
insert into loans (loan_id, book_id, user_id, lib_id, loan_status, due_date, return_date, late_return) values (loan_seq.nextval, 150, 200, 1, 0, TO_DATE('2023-06-25', 'YYYY-MM-DD'), TO_DATE('2023-06-26', 'YYYY-MM-DD'), 0);
insert into loans (loan_id, book_id, user_id, lib_id, loan_status, due_date, return_date, late_return) values (loan_seq.nextval, 151, 201, 2, 0, TO_DATE('2023-06-25', 'YYYY-MM-DD'), TO_DATE('2023-06-25', 'YYYY-MM-DD'), 0);
insert into loans (loan_id, book_id, user_id, lib_id, loan_status, due_date, return_date, late_return) values (loan_seq.nextval, 152, 202, 3, 1, TO_DATE('2023-06-25', 'YYYY-MM-DD'), TO_DATE('9999-12-31', 'YYYY-MM-DD'), 0);
insert into loans (loan_id, book_id, user_id, lib_id, loan_status, due_date, return_date, late_return) values (loan_seq.nextval, 153, 203, 4, 0, TO_DATE('2023-06-25', 'YYYY-MM-DD'), TO_DATE('2023-06-24', 'YYYY-MM-DD'), 1);
insert into loans (loan_id, book_id, user_id, lib_id, loan_status, due_date, return_date, late_return) values (loan_seq.nextval, 154, 204, 5, 0, TO_DATE('2023-06-25', 'YYYY-MM-DD'), TO_DATE('2023-06-30', 'YYYY-MM-DD'), 1);
insert into loans (loan_id, book_id, user_id, lib_id, loan_status, due_date, return_date, late_return) values (loan_seq.nextval, 155, 205, 6, 0, TO_DATE('2023-06-25', 'YYYY-MM-DD'), TO_DATE('2023-06-25', 'YYYY-MM-DD'), 0);
insert into loans (loan_id, book_id, user_id, lib_id, loan_status, due_date, return_date, late_return) values (loan_seq.nextval, 156, 206, 7, 1, TO_DATE('2023-06-25', 'YYYY-MM-DD'), TO_DATE('9999-12-31', 'YYYY-MM-DD'), 0);
insert into loans (loan_id, book_id, user_id, lib_id, loan_status, due_date, return_date, late_return) values (loan_seq.nextval, 157, 207, 8, 0, TO_DATE('2023-06-25', 'YYYY-MM-DD'), TO_DATE('2023-06-25', 'YYYY-MM-DD'), 0);
insert into loans (loan_id, book_id, user_id, lib_id, loan_status, due_date, return_date, late_return) values (loan_seq.nextval, 158, 208, 9, 0, TO_DATE('2023-06-25', 'YYYY-MM-DD'), TO_DATE('2023-06-25', 'YYYY-MM-DD'), 0);
insert into loans (loan_id, book_id, user_id, lib_id, loan_status, due_date, return_date, late_return) values (loan_seq.nextval, 159, 209, 10, 1, TO_DATE('2023-06-25', 'YYYY-MM-DD'), TO_DATE('9999-12-31', 'YYYY-MM-DD'), 0);
insert into loans (loan_id, book_id, user_id, lib_id, loan_status, due_date, return_date, late_return) values (loan_seq.nextval, 160, 210, 11, 0, TO_DATE('2023-06-25', 'YYYY-MM-DD'), TO_DATE('2023-06-25', 'YYYY-MM-DD'), 0);
insert into loans (loan_id, book_id, user_id, lib_id, loan_status, due_date, return_date, late_return) values (loan_seq.nextval, 161, 211, 12, 0, TO_DATE('2023-06-25', 'YYYY-MM-DD'), TO_DATE('2023-06-24', 'YYYY-MM-DD'), 1);
insert into loans (loan_id, book_id, user_id, lib_id, loan_status, due_date, return_date, late_return) values (loan_seq.nextval, 162, 212, 13, 0, TO_DATE('2023-06-25', 'YYYY-MM-DD'), TO_DATE('2023-06-30', 'YYYY-MM-DD'), 1);
insert into loans (loan_id, book_id, user_id, lib_id, loan_status, due_date, return_date, late_return) values (loan_seq.nextval, 163, 213, 14, 0, TO_DATE('2023-06-25', 'YYYY-MM-DD'), TO_DATE('2023-06-25', 'YYYY-MM-DD'), 0);
insert into loans (loan_id, book_id, user_id, lib_id, loan_status, due_date, return_date, late_return) values (loan_seq.nextval, 164, 214, 15, 1, TO_DATE('2023-06-25', 'YYYY-MM-DD'), TO_DATE('9999-12-31', 'YYYY-MM-DD'), 0);
insert into loans (loan_id, book_id, user_id, lib_id, loan_status, due_date, return_date, late_return) values (loan_seq.nextval, 165, 215, 16, 0, TO_DATE('2023-06-25', 'YYYY-MM-DD'), TO_DATE('2023-06-25', 'YYYY-MM-DD'), 0);
insert into loans (loan_id, book_id, user_id, lib_id, loan_status, due_date, return_date, late_return) values (loan_seq.nextval, 166, 216, 17, 0, TO_DATE('2023-06-25', 'YYYY-MM-DD'), TO_DATE('2023-06-25', 'YYYY-MM-DD'), 0);
insert into loans (loan_id, book_id, user_id, lib_id, loan_status, due_date, return_date, late_return) values (loan_seq.nextval, 167, 217, 18, 1, TO_DATE('2023-06-25', 'YYYY-MM-DD'), TO_DATE('9999-12-31', 'YYYY-MM-DD'), 0);
insert into loans (loan_id, book_id, user_id, lib_id, loan_status, due_date, return_date, late_return) values (loan_seq.nextval, 168, 218, 19, 0, TO_DATE('2023-06-25', 'YYYY-MM-DD'), TO_DATE('2023-06-25', 'YYYY-MM-DD'), 0);
insert into loans (loan_id, book_id, user_id, lib_id, loan_status, due_date, return_date, late_return) values (loan_seq.nextval, 169, 219, 20, 0, TO_DATE('2023-06-25', 'YYYY-MM-DD'), TO_DATE('2023-06-24', 'YYYY-MM-DD'), 1);
insert into loans (loan_id, book_id, user_id, lib_id, loan_status, due_date, return_date, late_return) values (loan_seq.nextval, 170, 220, 1, 0, TO_DATE('2023-06-25', 'YYYY-MM-DD'), TO_DATE('2023-06-30', 'YYYY-MM-DD'), 1);
insert into loans (loan_id, book_id, user_id, lib_id, loan_status, due_date, return_date, late_return) values (loan_seq.nextval, 171, 221, 2, 0, TO_DATE('2023-06-25', 'YYYY-MM-DD'), TO_DATE('2023-06-25', 'YYYY-MM-DD'), 0);
insert into loans (loan_id, book_id, user_id, lib_id, loan_status, due_date, return_date, late_return) values (loan_seq.nextval, 172, 222, 3, 1, TO_DATE('2023-06-25', 'YYYY-MM-DD'), TO_DATE('9999-12-31', 'YYYY-MM-DD'), 0);
insert into loans (loan_id, book_id, user_id, lib_id, loan_status, due_date, return_date, late_return) values (loan_seq.nextval, 173, 223, 4, 0, TO_DATE('2023-06-25', 'YYYY-MM-DD'), TO_DATE('2023-06-25', 'YYYY-MM-DD'), 0);
insert into loans (loan_id, book_id, user_id, lib_id, loan_status, due_date, return_date, late_return) values (loan_seq.nextval, 174, 224, 5, 0, TO_DATE('2023-06-25', 'YYYY-MM-DD'), TO_DATE('2023-06-25', 'YYYY-MM-DD'), 0);
insert into loans (loan_id, book_id, user_id, lib_id, loan_status, due_date, return_date, late_return) values (loan_seq.nextval, 175, 225, 6, 1, TO_DATE('2023-06-25', 'YYYY-MM-DD'), TO_DATE('9999-12-31', 'YYYY-MM-DD'), 0);
insert into loans (loan_id, book_id, user_id, lib_id, loan_status, due_date, return_date, late_return) values (loan_seq.nextval, 163, 220, 7, 0, TO_DATE('2023-06-25', 'YYYY-MM-DD'), TO_DATE('2023-06-25', 'YYYY-MM-DD'), 0);
insert into loans (loan_id, book_id, user_id, lib_id, loan_status, due_date, return_date, late_return) values (loan_seq.nextval, 174, 200, 8, 0, TO_DATE('2023-06-25', 'YYYY-MM-DD'), TO_DATE('2023-06-24', 'YYYY-MM-DD'), 1);
insert into loans (loan_id, book_id, user_id, lib_id, loan_status, due_date, return_date, late_return) values (loan_seq.nextval, 175, 201, 9, 0, TO_DATE('2023-06-25', 'YYYY-MM-DD'), TO_DATE('2023-06-30', 'YYYY-MM-DD'), 1);



-- 1. overwriting database table data
declare cursor c_overwrite is
    select loan_id, book_id, user_id, lib_id, due_date, return_date, late_return
    from loans;
    
begin
    -- removes all existing data
    execute immediate 'TRUNCATE TABLE loans';
    
    -- loops through the cursor and inserts data into loans
    for rec in c_overwrite
    loop
        insert into loans (loan_id, book_id, user_id, lib_id, due_date, return_date, late_return)
        values (rec.loan_id, rec.book_id, rec.user_id, rec.lib_id, rec.due_date, rec.return_date, rec.late_return);
    end loop;
end;

-- 2. creating a database trigger and testing its operation
-- dropping the trigger
drop trigger trigger_start_date;

-- creating the trigger
create or replace trigger trigger_start_date
before insert on employees
for each row
begin
    if :new.start_date is null then
        :new.start_date := SYSDATE;
    end if;
end;

-- testing the trigger
insert into employees (emp_id, lib_id, emp_full_name, emp_birthday, emp_phone, emp_email, emp_address, start_date) values (emp_seq.NEXTVAL, 8, 'Nuray Gurel', TO_DATE('1994-03-25', 'YYYY-MM-DD'), '5552427', 'nuray.gurel@example.com', 'Address 29', null);

select *
from employees
where emp_id = 135;

-- 3. creating function and procedure into sql with statement, testing its operation
-- dropping function and procedure
drop function calc_age;
drop procedure update_emp_email;

-- creating function and procedure
create or replace function calc_age(emp_birthday date) return number is
begin
    return floor((SYSDATE - emp_birthday) / 365);
end;

create or replace procedure update_emp_email(emp_id integer, new_email varchar2) as
begin
    update employees
    set emp_email = new_email
    where emp_id = update_emp_email.emp_id;
end;

-- testing function
with employee_data as (
    select emp_id, emp_full_name, emp_birthday, emp_email
    from employees
    where emp_id = 105)
select emp_id, emp_full_name, calc_age(emp_birthday) as employee_age
from employee_data;

-- testing procedure
begin
    update_emp_email(105, 'new.email@example.com');
end;

select *
from employees
where emp_id = 105;

-- 4. dynamic sql, dynamic pl/sql
declare
    table_name varchar2(30) := 'employees';
    my_statement varchar2(1000);
    emp_id integer := 127;
    emp_full_name varchar2(100);
    
    sum_result number;
begin
    my_statement := 'select emp_id, emp_full_name from ' || table_name || ' where emp_id = :id';
    execute immediate my_statement into emp_id, emp_full_name using emp_id;
    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || emp_id || ', Employee Name: ' || emp_full_name);
    
    my_statement := 'begin select sum(emp_id) into :result from ' || table_name || '; end;';
    execute immediate my_statement using out sum_result;
    DBMS_OUTPUT.PUT_LINE('Sum of emp_id in ' || table_name || ': ' || sum_result);
end;

  







-- start of home assignment 5

-- dropping views
drop view view1;
drop view view2;

-- creating views
create view view1 as select readers.user_full_name, readers.user_birthday, readers.borrowed, books.book_name
                     from readers
                     inner join loans on readers.user_id = loans.user_id
                     inner join books on loans.book_id = books.book_id;
                     
create view view2 as select libraries.lib_name, libraries.lib_address, count(loans.loan_id) as num_of_loans
                     from libraries
                     inner join loans on libraries.lib_id = loans.lib_id
                     group by libraries.lib_name, libraries.lib_address;

-- dropping materialized view
drop materialized view mview1;
drop materialized view mview2;

-- creating materialized views
create materialized view mview1 as select employees.emp_full_name, loans.loan_id, loans.book_id, loans.user_id
                                   from employees, libraries, loans
                                   where libraries.lib_id = loans.lib_id and employees.lib_id = libraries.lib_id;


create materialized view mview2 as select books.book_name, books.b_category, books.num_of_copies, count(loans.loan_id) as loan_count
                                   from books
                                   inner join loans on books.book_id = loans.book_id
                                   group by books.book_name, books.b_category, books.num_of_copies;

-- query 1
select book_name, num_of_copies as total_copies,
       case
           when (num_of_copies - loan_count) > 0 then 'available'
           else 'unavailable'
       end as availability,
       rank() over (order by loan_count desc) as loan_rank
from mview2
order by availability desc;

-- query 2
select book_name, num_of_copies,
       sum(num_of_copies) over (order by book_name)
       as running_total
from mview2;

-- query 3
select lib_name, lib_address, num_of_loans, level
from view2
where lib_name in('Library 12', 'Library 7')
start with num_of_loans = 1
connect by prior num_of_loans + 1 = num_of_loans
order by num_of_loans;

-- query 4
select distinct user_full_name, user_birthday,
       case
           when borrowed = 1 then 'has books on loan'
           when borrowed = 0 then 'no books on loan'
           else 'error'
       end as borrow_status
from view1
order by borrow_status, user_full_name desc;

-- query 5
with recursive as (
    select book_name, b_category
    from mview2
    where b_category = 'Fiction'
    union all
    select book_name, b_category
    from mview2
    where b_category = 'Mystery'
)
select *
from recursive;

-- query 6
select user_full_name, borrowed, rank() over(partition by borrowed
                                             order by user_full_name)
                                             as rank
from view1
where borrowed = 1
order by user_full_name desc;

-- query 7
select lib_name, lib_address, num_of_loans,
       dense_rank() over (order by num_of_loans desc) as loan_rank
from view2;

-- query 8
select book_name, num_of_copies, row_number() over (order by num_of_copies desc) as row_num,
       count(*) over (order by num_of_copies range between unbounded  preceding and current row) as cumulative
from mview2;

-- query 9
select book_name, num_of_copies, ntile(4) over(order by num_of_copies) as quartile
from mview2;

-- query 10
select book_name, num_of_copies, lag(num_of_copies) over (order by book_name) as prev_copies
from mview2;

--dropping dimension tables
drop table dim_library cascade constraints;
drop table dim_book cascade constraints;
drop table dim_user cascade constraints;

-- creating dimension tables
-- dimension table 1
create table dim_library as
select lib_id as library_id, lib_name as library_name, lib_address as library_address
from libraries;

-- dimension table 2
create table dim_book as
select book_id, book_name, author, b_category as category, lib_id as library_id
from books;

-- dimension table 3
create table dim_user as
select user_id, user_full_name, user_birthday, user_email
from readers;

--dropping fact table
drop table fact_loan cascade constraints;

-- creating fact table
create table fact_loan as
select loan_id, book_id, user_id, lib_id, due_date, return_date, late_return
from loans;

-- query 11
select lib_id, book_id, user_id
from fact_loan
group by cube (lib_id, book_id, user_id)
having lib_id is not null and book_id is not null and user_id is not null;

-- query 12
select lib_id, book_id, user_id, grouping(lib_id), grouping(book_id), grouping(user_id)
from fact_loan
group by grouping sets ((lib_id, book_id, user_id), (lib_id), (book_id), (user_id), ())
having lib_id is not null and book_id is not null and user_id is not null;

-- query 13
select *
from (select lib_id, book_id, user_id, late_return,
             row_number() over (partition by lib_id order by book_id desc) as rank
      from fact_loan)
where rank <= 5;

-- query 14
select dl.library_name, fl.late_return
from dim_library dl
inner join fact_loan fl on dl.library_id = fl.lib_id
group by dl.library_name, fl.late_return
order by library_name;

-- query 15
select db.category, sum(late_return) as total_late_returns
from dim_book db
inner join fact_loan f on db.book_id = f.book_id
group by db.category;

-- query 16
select du.user_full_name, count(*) as loan_count
from dim_user du
inner join fact_loan f on du.user_id = f.user_id
group by du.user_full_name
order by loan_count desc
fetch first 5 rows only;

-- query 17
select du.user_full_name,
    case
        when (max(f.return_date) - min(f.due_date)) < 0 then 'error'
        when (max(f.return_date) - min(f.due_date)) > 100 then 'active loan'
        else to_char((max(f.return_date) - min(f.due_date)))
    end as loan_duration
from dim_user du
inner join fact_loan f on du.user_id = f.user_id
group by du.user_full_name;

-- query 18
select db.category, du.user_full_name, count(*) as loan_count
from dim_book db
inner join fact_loan f on db.book_id = f.book_id
inner join dim_user du on du.user_id = f.user_id
group by grouping sets ((db.category, du.user_full_name), (db.category), (du.user_full_name))
order by db.category, du.user_full_name
fetch first 10 rows only;

-- dropping dimfact table
drop table dimfact cascade constraints;

-- creating dimfact table
create table dimfact (
    dimfact_id      number          not null,
    dim1            varchar(30)     not null,
    dim2            varchar(30)     not null,
    dim3            varchar(30)     not null,
    facts           varchar(30)     not null,
    constraint PK_dimfact primary key (dimfact_id)
);

-- inserting into dimfact
insert into dimfact (dimfact_id, dim1, dim2, dim3, facts) values (300, 'dim11', 'dim21', 'dim31', 'facts1');
insert into dimfact (dimfact_id, dim1, dim2, dim3, facts) values (301, 'dim12', 'dim22', 'dim32', 'facts2');
insert into dimfact (dimfact_id, dim1, dim2, dim3, facts) values (302, 'dim13', 'dim23', 'dim33', 'facts3');
insert into dimfact (dimfact_id, dim1, dim2, dim3, facts) values (303, 'dim14', 'dim24', 'dim34', 'facts4');
insert into dimfact (dimfact_id, dim1, dim2, dim3, facts) values (304, 'dim15', 'dim25', 'dim35', 'facts5');
insert into dimfact (dimfact_id, dim1, dim2, dim3, facts) values (305, 'dim16', 'dim26', 'dim36', 'facts6');
insert into dimfact (dimfact_id, dim1, dim2, dim3, facts) values (306, 'dim17', 'dim27', 'dim37', 'facts7');
insert into dimfact (dimfact_id, dim1, dim2, dim3, facts) values (307, 'dim18', 'dim28', 'dim38', 'facts8');
insert into dimfact (dimfact_id, dim1, dim2, dim3, facts) values (308, 'dim19', 'dim29', 'dim39', 'facts9');
insert into dimfact (dimfact_id, dim1, dim2, dim3, facts) values (309, 'dim110', 'dim210', 'dim310', 'facts10');
insert into dimfact (dimfact_id, dim1, dim2, dim3, facts) values (310, 'dim111', 'dim211', 'dim311', 'facts11');
insert into dimfact (dimfact_id, dim1, dim2, dim3, facts) values (311, 'dim112', 'dim212', 'dim312', 'facts12');
insert into dimfact (dimfact_id, dim1, dim2, dim3, facts) values (312, 'dim113', 'dim213', 'dim313', 'facts13');
insert into dimfact (dimfact_id, dim1, dim2, dim3, facts) values (313, 'dim114', 'dim215', 'dim314', 'facts14');
insert into dimfact (dimfact_id, dim1, dim2, dim3, facts) values (314, 'dim115', 'dim215', 'dim315', 'facts15');

-- query 19
select *
from dimfact
model partition by (dim1)
      dimension by (dim2, dim3)
      measures (facts)
      rules (facts[any, 'dim2'] = facts['dim3', 'dim2']);

-- query 20
select *
from dimfact
model partition by (dim1)
      dimension by (dim2, dim3)
      measures (facts)
      rules (facts['dim2', 'dim3'] = facts['dim3', 'dim2']);







-- start of home assignment 4

-- 4.1. query with one table and multiple conditions in where clause
select books.book_name, readers.user_full_name
from books, loans, readers
where books.book_id = loans.book_id and readers.user_id = loans.user_id and readers.user_id between 200 and 203;

-- 4.2. query with two related tables and multiple conditions in where clause
select current_timestamp as current_time, max(books.num_of_copies) as max_num_of_copies
from books, libraries
where (books.lib_id between 5 and 12) and libraries.reg_date < TO_DATE('2023-09-01', 'YYYY-MM-DD');

-- 4.3. query with grouping group by
select books.b_category, loans.loan_id, loans.user_id, sum(books.num_of_copies) as total_copies
from books, loans
where loans.book_id = books.book_id
group by books.b_category, loans.loan_id, loans.user_id
fetch first 10 rows only;

-- 4.4. query with two related tables and query with grouping group by
select loans.lib_id, count(distinct books.author)
from loans, books
group by loans.lib_id
order by loans.lib_id
fetch first 7 rows only;

-- 4.5. query with grouping and having clause (conditions for groups)
select readers.user_full_name, upper(books.b_category), sum(books.num_of_copies) as sum_of_copies
from books, readers, loans
where loans.user_id = readers.user_id and loans.book_id = books.book_id
group by readers.user_full_name, books.b_category
having avg(books.num_of_copies) >= 3;

-- 4.6. query with two related tables, grouping and having clause (conditions for groups)
select books.book_id, count(loans.loan_id) as num_of_loans
from books, loans
where books.book_id = loans.book_id and books.book_name like '%' || :book_name_input || '%'
group by books.book_id
having count(loans.loan_id) < 260;

-- 4.7. query with subquery in select clause
select books.book_name, libraries.lib_name, (select count(*)
                                             from loans
                                             where loans.book_id = books.book_id) as loan_count
from books, libraries
offset 12 rows fetch first 10 rows only;

-- 4.8. query with subquery in from clause
select lib_name
from (select libraries.lib_id, libraries.lib_name, count(*) as total_books
      from libraries
      where libraries.lib_id = any (select distinct lib_id
                                    from books
                                    where book_id > 167)
      group by libraries.lib_id, libraries.lib_name);

-- 4.9. query with subquery in where clause
select distinct books.book_name, loans.due_date
from books, loans
where loans.book_id = books.book_id and books.book_id in (select book_id
                                                          from loans
                                                          where loan_status = 1)
order by books.book_name;

-- 4.10. query with subquery in having clause
select readers.user_id, count(loans.loan_id) as total_loan
from readers
inner join loans on readers.user_id = loans.user_id
group by readers.user_id
having count(loans.loan_id) > (select avg(total_loans)
                               from (select count(loan_id) as total_loans
                                     from loans
                                     group by user_id))
order by readers.user_id desc;

-- 4.11. query with union, intersect, minus constructions

-- 4.11.1. union
(select lib_id, lib_name
from libraries
fetch first 5 rows only)
union
(select emp_id, emp_full_name
from employees
fetch first 5 rows only);

-- 4.11.2. intersect
select user_full_name, user_birthday
from readers
where borrowed = 1
intersect
select user_full_name, user_birthday
from readers
where user_id < 217;

-- 4.11.3. minus
(select books.book_id, libraries.lib_name
from books, libraries
minus
select loans.book_id, libraries.lib_name
from loans, libraries)
fetch first 15 rows only;

-- 4.12. query with exists construction
select books.book_name, books.num_of_copies, libraries.lib_address
from books, libraries
where libraries.lib_id = 1 and exists (select *
              from loans
              where loans.book_id = books.book_id and loans.loan_status = 1);

-- 4.13. at least 3 queries with inner join

-- 4.13.1.
select books.book_name, readers.user_full_name
from books
inner join loans on books.book_id = loans.book_id
inner join readers on loans.user_id = readers.user_id
fetch first 5 rows only;

-- 4.13.2.
select books.book_name, loans.due_date
from books
inner join loans on books.book_id = loans.book_id
where books.b_category = 'Mystery';

-- 4.13.3.
select libraries.lib_id, libraries.lib_name, employees.emp_id, employees.emp_full_name
from libraries
inner join employees on libraries.lib_id = employees.lib_id
offset 10 rows fetch first 7 rows only;

-- 4.14. at least 3 queries with left join

-- 4.14.1.
select books.book_name, loans.return_date
from books
left join loans on books.book_id = loans.book_id
where loans.loan_status = 1;

-- 4.14.2.
select readers.user_full_name, loans.loan_id, loans.book_id, loans.due_date
from loans
left join readers on loans.user_id = readers.user_id
fetch first 13 rows only;

-- 4.14.3.
select books.book_name, count(loans.loan_id) as loan_count
from books
left join loans on books.book_id = loans.book_id
group by books.book_name
fetch first 7 rows only;

-- 4.15. at least 3 queries with right join

-- 4.15.1.
select books.book_name, loans.return_date
from loans
right join books on books.book_id = loans.book_id
fetch first 10 rows only;

-- 4.15.2.
select books.book_name, count(loans.loan_id) as loan_count
from loans
right join books on books.book_id = loans.book_id
having count(loans.loan_id)!= 1 and count(loans.loan_id) not between 3 and 5
group by books.book_name;

-- 4.15.3.
select libraries.lib_name, count(loans.loan_id)
from libraries
right join loans on libraries.lib_id = loans.lib_id
where libraries.lib_id between 8 and 17 and libraries.lib_name != 'Library 10'
group by libraries.lib_name;







-- start of home assignment 3
-- heap organized table

-- request all records
select *
from libraries;

-- request the total number of records
select count(*)
from libraries;

-- request one record
select *
from libraries
where lib_id = 1;



-- b-tree index

-- creating indexes
create index index_lib on libraries(reg_num);
create index index_emp on employees(start_date);

-- dropping emp_lib table
drop table emp_lib cascade constraints;

-- creating joint table emp_lib
create table emp_lib as
    select libraries.lib_id, employees.emp_id, employees.emp_full_name, employees.emp_birthday, employees.start_date
    from libraries
    inner join employees on employees.lib_id = libraries.lib_id;
    
-- request all records
select *
from emp_lib;

-- request the total number of records
select count(*)
from emp_lib;

-- request one record
select *
from emp_lib
where emp_id = 100;



-- bitmap join index

-- creating bitmap index
create bitmap index emp_lib_bitmap
on emp_lib(lib_id);

-- request all records
select *
from emp_lib;

-- request the total number of records
select count(*)
from emp_lib;

-- request one record
select *
from emp_lib
where emp_id = 102;



-- indexed cluster

-- dropping cluster emp_lib_cluster
drop cluster emp_lib_cluster;

-- creating cluster
create cluster emp_lib_cluster (lib_id integer) index;

-- dropping tables employees_cluster and libraries_cluster
drop table employees_cluster;
drop table libraries_cluster;

-- creating tables employees_cluster and libraries_cluster
create table employees_cluster (
    emp_id               INTEGER               not null,
    lib_id               INTEGER               not null,
    emp_full_name        VARCHAR2(50)          not null,
    emp_birthday         DATE                  not null,
    constraint PK_employees_cluster primary key (emp_id)
) cluster emp_lib_cluster (lib_id);
    
create table libraries_cluster (
    lib_id               INTEGER               not null,
    lib_name             VARCHAR2(50)          not null,
    lib_address          VARCHAR2(100)         not null,
    constraint PK_libraries_cluster primary key (lib_id)
) cluster emp_lib_cluster (lib_id);
    
create index emp_lib_cluster_index on cluster emp_lib_cluster;

-- inserting data into employees_cluster from employees
insert into employees_cluster (emp_id, lib_id, emp_full_name, emp_birthday)
    select emp_id, lib_id, emp_full_name, emp_birthday
    from employees;

-- inserting data into libraries_cluster from libraries    
insert into libraries_cluster (lib_id, lib_name, lib_address)
    select lib_id, lib_name, lib_address
    from libraries;

-- request all records
select *
from employees_cluster;

-- request the total number of records
select count(*)
from libraries_cluster;

-- request one record
select *
from libraries_cluster
where lib_name = 'Library 1';



-- hash cluster

-- dropping cluster
drop cluster emp_lib_hash;

-- creating cluster
create cluster emp_lib_hash(lib_id integer) hashkeys 100;

-- dropping tables employees_hash and libraries_hash
drop table employees_hash;
drop table libraries_hash;

-- creating tables employees_hash and libraries_hash
create table libraries_hash (
    lib_id               INTEGER               not null,
    lib_name             VARCHAR2(50)          not null,
    lib_address          VARCHAR2(100)         not null,
    constraint PK_libraries_hash primary key (lib_id)
) cluster emp_lib_hash (lib_id);

create table employees_hash (
    emp_id               INTEGER               not null,
    lib_id               INTEGER               not null,
    emp_full_name        VARCHAR2(50)          not null,
    emp_birthday         DATE                  not null,
    constraint PK_employees_hash primary key (emp_id)
) cluster emp_lib_hash (lib_id);

-- inserting data into libraries_hash from libraries    
insert into libraries_hash (lib_id, lib_name, lib_address)
    select lib_id, lib_name, lib_address
    from libraries;

-- inserting data into employees_hash from employees
insert into employees_hash (emp_id, lib_id, emp_full_name, emp_birthday)
    select emp_id, lib_id, emp_full_name, emp_birthday
    from employees;
    
-- request all records
select *
from libraries_hash;

-- request the total number of records
select count(*)
from libraries_hash;

-- request one record
select *
from employees_hash
where emp_full_name = 'Khanim Sultanova';



-- index organized table

-- dropping tables index_org_lib and index_org_emp
drop table index_org_lib;
drop table index_org_emp;

-- creating tables  index_org_lib and index_org_emp
create table index_org_lib (
    lib_id               INTEGER               not null,
    lib_name             VARCHAR2(50)          not null,
    lib_address          VARCHAR2(100)         not null,
    constraint PK_index_org_lib primary key (lib_id)
) organization index;

create table index_org_emp (
    emp_id               INTEGER               not null,
    lib_id               INTEGER               not null,
    emp_full_name        VARCHAR2(50)          not null,
    emp_birthday         DATE                  not null,
    constraint PK_index_org_emp primary key (emp_id)
) organization index;

-- inserting data into libraries_hash from libraries    
insert into index_org_lib (lib_id, lib_name, lib_address)
    select lib_id, lib_name, lib_address
    from libraries;

-- inserting data into employees_hash from employees
insert into index_org_emp (emp_id, lib_id, emp_full_name, emp_birthday)
    select emp_id, lib_id, emp_full_name, emp_birthday
    from employees;
    
-- request all records
select *
from index_org_emp;

-- request the total number of records
select count(*)
from index_org_lib;

-- request one record
select *
from index_org_emp
where emp_id = 100;