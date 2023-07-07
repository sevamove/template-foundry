# Foundry Template

<br/>
<p align="center">
<img src="https://book.getfoundry.sh/images/foundry-banner.png" alt="Foundry banner">
</a>
</p>
<br/>

## Technology Stack & Tools

- [Chainlink](https://docs.chain.link/) (Allows securely connect smart contracts with off-chain data and services)
- [Ethereum](https://ethereum.org/en/) (Decentralized, open-source blockchain with smart contract functionality)
- [Foundry](https://eth-brownie.readthedocs.io/en/stable/toctree.html#) (Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.)
- [Just](https://github.com/casey/just) (`just` is a handy way to save and run project-specific commands)
- [OpenZeppelin](https://docs.openzeppelin.com/contracts/4.x/) (A library for secure smart contract development)
- [Solidity](https://docs.soliditylang.org/en/latest/index.html) (High-level language for implementing smart contracts)

# Getting Started

## Prerequisite

Please install or have installed the following:

- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
  - You'll know you've done it right if you can run `git --version`
- [Yarn](https://classic.yarnpkg.com/lang/en/docs/install/#mac-stable)
  - Check that Yarn is installed by running: `yarn --version`
- [Foundry](https://github.com/foundry-rs/foundry#installation)
  - You can test you've installed them right by running: `forge --version`
- [Just](https://github.com/casey/just#packages)
  - `just` is an improved command runner and equivalent to `make`. You can check if you have it by running: `just --version`

## Quickstart

```bash
forge init <PROJECT_NAME> --template https://github.com/sevasoft/template-foundry
cd <PROJECT_NAME>
just init
```
