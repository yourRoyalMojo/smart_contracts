// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

//Contract address: 0x8F971Fa65056767920C2DC643b6B16A4a5E6034C

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    constructor() ERC20("Avengers Token", "ATK") {
        _mint(msg.sender, 1000000 * (10 ** uint256(decimals())));
    }
}