require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.19",
  etherscan: {
    apiKey: "4YZH1B7YDPDCXRZX545UMNKR2B3AW3GZI2",
  },
  networks: {
    testnet: {
      url: "https://data-seed-prebsc-1-s1.binance.org:8545",
      chainId: 97,
      gasPrice: 20000000000,
      accounts: [
        "0a8c4a4577bd46b6660e81342ae3775eaac6284690556a5c150ff4fc0a58f3ad",
      ]

    },
  }
};
