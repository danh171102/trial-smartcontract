//SPDX-License-Identifier: UNLICENSED


pragma solidity ^0.8.0;

contract Token {

    string public name = "DOG Token";
    string public symbol = "DOG";


    uint256 public totalSupply = 10000000000;
    uint256 countTotalSupply = 0;
    address public owner;
    uint256 countBurnSupply = 0;

    mapping (address => uint256) public balances;

    constructor() {
        owner = msg.sender;
    }

    function mint(address _wallet, uint256 _mintamount) public {
        require(msg.sender == owner, "you aren't owner");
        countTotalSupply += _mintamount;
        require(countTotalSupply <= totalSupply, "over total supply!");
        balances[_wallet] += _mintamount;


    }

    function burn(address _wallet, uint256 _burnamount) public {
        require(msg.sender == owner, "you aren't owner");
        countBurnSupply += _burnamount;
        balances[_wallet] -= _burnamount;

    }

    function showBurnAmount() public view returns(uint256) {
        return countBurnSupply ;
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