import hre from "hardhat";
// const { hre } = require('hardhat');


async function main() {


    
  // Deploy the ERC20Package contract
  const ERC20Package = await hre.viem.deployContract("ERC20Package");
  console.log(`ERC20Package deployed at: ${ERC20Package.address}`);

  // Cut the ERC20Package facet into the Diamond
  // You would need to create a facet cut and call the diamondCut function on the Diamond contract
  // This part is not shown in the example because it depends on the specifics of your diamond implementation
  // and how you want to delegate calls to the ERC20Package contract

  // ...

  // After cutting the facet, you can interact with the Diamond contract as if it were the ERC20Package contract
  // For example, you can call ERC20 functions on the Diamond contract
  const totalSupply = await ERC20Package.read.totalSupply();
  console.log(`Total supply of Diamond (ERC20): ${totalSupply}`);


  // If you have a mint function in your ERC20Package, you can call it through the Diamond contract
  // await Diamond.write.mint(/* recipient address */, /* amount */);
  // Remember to wait for the transaction to be mined if it's a write operation
  // const publicClient = await hre.viem.getPublicClient();
  // await publicClient.waitForTransactionReceipt({ hash: /* transaction hash */ });


}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });