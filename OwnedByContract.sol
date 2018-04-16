pragma solidity ^0.4.19;

import './ERC20Basic.sol';

contract OwnedByContract {
	address private Owner;
	
	function OwnedByContract() public{
	    
	    Owner = msg.sender;
	}
    
	function isOwner(address addr) view public returns(bool)
	{
	    return Owner == addr;
	}
	
	function transferOwner(address newOwner) public onlyOwner
	{
	    Owner = newOwner;
	}
	
	function terminate() public onlyOwner
	{
	    selfdestruct(Owner);
	}
	
	modifier onlyOwner(){
        require(msg.sender == Owner);
        _;
    }
    
    function transferEth(address to, uint256 amt) public onlyOwner {
        to.transfer(amt);
    }
    function transferToken(address tokenAddress, address to, uint256 amt) public onlyOwner{
        ERC20Basic(tokenAddress).transfer(to, amt);
    }
}
