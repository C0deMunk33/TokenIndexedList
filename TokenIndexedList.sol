pragma solidity ^0.4.19;

import './OwnedByContract.sol';

contract TokenIndexedList is OwnedByContract {
    uint256 private _index = 1;
   
    mapping(uint256 => uint256) tokens; //index => tokenId
    mapping(uint256 => uint256) tokenToIndex;//tokenId => index
    
    function add(uint256 newToken) public onlyOwner {
        tokens[_index] = newToken;
        tokenToIndex[newToken] = _index;
        _index += 1;
    } 
    
    function remove(uint256 removeToken) public onlyOwner {
        _index-= 1;
        tokens[tokenToIndex[removeToken]] = tokens[_index];
        tokenToIndex[removeToken] = 0;
    }
    
    function getTokenCount() public view returns(uint256){
        return _index -1;
    }
    
    function getByIndex(uint256 index) public view  returns(uint256){
        return tokens[index+1];
    }
    
}
