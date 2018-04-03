pragma solidity ^0.4.15;

contract Users {
	address public owner;
    address[] public users_address;
    uint userCount = 1;


	struct Participant {
        uint id;
        bytes32 name;
        bytes32 entry; // create a struct with message and date in the future
    }
    
mapping(address => Participant) public users;


function addUser(bytes32 userName, bytes32 userEntry) returns (uint userID, bool success) {
    userID = userCount++;
    
    require(checkUserExist(msg.sender) == false);
    users[msg.sender].id = userID;
    users[msg.sender].name = userName;
    users[msg.sender].entry = userEntry;
    users_address.push(msg.sender);
    
    return(userID, true);
}

function getUsers() constant returns (uint[], bytes32[], bytes32[]) {
    uint length = users_address.length;
    
    uint[] memory usersID = new uint[](length);
    bytes32[] memory userNames = new bytes32[](length);
    bytes32[] memory userEntrys = new bytes32[](length);
    
    for (uint i = 0; i < length; i++) {
        Participant memory showUser;
        address actual = users_address[i];
        showUser = users[actual];
        
        usersID[i] = showUser.id;
        userNames[i] = showUser.name;
        userEntrys[i] = showUser.entry;
    }
    return(usersID, userNames, userEntrys);
}

function checkUserExist(address userAddress) returns (bool exist) {
    uint length = users_address.length;

    for (uint i = 0; i < length; i++){
        if(users_address[i] == userAddress) { 
            exist = true;
            break;
        }
    }
}



}