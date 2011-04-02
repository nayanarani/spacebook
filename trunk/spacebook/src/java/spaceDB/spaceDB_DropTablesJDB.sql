ALTER TABLE Users DROP FOREIGN KEY fkcUsers1;
ALTER TABLE Groups DROP FOREIGN KEY fkcGroups1;
ALTER TABLE Rooms DROP FOREIGN KEY fkcRooms1;
ALTER TABLE Bookings DROP FOREIGN KEY fkcBookings1;
ALTER TABLE Bookings DROP FOREIGN KEY fkcBookings2;
ALTER TABLE Bookings DROP FOREIGN KEY fkcBookings3;
ALTER TABLE Bookings DROP FOREIGN KEY fkcBookings4;
ALTER TABLE GroupUserXR DROP FOREIGN KEY fkcGroupUserXR1;
ALTER TABLE GroupUserXR DROP FOREIGN KEY fkcGroupUserXR2;

DROP TABLE Users;
DROP TABLE Groups;
DROP TABLE Buildings;
DROP TABLE Rooms;
DROP TABLE Bookings;
DROP TABLE Timeslots;
DROP TABLE GroupUserXR;