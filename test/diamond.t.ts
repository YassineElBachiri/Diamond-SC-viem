const { hre } = require('hardhat');
import { expect } from "chai";
import { loadFixture } from "@nomicfoundation/hardhat-toolbox-viem/network-helpers";



const deployDiamond = async () => {
  const diamond = await hre.viem.deployContract('Diamond');

  return { diamond };

  
};



// // A deployment function to set up the initial state
// const deploy = async () => {
//   const erc20Package = await hre.viem.deployContract("ERC20Package");

//   return { erc20Package };
// };

// describe("ERC20Package Contract Tests", function () {
//   it("should mint tokens correctly", async function () {
//     // Load the contract instance using the deployment function
//     const { erc20Package } = await loadFixture(deploy);

//     // Mint some tokens
//     await erc20Package.write.mint(await hre.viem.getSigner().getAddress(),  1000);

//     // Check the balance
//     const balance = await erc20Package.read.balanceOf(await hre.viem.getSigner().getAddress());

//     // Assert that the balance is correct
//     expect(balance).to.equal(1000);
//   });

//   it("should transfer tokens correctly", async function () {
//     // Load the contract instance using the deployment function
//     const { erc20Package } = await loadFixture(deploy);

//     // Mint some tokens
//     await erc20Package.write.mint(await hre.viem.getSigner().getAddress(),  1000);

//     // Transfer some tokens
//     const recipientAddress = "0x1234567890123456789012345678901234567890"; // Example recipient address
//     await erc20Package.write.transfer(recipientAddress,  500);

//     // Check the balance of the recipient
//     const recipientBalance = await erc20Package.read.balanceOf(recipientAddress);

//     // Assert that the recipient's balance is correct
//     expect(recipientBalance).to.equal(500);

//     // Check the balance of the sender
//     const senderBalance = await erc20Package.read.balanceOf(await hre.viem.getSigner().getAddress());

//     // Assert that the sender's balance is correct
//     expect(senderBalance).to.equal(500);
//   });

//   // Additional tests can be added here...

// });