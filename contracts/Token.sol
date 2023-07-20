//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Token {

    string public name;
    string public symbol;
    uint256 public totalSupply;
    address public owner;
    mapping (address => uint256) public balances;

    constructor(
        string memory _name,
        string memory _symbol,
        uint256 _totalSupply
    ) {
        owner = msg.sender;
        name = _name;
        symbol = _symbol;
        totalSupply = _totalSupply;
        balances[address(this)] = _totalSupply;
    }

    event Burn(uint256 _amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner!");
        _;
    }

    function mint(address _receiver, uint256 _amount) public onlyOwner {
        balances[address(this)] -= _amount;
        balances[_receiver] += _amount;
        require(balances[address(this)] > 0, "Max total supply reach!");
    }

    function burn(uint256 _amount) public {
        balances[msg.sender] -= _amount;
        emit Burn(_amount);
    }

    function transfer(address _to, uint256 _amount) external {
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
        require(balances[msg.sender] > 0, "Not enough balance!");
    }

    function balanceOf(address _account) external view returns (uint256) {
        return balances[_account];
    }
}