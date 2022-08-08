// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "./Room.sol";

contract RoomFactory is Ownable, Pausable{
    event RoomCreated(address indexed _creator, address _room, uint _depositedValue);

    function createRoom() external payable whenNotPaused {
        Room room = new Room{value: msg.value}(msg.sender);
        emit RoomCreated(msg.sender, address(room), msg.value);
    }
}