-- this script will inser some cross reference records from our fake users to groups
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