pragma solidity 0.4.23;

import "./Mortal.sol";
import "./Pausable.sol";

contract JunoContract is Mortal, Pausable {

  struct Juno {
    string groom;
    string bride;
    uint64 startTime;
    mapping (uint256 => Attendee) attendee;
    uint64 signTime;
  }

  struct Attendee {
    string name;
    uint64 color;
    uint32 elect;
  }

  uint256 public numJunos;
  uint256[] junoIds;
  mapping (uint256 => Juno) internal junos;

  event Plan(address sender, uint256 junoId);
  event Blessing(uint256 junoId, string name, uint64 color, uint32 elect);
  event Sign(address sender, uint256 junoId);

  constructor() public {
    numJunos = 0;
  }

  function plan(string _groom, string _bride) external whenNotPaused returns(uint256) {
    require(msg.sender != address(0));
    require(bytes(_groom).length != 0);
    require(bytes(_bride).length != 0);

    uint junoId = numJunos++;
    Juno storage juno = junos[junoId];
    juno.groom = _groom;
    juno.bride = _bride;
    juno.startTime = uint64(now);

    junoIds.push(junoId);

    emit Plan(msg.sender, junoId);

    return junoId;
  }

  function blessing(uint256 _junoId, string _name, uint64 _color, uint32 _elect) external whenNotPaused {
    require(msg.sender != address(0));
    require(bytes(_attendee).length != 0);

    Juno storage juno = junos[_junoId];

    Attendee storage attendee = juno.attendee[_junoId];
    attendee.name = _name;
    attendee.color - _color;
    attendee.elect = _elect;

    emit Blessing(_junoId, _name, _color, _elect);
  }

  function sign(uint256 _junoId) external whenNotPaused {
    require(msg.sender != address(0));

    Juno storage juno = junos[_junoId];
    juno.signTime = uint64(now);

    emit Sign(msg.sender, _junoId);
  }

  function getAllJunos() external view returns (uint256[]) {
    return junoIds;
  }

  function getJunoLight(uint256 _junoId) external view returns (string groom, string bride, uint64 startTime) {
    require(msg.sender != address(0));
    
    Juno memory juno = junos[_junoId];
    groom = juno.groom;
    bride = juno.bride;
    startTime = juno.startTime;
  }

  function getJunoAll(uint256 _junoId) external view returns (string groom, string bride, uint64 signTime) {
    require(msg.sender != address(0));
    
    Juno memory juno = junos[_junoId];
    groom = juno.groom;
    bride = juno.bride;
    signTime = juno.signTime;
  }
}