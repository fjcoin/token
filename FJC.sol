// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;


import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract FJC is ERC20Burnable, Ownable, AccessControl{
    
    uint256 public maxSupply = 1_000_000_000 * (10 ** decimals());
    


    constructor() ERC20("FJC Token", "FJC") Ownable(msg.sender) {
        address sender = _msgSender();
        mint(sender, maxSupply);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        uint256 supplyToMint = totalSupply() + amount;
        require(supplyToMint <= maxSupply, "FJC: minting would exceed max supply");
        _mint(to, amount);
    }
}
