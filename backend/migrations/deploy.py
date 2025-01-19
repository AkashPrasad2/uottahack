import os
from starknet_py.net.networks import TESTNET
from starknet_py.contract import Contract
from starknet_py.net.gateway_client import GatewayClient


async def deploy():
    client = GatewayClient(net=TESTNET)
    compiled_contract_path = "../compiled/posts.json"

    with open(compiled_contract_path, "r") as file:
        compiled_contract = file.read()

    deployment_result = await Contract.deploy(
        client=client,
        compiled_contract=compiled_contract
    )

    print(
        f"Contract deployed at: {deployment_result.deployed_contract.address}")

if __name__ == "__main__":
    import asyncio
    asyncio.run(deploy())
