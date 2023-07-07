alias i := init
alias b := build
alias c := clean
alias cs := create-snapshot
alias ggf := get-gas-diff
alias tal := test-all-local

# Load .env file.
set dotenv-load := true
# Pass justfile recipe args as positional arguments.
set positional-arguments := true


# Just commandos.


default:
	@just --list


# Variables.


foundry_source := "export PATH=$PATH:$HOME/.foundry/bin"


# ⚒️ Forge commands.


init:
    pnpm install && forge install

# Build the project's smart contracts.
build:
    forge build

# Remove the build artifacts and cache directories.
clean:
    forge clean

# Deploy a smart contract on a local network.
# Example:
# {{foundry_source}} && forge script \
# script/Deployer.s.sol:Deployer \
# --sig "deploy()" \
# --rpc-url http://127.0.0.1:8545 \
# --private-key $PRIVATE_KEY_ANVIL_0 \
# --broadcast \
# -vvv
deploy-local contract_path function_signature rpc_url private_key:
    forge script \
    {{contract_path}} \
    --sig "{{function_signature}}" \
    --rpc-url {{rpc_url}} \
    --private-key {{private_key}} \
    --broadcast \
    -vvv

# Create a snapshot file of each test's gas usage.
create-snapshot:
    forge snapshot

# Compare the current shapshot file with the latest changes.
get-gas-diff:
    forge snapshot --diff

# Install one or multiple dependencies. If no arguments are provided, then existing dependencies will be installed.
install *repositories="":
    forge install {{repositories}}

remove *repositories="":
    forge remove {{repositories}}

test-all-local *v="":
    forge test -vvv{{v}}

# Run the project's tests.
test-contract-local contract_path *v="":
    forge test --match-path {{contract_path}} -vvv{{v}} --gas-report

# Create a `remappings.txt` file from the inferred remappings.
remappings:
    forge remappings > remappings.txt


# Anvil commandos.


anvil *args="":
	anvil {{args}}


# Cast commandos.


# Perform a call on an account without publishing a transaction.
call-local contract_addr function_sig rpc_url="http://127.0.0.1:8545":
    cast call {{contract_addr}} "{{function_sig}}" \
    --rpc-url {{rpc_url}}

# Sign and publish a transaction.
send-local private_key contract_addr function_sig rpc_url="http://127.0.0.1:8545":
    cast send \
    --private-key {{private_key}} {{contract_addr}} "{{function_sig}}" \
    --rpc-url {{rpc_url}}