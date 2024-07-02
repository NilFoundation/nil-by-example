const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

// biome-ignore lint: type is not exported
module.exports = buildModule("CallerModule", (m: any) => {
  const incrementer = m.contract("Caller");

  return { incrementer };
});
