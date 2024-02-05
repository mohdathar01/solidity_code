 // SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract UserManagement {
    struct User {
        string username;
        string password;
    }

    mapping(address => User) public users;
    address[] public userAddresses;

    event UserRegistered(address indexed userAddress, string  indexed username);
    event UserLoggedIn(address indexed userAddress);
    event UserDataPrinted(address indexed userAddress, string username, string indexed password);
    User public u1;

    function register(string memory _username, string memory _password) public {
        require(bytes(_username).length > 0, "Username cannot be empty");
        require(bytes(_password).length > 0, "Password cannot be empty");
        require(bytes(u1.username).length == 0, "User already registered");

        User storage newUser = users[msg.sender];
        newUser.username = _username;
        newUser.password = _password;
        userAddresses.push(msg.sender);

        emit UserRegistered(msg.sender, _username);
    }

    function login(string memory _username, string memory _password) public view returns (bool) {
        require(bytes(_username).length > 0, "Username cannot be empty");
        require(bytes(_password).length > 0, "Password cannot be empty");

        User storage existingUser = users[msg.sender];
        return (keccak256(bytes(existingUser.username)) == keccak256(bytes(_username)) &&
                keccak256(bytes(existingUser.password)) == keccak256(bytes(_password)));
    }

    function getUserByAddress(address _userAddress) public view returns (string memory, string memory) {
        User storage requestedUser = users[_userAddress];
        require(bytes(requestedUser.username).length > 0, "User not found");
        return (requestedUser.username, requestedUser.password);
    }

    function getAllUsers() public view returns (User[] memory) {
    uint256 usercount = userAddresses.length;
    User[] memory allUserData = new User[](usercount);

    for(uint256 i = 0; i < usercount; i++) {
        allUserData[i] = users[userAddresses[i]];
    }

    return allUserData;
    }

     
 
    
}

  

