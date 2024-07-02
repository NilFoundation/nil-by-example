import { task } from "hardhat/config";

task("async-call", "Increments the counter")
.addParam("contract", "The address of the Caller contract")
.addParam("incrementer", "The address of the Incrementer contract")
.setAction(async (taskArgs, hre) => {
	// Get the contract
	const Caller = await hre.ethers.getContractFactory("Caller");
	const caller = Caller.attach(taskArgs.contract);

	// Call the call function
	console.log("Calling value...");
	const callerTx = await caller.call(taskArgs.incrementer);
	await callerTx.wait(0);

});
