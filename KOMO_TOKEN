// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

// Create a new ERC20 token named KOMO 



contract KomodalToken is ERC20, AccessControl {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    event ServicePurchased(address indexed receiver, address indexed buyer);

    constructor() ERC20("KomodalToken", "KOMO") {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(MINTER_ROLE,msg.sender);
    }

    function mint(address _to, uint256 _amount) public onlyRole(MINTER_ROLE) {
        _mint(_to,_amount*10**decimals());
    }

    function BuyOneServiceFromKomodal() public {
        _burn(_msgSender(),1*10**decimals());
        emit ServicePurchased(_msgSender(), _msgSender());
    }

    function BuyOneServiceFromKomodalFrom(address _account) public {
        _spendAllowance(_account,_msgSender(),1*10**decimals());
        _burn(_account,1*10**decimals());
        emit ServicePurchased(_msgSender(), _account);
    }


}
