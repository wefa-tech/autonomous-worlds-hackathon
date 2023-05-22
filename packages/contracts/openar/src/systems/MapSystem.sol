// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { System } from "@latticexyz/world/src/System.sol";
import { getUniqueEntity } from "@latticexyz/world/src/modules/uniqueentity/getUniqueEntity.sol";

import { SizeEnum, StateEnum } from "../codegen/Types.sol";
import { Map, Identity, IdentityData, Size, State } from "../codegen/Tables.sol";

contract MapSystem is System {
  function createMap(
    string memory name,
    string memory description,
    string memory image,
    SizeEnum size
  ) public returns (bytes32) {
    address owner = _msgSender();
    bytes32 mapId = getUniqueEntity();

    Identity.set(mapId, IdentityData({
      name: name,
      description: description,
      image: image
    }));
    Map.set(owner, mapId);    
    // Size.set(mapId. SizeEnum.Small); // 27x27 grid broken into 9x9 squares.
    State.set(mapId, StateEnum.Active);

    return mapId;
  }
}
