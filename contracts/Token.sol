//SPDX-License-Identifier: UNLICENSED


pragma solidity ^0.8.0;

contract Token {

    string public name = "DOG Token";
    string public symbol = "DOG";


    uint256 public totalSupply = 10000000000;
    uint256 countTotalSupply = 0;
    address public owner;

    mapping(address => uint256) balances;

    constructor() {
        owner = msg.sender;
    }
    function mint(address _wallet, uint256 _mintamount) public {
        require(msg.sender == owner, "you aren't owner");
        countTotalSupply += _mintamount;
        if(countTotalSupply >= totalSupply) {
            return("over total supply!");
        }
        else {
            _wallet.balance += _mintamount;
        }
    }

    function transfer(address to, uint256 amount) external {
        require(balances[msg.sender] >= amount, "Not enough tokens");

        balances[msg.sender] -= amount;
        balances[to] += amount;
    }

    function balanceOf(address account) external view returns (uint256) {
        return balances[account];
    }
}