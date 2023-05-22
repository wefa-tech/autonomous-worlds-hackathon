// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/* Autogenerated file. Do not edit manually. */

// Import schema type
import { SchemaType } from "@latticexyz/schema-type/src/solidity/SchemaType.sol";

// Import store internals
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { StoreCore } from "@latticexyz/store/src/StoreCore.sol";
import { Bytes } from "@latticexyz/store/src/Bytes.sol";
import { Memory } from "@latticexyz/store/src/Memory.sol";
import { SliceLib } from "@latticexyz/store/src/Slice.sol";
import { EncodeArray } from "@latticexyz/store/src/tightcoder/EncodeArray.sol";
import { Schema, SchemaLib } from "@latticexyz/store/src/Schema.sol";
import { PackedCounter, PackedCounterLib } from "@latticexyz/store/src/PackedCounter.sol";

// Import user types
import { RoleEnum } from "./../Types.sol";

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16("checkers"), bytes16("Role")));
bytes32 constant RoleTableId = _tableId;

library Role {
  /** Get the table's schema */
  function getSchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](1);
    _schema[0] = SchemaType.UINT8;

    return SchemaLib.encode(_schema);
  }

  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](2);
    _schema[0] = SchemaType.ADDRESS;
    _schema[1] = SchemaType.BYTES32;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's metadata */
  function getMetadata() internal pure returns (string memory, string[] memory) {
    string[] memory _fieldNames = new string[](1);
    _fieldNames[0] = "value";
    return ("Role", _fieldNames);
  }

  /** Register the table's schema */
  function registerSchema() internal {
    StoreSwitch.registerSchema(_tableId, getSchema(), getKeySchema());
  }

  /** Register the table's schema (using the specified store) */
  function registerSchema(IStore _store) internal {
    _store.registerSchema(_tableId, getSchema(), getKeySchema());
  }

  /** Set the table's metadata */
  function setMetadata() internal {
    (string memory _tableName, string[] memory _fieldNames) = getMetadata();
    StoreSwitch.setMetadata(_tableId, _tableName, _fieldNames);
  }

  /** Set the table's metadata (using the specified store) */
  function setMetadata(IStore _store) internal {
    (string memory _tableName, string[] memory _fieldNames) = getMetadata();
    _store.setMetadata(_tableId, _tableName, _fieldNames);
  }

  /** Get value */
  function get(address user, bytes32 gameId) internal view returns (RoleEnum value) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint160((user))));
    _keyTuple[1] = bytes32((gameId));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 0);
    return RoleEnum(uint8(Bytes.slice1(_blob, 0)));
  }

  /** Get value (using the specified store) */
  function get(IStore _store, address user, bytes32 gameId) internal view returns (RoleEnum value) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint160((user))));
    _keyTuple[1] = bytes32((gameId));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 0);
    return RoleEnum(uint8(Bytes.slice1(_blob, 0)));
  }

  /** Set value */
  function set(address user, bytes32 gameId, RoleEnum value) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint160((user))));
    _keyTuple[1] = bytes32((gameId));

    StoreSwitch.setField(_tableId, _keyTuple, 0, abi.encodePacked(uint8(value)));
  }

  /** Set value (using the specified store) */
  function set(IStore _store, address user, bytes32 gameId, RoleEnum value) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint160((user))));
    _keyTuple[1] = bytes32((gameId));

    _store.setField(_tableId, _keyTuple, 0, abi.encodePacked(uint8(value)));
  }

  /** Tightly pack full data using this table's schema */
  function encode(RoleEnum value) internal view returns (bytes memory) {
    return abi.encodePacked(value);
  }

  /** Encode keys as a bytes32 array using this table's schema */
  function encodeKeyTuple(address user, bytes32 gameId) internal pure returns (bytes32[] memory _keyTuple) {
    _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint160((user))));
    _keyTuple[1] = bytes32((gameId));
  }

  /* Delete all data for given keys */
  function deleteRecord(address user, bytes32 gameId) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint160((user))));
    _keyTuple[1] = bytes32((gameId));

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, address user, bytes32 gameId) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32(uint256(uint160((user))));
    _keyTuple[1] = bytes32((gameId));

    _store.deleteRecord(_tableId, _keyTuple);
  }
}
