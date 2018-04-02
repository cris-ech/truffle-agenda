pragma solidity ^0.4.15;

contract Users {
	
	struct Participant {
        uint id;
        bytes32 name;
        bytes32 entry;
    }
    
Participant[] public users;
uint userCount;

function addUser(bytes32 userName, bytes32 userEntry) returns (uint userID, bool success) {
    userID = userCount++;
    
    Participant memory newUser;
    newUser.id = userID;
    newUser.name = userName;
    newUser.entry = userEntry;
    
    users.push(newUser);
    return(userID, true);
}

function getUsers() constant returns (uint[], bytes32[], bytes32[]) {
    uint length = users.length;
    
    uint[] memory usersID = new uint[](length);
    bytes32[] memory userNames = new bytes32[](length);
    bytes32[] memory userEntrys = new bytes32[](length);
    
    for (uint i = 0; i < users.length; i++) {
        Participant memory showUser;
        showUser = users[i];
        
        usersID[i] = showUser.id;
        userNames[i] = showUser.name;
        userEntrys[i] = showUser.entry;
    }
    return(usersID, userNames, userEntrys);
}



}