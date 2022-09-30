# Solidity-Assignment-2
Solidity assignment Assignment : Election2022

Candidate to pay <0.1/something> ether/wei to register to election, no registration if not paying enough. -- payable function -- require , msg.value

ElectionCommission is another contract and can only approve a candidate before the election, but aleast 10 mins before election start -- multi contract call -- import

Only Election Commission decides on the Start and Stop time -- block.timestamp

Only an approved candidate can participate in elections

Anybody can vote, but only between the start and end date. And only once

ElectionCommision can announce results only after Stop Time

Only ElectionCommision can withdraw funds after election. payable address withdraw

Tech Requirements:

2 contracts, ElectionCommision and Election2022
Use payable to pay ether
Show contract calls using various methods
Assignment 2 : Submit on the github and share me the location

Add Appropriate Events to the existing code

Add error handling

Add self destruct to Election2022 contract, which can only be called by Election Commission.

Use a different set of files (new project)and create Election2022 contract using new in ElectionCommision
