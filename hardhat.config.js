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
        "a1c209fc5850f02d2709b1330c47674151a1bbad888b0cfeafc73b2be62af6b9",    
      ]

    },
  }
};
