-- Author: Daryna Kulya, Steve Westfall

CREATE TABLE Users(
    id integer NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    userName varchar(15) NOT NULL,
    firstName varchar(30),
    lastName varchar(30),
    password varchar(32),
    groupID integer,
    CONSTRAINT ukcUsers UNIQUE (userName)
);

CREATE TABLE Groups(
    id integer NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name varchar(30),
    adminID integer,
    CONSTRAINT fkcGroups1 Foreign Key (adminID) references Users(id)
);

ALTER TABLE USERS ADD CONSTRAINT fkcUsers1 FOREIGN KEY (groupID) REFERENCES Groups(id);

CREATE TABLE Buildings(
    id integer NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name varchar(30)
);

CREATE TABLE Rooms(
    id integer NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    buildingID integer,
    number integer,
    capacity integer,
    projector varchar(2),
    CONSTRAINT fkcRooms1 Foreign Key (buildingID) references Buildings(id)
);

CREATE TABLE Timeslots(
    id integer NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    startTime varchar(7),
    endTime varchar(7)
);

CREATE TABLE Bookings(
    id integer NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    timeslotID integer,
    bookingDate DATE,
    isBooked varchar(2) DEFAULT '0',
    roomID integer NOT NULL,
    groupID integer,
    CONSTRAINT fkcBookings1 Foreign Key (timeslotID) references Timeslots(id),
    CONSTRAINT fkcBookings2 Foreign Key (roomID) references Rooms(id),
    CONSTRAINT fkcBookings3 Foreign Key (groupID) references Groups(id)
);

CREATE TABLE GroupUserXR(
    id integer NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    groupID integer NOT NULL,
    userID integer NOT NULL,
    CONSTRAINT fkcGroupUserXR1 Foreign Key (groupID) references Groups(id),
    CONSTRAINT fkcGroupUserXR2 Foreign Key (userID) references Users(id),
    CONSTRAINT ukcGroupUserXR1 UNIQUE (groupID, userID)
);
