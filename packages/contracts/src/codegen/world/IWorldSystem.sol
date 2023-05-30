// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/* Autogenerated file. Do not edit manually. */

interface IWorldSystem {
  function createWorld(string memory name, string memory description, string memory image) external returns (bytes32);

  function claimSpace(bytes32 worldId) external returns (bytes32);
}
