pragma solidity ^0.4.23;

import "zeppelin-solidity/contracts/token/ERC721/ERC721Token.sol";
import "./Mortal.sol";
import "./Pausable.sol";

contract JunoToken is ERC721Token, Mortal, Pausable {

  struct Couple {
    string groom;
    string bride;
    string content;
    address groomAddr;
    address brideAddr;
    uint256 junoPoint;
    uint64 mintTime;
  }

  Couple[] Couples;

  mapping (address => uint256[]) internal coupleTokens;

  event Mint(address owner, uint256 tokenId);

  constructor() public ERC721Token("JunoToken", "JNT") {}

  function mint(string _groom, string _bride, string _content) external whenNotPaused returns(uint256) {
    require(msg.sender != address(0));

    Couple memory couple = Couple({
      groom: _groom,
      bride: _bride,
      content: _content,
      groomAddr:address(0),
      brideAddr:address(0),
      junoPoint: 10,
      mintTime: uint64(now)
    });

    uint256 tokenId = Couples.push(couple) - 1;
    super._mint(msg.sender, tokenId);

    emit Mint(msg.sender, tokenId);

    return tokenId;
  }

  function burn(uint256 _tokenId) external onlyOwnerOf(_tokenId) {
    super._burn(msg.sender, _tokenId);
  }

  function getAllCouples() external view returns (uint256[]) {
    return allTokens;
  }

  function getCouples(address _owner) external view returns (uint256[]) {
    require(_owner != address(0));
    return ownedTokens[_owner];
  }

  function getCouple(uint256 _tokenId) external view returns (string groom, string bride, string content, uint256 junoPoint, uint64 mintTime) {
    require(msg.sender != address(0));
    
    Couple memory couple = Couples[_tokenId];
    groom = couple.groom;
    bride = couple.bride;
    content = couple.content;
    junoPoint = couple.junoPoint;
    mintTime = couple.mintTime;
  }

}
