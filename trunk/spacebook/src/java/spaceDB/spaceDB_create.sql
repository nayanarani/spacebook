CREATE TABLE IF NOT EXISTS Users(
    id integer NOT NULL AUTO_INCREMENT,
    fName varchar(30),
    lName varchar(30),
    password varchar(30),
    groupID integer,
    CONSTRAINT pkcUsers Primary Key (id)
);

CREATE TABLE IF NOT EXISTS Groups(
    id integer NOT NULL AUTO_INCREMENT,
    name varchar(30),
    adminID integer,
    CONSTRAINT pkcGroups Primary Key (id),
    CONSTRAINT fkcGroups1 Foreign Key (adminID) references Users(id)
);

ALTER TABLE USERS ADD CONSTRAINT fkcUsers1 FOREIGN KEY (groupID) REFERENCES Groups(id);

CREATE TABLE IF NOT EXISTS Buildings(
    id integer NOT NULL AUTO_INCREMENT,
    name varchar(30),
    CONSTRAINT pkcBuildings Primary Key (id)
);

CREATE TABLE IF NOT EXISTS Rooms(
    id integer NOT NULL AUTO_INCREMENT,
    buildingID integer,
    number integer,
    capacity integer,
    projector varchar(2),
    CONSTRAINT pkRooms Primary Key (id),
    CONSTRAINT fkcRooms1 Foreign Key (buildingID) references Buildings(id)
);

CREATE TABLE IF NOT EXISTS Timeslots(
    id integer NOT NULL AUTO_INCREMENT,
    start varchar(6),
    end varchar(6),
    CONSTRAINT pkcTimeslot PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Bookings(
    id integer NOT NULL AUTO_INCREMENT,
    timeslotID integer,
    isBooked varchar(2) DEFAULT FALSE,
    roomID integer NOT NULL,
    groupID integer,
    CONSTRAINT pkcBookings Primary Key (id),
    CONSTRAINT fkcBookings1 Foreign Key (timeslotID) references Timeslots(id),
    CONSTRAINT fkcBookings2 Foreign Key (roomID) references Rooms(id),
    CONSTRAINT fkcBookings3 Foreign Key (groupID) references Groups(id)
);

CREATE TABLE IF NOT EXISTS GroupUserXR(
    id integer NOT NULL AUTO_INCREMENT,
    groupID integer NOT NULL,
    userID integer NOT NULL,
    CONSTRAINT pkcGroupUserXR Primary Key (id),
    CONSTRAINT fkcGroupUserXR1 Foreign Key (groupID) references Groups(id),
    CONSTRAINT fkcGroupUserXR2 Foreign Key (userID) references Users(id),
    CONSTRAINT ukcGroupUserXR1 UNIQUE (groupID, userID)
);

