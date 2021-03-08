DROP SCHEMA IF EXISTS StudiResaCinema;
CREATE SCHEMA StudiResaCinema;
CREATE TABLE StudiResaCinema.Customer
(
    Id int not null primary key auto_increment,
    NameCustomer varchar(50) not null,
    TelCustomer decimal(10),
    EmailCustomer varchar(50) not null
);

CREATE TABLE StudiResaCinema.Film
(
    Id int not null primary key auto_increment,
    NameFilm int not null,
    DurationFilm int not null,
    Director char(50) not null, 
    Catogory char(50) not null
);

CREATE TABLE StudiResaCinema.Room
(
    Id int not null primary key auto_increment,
    NumberSeats int NOT NULL,
    IdFilm int not null,
    FOREIGN KEY (IdFilm) REFERENCES Film (Id)
);

CREATE TABLE StudiResaCinema.Cinema
(
    Id int not null primary key auto_increment,
    IdRoom int not null,
    FOREIGN KEY (IdRoom) REFERENCES Room (Id),
    Address char(50) not null,
    TelCinema decimal(10) not null,
    EmailCinema char(50) not null,
    Rooms int not null
);

CREATE TABLE StudiResaCinema.Schedule
(
    Id int not null primary key auto_increment,
    IdRoom int not null,
    FOREIGN KEY (IdRoom) REFERENCES Room (Id),
    IdFilm int not null,
    FOREIGN KEY (IdFilm) REFERENCES Film (Id),
    DateSchedule datetime not null,
    DurationSchedule int not null
);

CREATE TABLE StudiResaCinema.Booking
(
    Id int not null primary key auto_increment,
    IdCustomer int not null,
    IdFilm int not null,
    IdRoom int not null,
    IdCinema int not null,
    DateBooking datetime not null,
    IdSchedule int not null,
    FOREIGN KEY (IdCustomer) REFERENCES StudiResaCinema.Customer (Id),
    FOREIGN KEY (IdFilm) REFERENCES StudiResaCinema.Film (Id),
    FOREIGN KEY (IdRoom) REFERENCES StudiResaCinema.Room (Id),
    FOREIGN KEY (IdCinema) REFERENCES StudiResaCinema.Cinema (Id),
    FOREIGN KEY (IdSchedule) REFERENCES StudiResaCinema.Schedule (Id)
);

CREATE TABLE StudiResaCinema.Bill
(
    Id int not null primary key auto_increment,
    IdBooking int not null,
    FOREIGN KEY (IdBooking) REFERENCES Booking (Id),
    DateBill datetime not null,
    Price int not null
);
