// SPDX-License-Identifier:MIT
pragma solidity 0.8.15;
import "ERC721.sol";
contract NFTMarket is ERC721
{   
      address owner;
      uint256 public nftCounter;
      mapping(uint256=>bool) listed_Token;      
      uint256 price;
      string _name;
      string _symbol;
      uint256 id;
      uint a = 2;
      uint b = 100;
      uint c = a/b;
      uint d = price*c;
     constructor()  ERC721("","")       
       {          owner = msg.sender ;     }
   
    function mintNFT(string memory name_, string memory symbol_,uint256 _price) external payable 
  {
      
        require(msg.sender!=address(0) ,"owner address is zero");
        require( _price > 0, " price must be greater than 0 ");
        require(msg.value >0 , "value not equal to zero");          
     
        nftCounter++;
        // check if a token exists with the above token id => incremented counter
        require(!_exists(nftCounter));         
        _mint(msg.sender, nftCounter);
        price = _price;      
        _name = name_;
        _symbol = symbol_;
  }
       function listed(uint256 token_id)external 
       {
            listed_Token[token_id] = true;
       }
       function buy(uint256 token_id)public payable
       {
         require(listed_Token[token_id] = true);
      //  require( msg.value = price); 
        
         require(msg.sender != address(0));   
        require(_exists(token_id));     
        address tokenOwner = ownerOf(token_id);
     
        require(tokenOwner != address(0));    
        require(tokenOwner != msg.sender);
           _transfer(tokenOwner, msg.sender,token_id );
           
       }
}