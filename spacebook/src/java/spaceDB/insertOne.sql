-- creates some fake test users for our DB
-- for simplicity's sake I used the same hash for all of these fake users passwords
-- password:123456 = e10adc3949ba59abbe56e057f20f883e

INSERT INTO USERS(userName, firstName, lastName, password) VALUES('fakeuser1','William','Roberts','e10adc3949ba59abbe56e057f20f883e');
INSERT INTO USERS(userName, firstName, lastName, password) VALUES('fakeuser2','Betty','Ford','e10adc3949ba59abbe56e057f20f883e');
INSERT INTO USERS(userName, firstName, lastName, password) VALUES('fakeuser3','Homer','Simpson','e10adc3949ba59abbe56e057f20f883e');
INSERT INTO USERS(userName, firstName, lastName, password) VALUES('fakeuser4','Peyton','Manning','e10adc3949ba59abbe56e057f20f883e');
INSERT INTO USERS(userName, firstName, lastName, password) VALUES('fakeuser5','Wayne','Gretzky','e10adc3949ba59abbe56e057f20f883e');
INSERT INTO USERS(userName, firstName, lastName, password) VALUES('fakeuser6','John','Smith','e10adc3949ba59abbe56e057f20f883e');
INSERT INTO USERS(userName, firstName, lastName, password) VALUES('fakeuser7','Mary','Jones','e10adc3949ba59abbe56e057f20f883e');
INSERT INTO USERS(userName, firstName, lastName, password) VALUES('fakeuser8','Sally','Johnson','e10adc3949ba59abbe56e057f20f883e');
INSERT INTO USERS(userName, firstName, lastName, password) VALUES('fakeuser9','Kim','Frost','e10adc3949ba59abbe56e057f20f883e');
INSERT INTO USERS(userName, firstName, lastName, password) VALUES('fakeuser10','Jim','Bonner','e10adc3949ba59abbe56e057f20f883e');

-- this will insert some fake groups into our DB for testing

INSERT INTO GROUPS(groupName, adminID) VALUES('Group 1', 1);
INSERT INTO GROUPS(groupName, adminID) VALUES('Group 2', 9);
INSERT INTO GROUPS(groupName, adminID) VALUES('Group 3', 4);
INSERT INTO GROUPS(groupName, adminID) VALUES('Group 4', 7);
INSERT INTO GROUPS(groupName, adminID) VALUES('Group 5', 6);

-- now we'll insert some cross reference records from our fake users to groups
-- the first 5 entries add the cross references for the admins of the group

INSERT INTO GROUPUSERXR(groupID, userID) VALUES(1,1);
INSERT INTO GROUPUSERXR(groupID, userID) VALUES(2,9);
INSERT INTO GROUPUSERXR(groupID, userID) VALUES(3,4);
INSERT INTO GROUPUSERXR(groupID, userID) VALUES(4,7);
INSERT INTO GROUPUSERXR(groupID, userID) VALUES(5,6);

-- now we'll insert some non-admin members to each group

INSERT INTO GROUPUSERXR(groupID, userID) VALUES(1,8);
INSERT INTO GROUPUSERXR(groupID, userID) VALUES(1,3);
INSERT INTO GROUPUSERXR(groupID, userID) VALUES(1,4);
INSERT INTO GROUPUSERXR(groupID, userID) VALUES(2,2);
INSERT INTO GROUPUSERXR(groupID, userID) VALUES(2,10);
INSERT INTO GROUPUSERXR(groupID, userID) VALUES(3,8);
INSERT INTO GROUPUSERXR(groupID, userID) VALUES(3,3);
INSERT INTO GROUPUSERXR(groupID, userID) VALUES(3,6);
INSERT INTO GROUPUSERXR(groupID, userID) VALUES(3,5);
INSERT INTO GROUPUSERXR(groupID, userID) VALUES(3,7);
INSERT INTO GROUPUSERXR(groupID, userID) VALUES(4,8);
INSERT INTO GROUPUSERXR(groupID, userID) VALUES(4,9);
INSERT INTO GROUPUSERXR(groupID, userID) VALUES(4,1);
INSERT INTO GROUPUSERXR(groupID, userID) VALUES(5,2);
INSERT INTO GROUPUSERXR(groupID, userID) VALUES(5,10);

-- written by Daryna Kulya
-- insert values for timeslots available for bookinngs
-- timeslots (from 8 am till 5 pm)

insert into Timeslots (startTime, endTime) values ('8:00am', '9:00am');
insert into Timeslots (startTime, endTime) values ('9:00am', '10:00am');
insert into Timeslots (startTime, endTime) values ('10:00am', '11:00am');
insert into Timeslots (startTime, endTime) values ('11:00am', '12:00pm');
insert into Timeslots (startTime, endTime) values ('12:00pm', '1:00pm');
insert into Timeslots (startTime, endTime) values ('1:00pm', '2:00pm');
insert into Timeslots (startTime, endTime) values ('2:00pm', '3:00pm');
insert into Timeslots (startTime, endTime) values ('3:00pm', '4:00pm');
insert into Timeslots (startTime, endTime) values ('4:00pm', '5:00pm');