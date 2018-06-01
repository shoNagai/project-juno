pragma solidity ^0.4.23;

import "zeppelin-solidity/contracts/token/ERC721/ERC721Token.sol";
import "./Mortal.sol";
import "./Pausable.sol";

contract JunoToken is ERC721Token, Mortal, Pausable {

  struct Couple {
    string groom;
    string bride;
    address groomAddr;
    address brideAddr;
    uint256 junoPoint;
    uint64 mintTime;
  }

  Couple[] Couples;

  mapping (address => uint256[]) internal coupleTokens;

  constructor() public ERC721Token("JunoToken", "JUN") {}

  function mint(string _groom, string _bride, address _groomAddr, address _brideAddr) external whenNotPaused returns(uint256) {
    require(msg.sender != address(0));

    Couple memory couple = Couple({
      groom: _groom,
      bride: _bride,
      groomAddr: _groomAddr,
      brideAddr: _brideAddr,
      junoPoint: 10,
      mintTime: uint64(now)
    });

    uint256 tokenId = Couples.push(couple) - 1;
    super._mint(msg.sender, tokenId);

    coupleTokens[_groomAddr].push(tokenId);
    coupleTokens[_brideAddr].push(tokenId);

    return tokenId;
  }

  function burn(uint256 _tokenId) external onlyOwnerOf(_tokenId) {
    super._burn(msg.sender, _tokenId);
  }

  function getAllCouples() external view returns (uint256[]) {
    return allTokens;
  }

  function getCouples() external view returns (uint256[]) {
    // require(_target != address(0));
    return coupleTokens[msg.sender];
  }

  function getCouple(uint256 _tokenId) external view
   returns (string groom, string bride, uint256 junoPoint, uint64 mintTime) {
    
    Couple memory couple = Couples[_tokenId];
    groom = couple.groom;
    bride = couple.bride;
    junoPoint = couple.junoPoint;
    mintTime = couple.mintTime;

  }
}
