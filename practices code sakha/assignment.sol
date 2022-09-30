1---------


//SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

contract helloWorld {
	function helloWorld()public returns(string memory){
		return "HelloWorld";
	}
}





2-----------



//SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

contract factorial{
	uint number;
	uint fac=1;
	uint i;
	function fact(uint x) public pure returns(uint){
		number= x;
		for(i=1; i<=x; i++){
			fac = fac*(i);
		}
	return fac;
	}
}




4----------


// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.10;

contract Palindrome{

    address payable Manager = payable(0x617F2E2fD72FD9D5503197092aC168c91465E7f2);
    
    function payEther() public payable{

    }

    function sendEther(string memory word) public returns(string memory){

        bytes memory new_word = bytes(word);               

        string memory len = new string(new_word.length);   
        bytes memory nw1 = bytes(len);                     

        for(uint i = 0; i<new_word.length; i++){
            nw1[new_word.length-i-1] = new_word[i];
        }

        string memory s;

        if(keccak256(abi.encodePacked(word)) == keccak256(abi.encodePacked(nw1))){

            Manager.transfer(50 ether);
            s = "SendingDone";
        }
        else{
            s = "false";
        }
        return s;
    }
}





5-----------

// SPDX-License-Identifier: MIT
pragmasolidity^0.8.7;

contractTime{
    functiongetTime(uint time)publicviewreturns(uint){
        if(time>block.timestamp){
            return time+4830;  
        }
        else{
            return0;
        }
    }
}


6-----------


// SPDX-License-Identifier: MIT
pragmasolidity^0.8.7;
contractThreeAndSeven{
    functioncheck(intnum)publicpurereturns(bool){
    if(num%3==0&& num%7==0) 
    {
        if(num>10){
            returntrue;
        }
        else{
            returnfalse;
        }
    }
      
    }
}




7-----------



pragma solidity ^0.5.0;

contract Test
{
    
    int num;
    string num_type;
    
    
    function set(int n) public
    {
       if(n%2==0)
       {
           num_type='even';
       }
       else
       {
           num_type='odd';
       }
        
    }
    
    function get() public view returns(string memory)
    {
        return num_type;
    }

}



8---------


// SPDX-License-Identifier: MIT
pragmasolidity^0.8.7;

contract Calculator{
  //addition
    function add(uint a,uint b)public pure returns(uint){
	uint x;
	x=a+b;
        return x;
    }
    //subtraction
    function subtract(uint a,uint b)public pure returns(uint){
        uint x;
	x=a-b;
	return x;
    }
     //multiplication
    function multiply(uint a,uint b)public pure returns(uint)
    {
	uint x;
	x=a*b;
        return x;
    }
     //division
    function division(uint a,uint b)public pure returns(uint){
        uint x;
	x=a/b;
	return x;

    }
    
}



9----------


//SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

contract sumofdigit{
    function digit(uint n) public pure returns(uint){
        uint m;
        uint sum=0;
        while(n>0){
            m=n%10;
            sum=sum+m;
            n=n/10;
        }
        return sum;
    }
}



10-----------

// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.10;

struct student{
        string Name;
        uint Class;
        string JoiningDate;
    }

contract AttendanceRegister{

    address public Teacher = msg.sender;
    mapping (uint => student) public data;
    event Register(address Teacher, student Data);

    modifier onlyTeacher() {
        require(Teacher == msg.sender, "You are not a teacher");
        _;
    }

    function add(uint check, string memory name, uint class, string memory date) public onlyTeacher {

        data[check] = student(name,class,date);
        emit Register(msg.sender, data[check]);
    }
}
