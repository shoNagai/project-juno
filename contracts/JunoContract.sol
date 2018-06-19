pragma solidity 0.4.23;

import "./Mortal.sol";
import "./Pausable.sol";

contract JunoContract is Mortal, Pausable {

  struct Juno {
    string groom;
    string bride;
    uint64 signTime;
    string[] attendee;
  }

  uint256 public numJunos;
  uint256[] junoIds;
  mapping (uint256 => Juno) internal junos;

  event Sign(address sender, uint256 tokenId);

  constructor() public {
    numJunos = 0;
  }

  function sign(string _groom, string _bride) external whenNotPaused returns(uint256) {
    require(msg.sender != address(0));
    require(bytes(_groom).length != 0);
    require(bytes(_bride).length != 0);

    uint junoId = numJunos++;
    Juno storage juno = junos[junoId];
    juno.groom = _groom;
    juno.bride = _bride;
    juno.content = _content;
    juno.signTime = uint64(now);

    junoIds.push(junoId);

    emit Sign(msg.sender, junoId);

    return junoId;
  }

  function getAllJunos() external view returns (uint256[]) {
    return junoIds;
  }

  
}