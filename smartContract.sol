// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract myContract {
    
    address payable owner;
    uint256 listingPrice = 5 ether;
    uint256 price;
    address payable nftOwner;

    constructor(){
        owner = payable(msg.sender);
    }

    function listing(address _nftOwner) public payable{
        require(msg.value == listingPrice, "listing price don't match");
        nftOwner = payable(_nftOwner);
    }

    function sellItem(uint256 _price) public {
        price = _price * (1 ether); 
    }

    function getPrice() public view returns(uint256) {
        return price;
    }

    function itemSold() public payable {
        require(msg.value == price,"Not the correct price");
        nftOwner.transfer(msg.value);

    } 
   
}
