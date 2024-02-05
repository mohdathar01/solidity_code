//SPDX-License-Identifier: MIT
//for tweet - array of struct
//for message - array of nested mapping
//for follower - array mapping
pragma solidity 0.8.20;
contract twitterContract {
    struct TweetStorage{
        string tweet;
        address author;
        uint creationTime;
    } 
    struct Message{
        string content;
        address from;
        address to;
        uint256 createdAt;
    }
    mapping(address => TweetStorage[]) public getTweet;
    mapping(address => mapping(address => string[])) private getMessage;
    mapping(address => address[]) private followerIndex;
    mapping(address => mapping(address => bool)) public checkOperator;

    string[] storeAllTweet;
    modifier checkAuthority(address _addr){
        require(_addr == msg.sender || checkOperator[_addr][msg.sender], "Access denied");
        _;
    }
//To post tweet need to give address of author
    function postTweet(address _fromAuthor, string calldata _content) public checkAuthority(_fromAuthor){
        storeAllTweet.push(_content);
        getTweet[_fromAuthor].push(TweetStorage(_content, _fromAuthor, block.timestamp));
    }
//To send message need to give address of sender and secondly receiver address 
    function sendMessage(address _from, address _to, string calldata _message) public checkAuthority(_from) {
        getMessage[_from][_to].push( _message);
    }

    function seeMessage(address _sender,address _recipient ) public view checkAuthority(_sender) returns(string[] memory){
        return getMessage[_sender][_recipient];
    }

    function follow(address _giveAddress) public {
        followerIndex[msg.sender].push(_giveAddress);
    }

    function getFollower() public view returns(address[] memory){
        return followerIndex[msg.sender];
    }

    function getAllTweetOfUser(address _giveAddress) public view returns(TweetStorage[] memory){
        return getTweet[_giveAddress];
    }

    function giveAccess(address _access) public {
        checkOperator[msg.sender][_access]  =  true;
    }

    function denyAccess(address _deny) public {
        checkOperator[msg.sender][_deny] = false;
    }
// this will show latest tweets of all users
    function getLatestTweets(uint _giveNumber) public view returns(string[] memory){
        string[] memory AllTweet = storeAllTweet;
        string[] memory leatestTweets = new string[](_giveNumber);
        for(uint i; i < _giveNumber; i++){
            leatestTweets[i] = AllTweet[AllTweet.length - 1 - i]; 
        }
        return leatestTweets;
    }
//this will show latest tweet of a single user
    function getLatestTweetsOfUser(address _giveAddress,uint _giveNumber) public view returns(string[] memory){
        TweetStorage[] memory _storeAllTweet = getAllTweetOfUser(_giveAddress);
        string[] memory storeTweets = new string[](_storeAllTweet.length);
        string[] memory storeLatestTweets = new string[](_giveNumber);
        
        for(uint i; i < _storeAllTweet.length; i++){ //store only string from struct
            storeTweets[i] = _storeAllTweet[i].tweet;
        }
        for(uint i; i < _giveNumber; i++){ //store latest string
            storeLatestTweets[i] = storeTweets[storeTweets.length - 1 - i];
        }

        return storeLatestTweets;
    }
}