// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.27;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TokenTest is ERC20, Ownable {
    constructor(address initialOwner)  ERC20("TokenTest2", "TKT2") Ownable(initialOwner) {

        _mint(msg.sender,  100 * 10 ** decimals());

    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
