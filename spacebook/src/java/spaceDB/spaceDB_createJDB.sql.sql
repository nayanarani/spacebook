-- Author: Daryna Kulya, Steve Westfall

CREATE TABLE Users(
    userID integer NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    userName varchar(15) NOT NULL,
    firstName varchar(30),
    lastName varchar(30),
    password varchar(32),
    groupID integer,
    CONSTRAINT ukcUsers UNIQUE (userName)
);

CREATE TABLE Groups(
    groupID integer NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    groupName varchar(30),
    adminID integer NOT NULL,
    CONSTRAINT fkcGroups1 Foreign Key (adminID) references Users(userID),
    CONSTRAINT ukcGroups1 UNIQUE (groupName)
);

ALTER TABLE USERS ADD CONSTRAINT fkcUsers1 FOREIGN KEY (groupID) REFERENCES Groups(groupID);

CREATE TABLE Buildings(
    buildingID integer NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    buildingName varchar(30)
);

CREATE TABLE Rooms(
    roomID integer NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    buildingID integer,
    roomNumber integer,
    capacity integer,
    projector varchar(2),
    CONSTRAINT fkcRooms1 Foreign Key (buildingID) references Buildings(buildingID)
);

CREATE TABLE Timeslots(
    timeslotID integer NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    startTime varchar(7),
    endTime varchar(7)
);

CREATE TABLE Bookings(
    bookingID integer NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    timeslotID integer,
    bookingDate varchar(11),
    booked varchar(2) DEFAULT 'N',
    buildingID integer,
    roomID integer NOT NULL,
    groupID integer,
    CONSTRAINT fkcBookings1 Foreign Key (timeslotID) references Timeslots(timeslotID),
    CONSTRAINT fkcBookings2 Foreign Key (buildingID) references Buildings(buildingID),
    CONSTRAINT fkcBookings3 Foreign Key (roomID) references Rooms(roomID),
    CONSTRAINT fkcBookings4 Foreign Key (groupID) references Groups(groupID)
);

CREATE TABLE GroupUserXR(
    groupUserXRID integer NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    groupID integer NOT NULL,
    userID integer NOT NULL,
    CONSTRAINT fkcGroupUserXR1 Foreign Key (groupID) references Groups(groupID),
    CONSTRAINT fkcGroupUserXR2 Foreign Key (userID) references Users(userID),
    CONSTRAINT ukcGroupUserXR1 UNIQUE (groupID, userID)
);
