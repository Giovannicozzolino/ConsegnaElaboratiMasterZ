// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.27;

import {ERC1155} from "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract GamesAssets is ERC1155, Ownable {
    string public name = "My game Assets";

    uint256 public constant Spada = 1;
    uint256 public constant Scudo = 2;
    uint256 public constant Oro = 3;
    uint256 public constant Argento = 4;

    constructor(address initialOwner) 
        ERC1155("https://aqua-calm-termite-185.mypinata.cloud/ipfs/bafybeiawi2rd4tgsvdrvlpsctepcclaxvofuicr3isof4bf7ufezh2hln4/{id}.json") 
        Ownable(initialOwner) 
    {
        // mint automatico all'owner
        _mint(initialOwner, Spada, 1, "");
        _mint(initialOwner, Scudo, 1, "");
        _mint(initialOwner, Oro, 1000, "");
        _mint(initialOwner, Argento, 10000, "");
    }

    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

    function mint(address account, uint256 id, uint256 amount, bytes memory data)
        public
        onlyOwner
    {
        _mint(account, id, amount, data);
    }

    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
        public
        onlyOwner
    {
        _mintBatch(to, ids, amounts, data);
    }
}
