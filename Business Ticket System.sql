----------------Create tables--------------------
create table Team (
  Team_ID Varchar(10) primary key, 
  Team_Name varchar(15) not null
); 

create table Employee (
  Employee_ID Varchar(10) primary key, 
  Team_ID varchar(10),
  First_Name varchar(10),
  Last_Name varchar(10)
);
  
create table Ticket (
  Ticket_ID Varchar(10) primary key, 
  Employee_ID varchar(10),
  Risk_ID varchar(1),
  Priority_ID varchar(1),
  Emergency varchar(1),
  Title varchar(20),
  Start_Time Date,
  End_Time Date
);

create table Risk (
  Risk_ID Varchar(1) primary key, 
  Risk_Name varchar(10)
);

create table Change (
  Change_ID Varchar(10) primary key, 
  Risk_ID varchar(1),
  Change_Name varchar(10)
);

create table Priority (
  Priority_ID Varchar(1) primary key, 
  Priority_Name varchar(10)
);

create table Peer (
  Peer_review_ID Varchar(10) primary key, 
  Ticket_ID varchar(10),
  CAB_Review_ID varchar(10),
  Approved varchar(1)
);

create table CAB (
  CAB_Review_ID Varchar(10) primary key, 
  Ticket_ID varchar(10),
  Approved varchar(1)
);

-----------------Add Foreign Keys-------------------
alter table Employee
add constraint emp_fk foreign key (Team_ID)
references Team (Team_ID);

alter table Ticket
add constraint Tic_fk_1 foreign key (Employee_ID)
references Employee (Employee_ID);

alter table Ticket
add constraint Tic_fk_2 foreign key (Risk_ID)
references Risk (Risk_ID);

alter table Ticket
add constraint Tic_fk_3 foreign key (Priority_ID)
references Priority (Priority_ID);

alter table Change
add constraint Cha_fk foreign key (Risk_ID)
references Risk (Risk_ID);

alter table Peer
add constraint Pee_fk_1 foreign key (Ticket_ID)
references Ticket (Ticket_ID);

alter table Peer
add constraint Pee_fk_2 foreign key (CAB_Review_ID)
references CAB (CAB_Review_ID);

alter table CAB
add constraint CAB_fk foreign key (Ticket_ID)
references Ticket (Ticket_ID);

--------------alter tables--------------------
Alter table Risk modify Risk_Name Varchar(15);
Alter table Change modify Change_Name Varchar(20);

ALTER TABLE CAB 
ADD Peer_review_ID Varchar(10);
alter table CAB
add constraint CAB_fk_2 foreign key (Peer_review_ID)
references Peer (Peer_review_ID);
ALTER TABLE Peer DROP COLUMN CAB_Review_ID;


----------grant access------------
GRANT ALL ON Team TO ;


------------Input Essential Values----------
insert into Risk
values ('1', 'Low Risk');
insert into Risk
values ('2', 'Low Risk');
insert into Risk
values ('3', 'Medium Risk');
insert into Risk
values ('4', 'Medium Risk');
insert into Risk
values ('5', 'High Risk');
insert into Risk
values ('6', 'High Risk');

insert into Change
values ('1', '1', 'Standard Change');
insert into Change
values ('2', '2', 'Standard Change');
insert into Change
values ('3', '3', 'Non-Standard Change');
insert into Change
values ('4', '4', 'Non-Standard Change');
insert into Change
values ('5', '5', 'Non-Standard Change');
insert into Change
values ('6', '6', 'Non-Standard Change');

insert into Priority
values ('1', 'Priority 1');
insert into Priority
values ('2', 'Priority 2');
insert into Priority
values ('3', 'Priority 3');

insert into Team
values ('1', 'Marketing 1');
insert into Team
values ('2', 'Marketing 2');
insert into Team
values ('3', 'Operation 1');
insert into Team
values ('4', 'Operation 2');
insert into Team
values ('5', 'Engineer 1');
insert into Team
values ('6', 'Engineer 2');

insert into Employee
values ('1', '2', 'Alexander', 'Stephen');
insert into Employee
values ('2', '2', 'Alfreda', 'Annabel');
insert into Employee
values ('3', '5', 'Edward', 'Lamar');
insert into Employee
values ('4', '6', 'Destiny', 'Gregory');
insert into Employee
values ('5', '6', 'Ardath', 'Roosevelt');
insert into Employee
values ('6', '1', 'Craig', 'Ferne');
insert into Employee
values ('7', '1', 'Kennedy', 'Kasey');
insert into Employee
values ('8', '6', 'Catherine', 'Davin');
insert into Employee
values ('9', '3', 'Korey', 'Macie');
insert into Employee
values ('10', '6', 'Roy', 'Roxanne');
insert into Employee
values ('11', '2', 'Madeleine', 'Maple');
insert into Employee
values ('12', '1', 'Georgia', 'Byron');
insert into Employee
values ('13', '1', 'Stephanie', 'Herman');
insert into Employee
values ('14', '1', 'Ulysses', 'Gordon');
insert into Employee
values ('15', '6', 'Homer', 'Norwood');

--------------input user data----------------
insert into Ticket
values ('1', '1', '1', '1', '0', 'Example', '20-NOV-2021', '27-NOV-2021');
insert into Peer
values ('1', '1', '0');  -- since peer review denied the change, it does not go to CAB
delete from CAB;
delete from ticket;

insert into Ticket
values ('1', '1', '5', '3', '0', 'Example', '20-NOV-2021', '27-NOV-2021');
insert into Peer
values ('1', '1', '1');  -- approved by peer review, goes to CAB
insert into CAB
values ('1', '1', '1', '1');  -- CAB approved
select * from peer;
select * from CAB;
select * from Ticket;
delete from CAB;
delete from peer;
delete from ticket;


insert into ticket (ticket_id, employee_id, risk_id, priority_id, emergency, title, start_time, end_time)
values ('0011','13','1','3','0', 'Install Updates','29-AUG-2021','31-AUG-2021');
insert into peer (ticket_id, peer_review_id, approved)
values ('0011', '123', '1');

insert into ticket (ticket_id, employee_id, risk_id, priority_id, emergency, title, start_time, end_time)
values ('0012','14','3','1','0', 'Change IP Address','05-SEP-2021','06-SEP-2021');
insert into peer (ticket_id, peer_review_id, approved)
values ('0012', '124', '1');
insert into cab (cab_review_id, ticket_id, approved, peer_review_id)
values ('0055', '0012', '1', '124');

insert into ticket (ticket_id, employee_id, risk_id, priority_id, emergency, title, start_time, end_time)
values ('0013','14','4','2','0', 'Restore Backup','06-NOV-2021','07-NOV-2021');
insert into peer (ticket_id, peer_review_id, approved)
values ('0013', '125', '1');
insert into cab (cab_review_id, ticket_id, approved, peer_review_id)
values ('0066', '0013', '1', '125');


insert into ticket (ticket_id, employee_id, risk_id, priority_id, emergency, title, start_time, end_time)
values ('0021','5','3','1','0', 'Unauthorised Access','01-JUL-2021','03-JUL-2021');
insert into peer (ticket_id, peer_review_id, approved)  
values ('0021', '126', '1');
insert into cab (cab_review_id, ticket_id, approved, peer_review_id)
values ('0077', '0021', '1', '126');

insert into ticket (ticket_id, employee_id, risk_id, priority_id, emergency, title, start_time, end_time)
values ('0022','6','4','2','0', 'Access Denied','12-AUG-2021','14-AUG-2021');
insert into peer (ticket_id, peer_review_id, approved)
values ('0022', '127', '1');
insert into cab (cab_review_id, ticket_id, approved, peer_review_id)
values ('0088', '0022', '1', '127');

insert into ticket (ticket_id, employee_id, risk_id, priority_id, emergency, title, start_time, end_time)
values ('0023','7','1','3','0', 'Missing Command','05-SEP-2021','06-SEP-2021');
insert into peer (ticket_id, peer_review_id, approved)
values ('0023', '128', '1');


Insert into Ticket (ticket_ID, employee_ID, risk_id, priority_id, emergency, title, Start_time, End_time)
values ('0046', '2', '2', '3', '0', 'Screen changing', '20-OCT-2021', '28-OCT-2021');
insert into peer (ticket_ID, peer_review_ID, approved)
values ('0046', '2', '0');

Insert into Ticket (ticket_ID, employee_ID, risk_id, priority_id, emergency, title, Start_time, End_time)
values ('0052', '3', '1', '1', '0', 'Keyboard change', '19-JULY-2021', '29-JULY-2021');
insert into peer (ticket_ID, peer_review_ID, approved)
values ('0052', '1', '1');
Insert into CAB (cab_review_id, ticket_id, peer_review_ID, Approved)
values ('423', '0052', '1','1'); 

Insert into Ticket (ticket_ID, employee_ID, risk_id, priority_id, emergency, title, Start_time, End_time)
values ('0024', '2', '3', '2', '0', 'Access to SAP', '26-APR-2021', '06-MAY-2021');
insert into peer (ticket_ID, peer_review_ID, approved) 
values ('0024', '3', '0'); 


INSERT INTO Ticket (ticket_id, employee_id, risk_id, priority_id, emergency, title, start_time, end_time)
VALUES ('0032', '10', '3', '2', '0', 'Access to System', '11-NOV-2021', '14-NOV-2021');
INSERT INTO PEER (peer_review_id, ticket_id, approved)
VALUES ('4', '0032', '1');
insert into CAB (cab_review_id, ticket_id, peer_review_ID, Approved) 
values ('11', '0032', '4', '0'); 

INSERT INTO Ticket (ticket_id, employee_id, risk_id, priority_id, emergency, title, start_time, end_time)
VALUES ('0031', '12', '3', '3', '0', 'Install Software', '06-JAN-2021', '07-JAN-2021');
INSERT INTO PEER (peer_review_id, ticket_id, approved)
VALUES ('50', '0031','1');
INSERT INTO CAB (cab_review_id,ticket_id, peer_review_id, approved)
values ('12', '0031', '50', '1');


INSERT INTO Ticket (ticket_id, employee_id, risk_id, priority_id, emergency, title, start_time, end_time)
VALUES ('0048', '9', '4', '1', '0', 'Change Password', '15-JUL-2021', '15-JUL-2021');
INSERT INTO Peer (ticket_id, peer_review_id, approved)
VALUES ('0048', '7', '1');
INSERT INTO Cab (cab_review_id, ticket_id, approved, peer_review_id)
VALUES ('422', '0048', '1', '7');

select * from ticket;



---------------create reports---------------------------------

select 
    tic.ticket_id, tic.emergency, tic.title, tic.start_time, tic.end_time, 
    emp.employee_id, emp.first_name, emp.last_name,
    case when emergency = '1' then 'ATTENTION' end "Attention"
from ticket tic
    join employee emp
    on tic.employee_id = emp.employee_id
where emergency = '1';



select * from risk;









