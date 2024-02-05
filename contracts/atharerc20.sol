// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.20;

interface IERC20{
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    event burningToken(address _founder, uint _quantity);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}


contract Block is IERC20{

  string public name="Block"; //name of the token
  string public symbol="BLK"; //symbol of the token
  uint public decimal=18; //we will talk about this at the end 
  address public founder;//initially this will have the total supply 
  uint public totalSupply;

  mapping(address=>mapping(address=>uint)) allowed;
  mapping(address=>uint) public balances; 
  mapping(address => bool) public isFreeze;
  bool stopAllFunctions;
  constructor(){
    founder=msg.sender;
    totalSupply=1000;
    balances[founder]=totalSupply;
  }

  modifier freezeStatus(){
    require(isFreeze[msg.sender]==false,"Your account is freezed");
   _;
  }
  modifier emergencyStatus(){
   require(stopAllFunctions==false,"Emergency declared");
   _;
  }
  
  function balanceOf(address account) external view returns (uint256){
    return balances[account];
  }
  //google pay scaning
  function transfer(address recipient, uint256 amount) external freezeStatus() emergencyStatus() returns (bool){
     require(amount>0,"Amount must be greater than zero");
     require(balances[msg.sender]>=amount,"You don't have enough balance");
     balances[msg.sender]-=amount;
     balances[recipient]+=amount;
     emit Transfer(msg.sender,recipient,amount);
     return true;
  }
 
  function allowance(address owner, address spender) external view returns (uint256){
       return allowed[owner][spender];
  } 
  //writing a cheque
  function approve(address spender, uint256 amount) external freezeStatus() emergencyStatus() returns (bool){
      require(amount>0,"Amount must be greater than zero");
      require(balances[msg.sender]>=amount,"You don't have enough balance");
      allowed[msg.sender][spender]=amount;
      emit Approval(msg.sender,spender,amount);
      return true;
  }
   //cashing the cheque
  function transferFrom(address sender, address recipient, uint256 amount) external freezeStatus() emergencyStatus() returns (bool){
      require(amount>0,"Amount must be greater than zero");
      require(balances[sender]>=amount,"You don't have enough balance");
      require(allowed[sender][recipient]>=amount,"Sender has not authorised to receiver for the given amount");
      balances[sender]-=amount;
      balances[recipient]+=amount;
      return true;
  }
  
 
  function burning(uint value) public {
    require(msg.sender==founder, "Only founder can burn tokens");
    require(value<=totalSupply, "Not enough token to burn");
    balances[founder]-=value;
    totalSupply-=totalSupply;
  }

  function freezAccount(address freezingAddress) public {
        require(msg.sender==founder,"You are not the founder");
        isFreeze[freezingAddress]=true;
  }

  function unFreezAccount(address unfreezingAddress) public{
        require(msg.sender==founder,"You are not the founder");
        isFreeze[unfreezingAddress]=false;
   }

   function emergency() public {
      stopAllFunctions=true;
   }

  //burning - founder will have authority to destroy tokens
  //freeze account - to stop an account to make any transfer
  //emergency - all the functions will stop working
  
}