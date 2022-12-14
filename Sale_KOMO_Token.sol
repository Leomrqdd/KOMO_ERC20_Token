// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

//Create a contract that can sale KOMO token to people

interface IERC20 {
    function transferFrom (address _from, address _to, uint _amount) external;
    function decimals() external view returns (uint);

}


contract TokenKomoSale {
    uint public tokenPriceInWei = 1 ether ;
    IERC20 public token;
    address public tokenOwner;


    constructor(address _token) {
        token = IERC20(_token);
        tokenOwner = msg.sender;
    }

    function PurchaseTokens() public payable {
        require(msg.value >= tokenPriceInWei, "not enough token");
        uint tokenToTransfer = msg.value / tokenPriceInWei;
        uint remainder = msg.value - tokenToTransfer*tokenPriceInWei;
        token.transferFrom(tokenOwner, msg.sender, tokenToTransfer*10**token.decimals());
        payable(msg.sender).transfer(remainder); // send the rest back 
    }
}
