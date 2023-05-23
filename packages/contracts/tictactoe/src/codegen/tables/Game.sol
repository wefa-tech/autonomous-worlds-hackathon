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

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16("tictactoe"), bytes16("Game")));
bytes32 constant GameTableId = _tableId;

struct GameData {
  address winner;
  uint8 matchesPlayed;
}

library Game {
  /** Get the table's schema */
  function getSchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](2);
    _schema[0] = SchemaType.ADDRESS;
    _schema[1] = SchemaType.UINT8;

    return SchemaLib.encode(_schema);
  }

  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](2);
    _schema[0] = SchemaType.BYTES32;
    _schema[1] = SchemaType.BYTES32;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's metadata */
  function getMetadata() internal pure returns (string memory, string[] memory) {
    string[] memory _fieldNames = new string[](2);
    _fieldNames[0] = "winner";
    _fieldNames[1] = "matchesPlayed";
    return ("Game", _fieldNames);
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

  /** Get winner */
  function getWinner(bytes32 gameId, bytes32 gridId) internal view returns (address winner) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32((gameId));
    _keyTuple[1] = bytes32((gridId));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 0);
    return (address(Bytes.slice20(_blob, 0)));
  }

  /** Get winner (using the specified store) */
  function getWinner(IStore _store, bytes32 gameId, bytes32 gridId) internal view returns (address winner) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32((gameId));
    _keyTuple[1] = bytes32((gridId));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 0);
    return (address(Bytes.slice20(_blob, 0)));
  }

  /** Set winner */
  function setWinner(bytes32 gameId, bytes32 gridId, address winner) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32((gameId));
    _keyTuple[1] = bytes32((gridId));

    StoreSwitch.setField(_tableId, _keyTuple, 0, abi.encodePacked((winner)));
  }

  /** Set winner (using the specified store) */
  function setWinner(IStore _store, bytes32 gameId, bytes32 gridId, address winner) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32((gameId));
    _keyTuple[1] = bytes32((gridId));

    _store.setField(_tableId, _keyTuple, 0, abi.encodePacked((winner)));
  }

  /** Get matchesPlayed */
  function getMatchesPlayed(bytes32 gameId, bytes32 gridId) internal view returns (uint8 matchesPlayed) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32((gameId));
    _keyTuple[1] = bytes32((gridId));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 1);
    return (uint8(Bytes.slice1(_blob, 0)));
  }

  /** Get matchesPlayed (using the specified store) */
  function getMatchesPlayed(IStore _store, bytes32 gameId, bytes32 gridId) internal view returns (uint8 matchesPlayed) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32((gameId));
    _keyTuple[1] = bytes32((gridId));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 1);
    return (uint8(Bytes.slice1(_blob, 0)));
  }

  /** Set matchesPlayed */
  function setMatchesPlayed(bytes32 gameId, bytes32 gridId, uint8 matchesPlayed) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32((gameId));
    _keyTuple[1] = bytes32((gridId));

    StoreSwitch.setField(_tableId, _keyTuple, 1, abi.encodePacked((matchesPlayed)));
  }

  /** Set matchesPlayed (using the specified store) */
  function setMatchesPlayed(IStore _store, bytes32 gameId, bytes32 gridId, uint8 matchesPlayed) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32((gameId));
    _keyTuple[1] = bytes32((gridId));

    _store.setField(_tableId, _keyTuple, 1, abi.encodePacked((matchesPlayed)));
  }

  /** Get the full data */
  function get(bytes32 gameId, bytes32 gridId) internal view returns (GameData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32((gameId));
    _keyTuple[1] = bytes32((gridId));

    bytes memory _blob = StoreSwitch.getRecord(_tableId, _keyTuple, getSchema());
    return decode(_blob);
  }

  /** Get the full data (using the specified store) */
  function get(IStore _store, bytes32 gameId, bytes32 gridId) internal view returns (GameData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32((gameId));
    _keyTuple[1] = bytes32((gridId));

    bytes memory _blob = _store.getRecord(_tableId, _keyTuple, getSchema());
    return decode(_blob);
  }

  /** Set the full data using individual values */
  function set(bytes32 gameId, bytes32 gridId, address winner, uint8 matchesPlayed) internal {
    bytes memory _data = encode(winner, matchesPlayed);

    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32((gameId));
    _keyTuple[1] = bytes32((gridId));

    StoreSwitch.setRecord(_tableId, _keyTuple, _data);
  }

  /** Set the full data using individual values (using the specified store) */
  function set(IStore _store, bytes32 gameId, bytes32 gridId, address winner, uint8 matchesPlayed) internal {
    bytes memory _data = encode(winner, matchesPlayed);

    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32((gameId));
    _keyTuple[1] = bytes32((gridId));

    _store.setRecord(_tableId, _keyTuple, _data);
  }

  /** Set the full data using the data struct */
  function set(bytes32 gameId, bytes32 gridId, GameData memory _table) internal {
    set(gameId, gridId, _table.winner, _table.matchesPlayed);
  }

  /** Set the full data using the data struct (using the specified store) */
  function set(IStore _store, bytes32 gameId, bytes32 gridId, GameData memory _table) internal {
    set(_store, gameId, gridId, _table.winner, _table.matchesPlayed);
  }

  /** Decode the tightly packed blob using this table's schema */
  function decode(bytes memory _blob) internal pure returns (GameData memory _table) {
    _table.winner = (address(Bytes.slice20(_blob, 0)));

    _table.matchesPlayed = (uint8(Bytes.slice1(_blob, 20)));
  }

  /** Tightly pack full data using this table's schema */
  function encode(address winner, uint8 matchesPlayed) internal view returns (bytes memory) {
    return abi.encodePacked(winner, matchesPlayed);
  }

  /** Encode keys as a bytes32 array using this table's schema */
  function encodeKeyTuple(bytes32 gameId, bytes32 gridId) internal pure returns (bytes32[] memory _keyTuple) {
    _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32((gameId));
    _keyTuple[1] = bytes32((gridId));
  }

  /* Delete all data for given keys */
  function deleteRecord(bytes32 gameId, bytes32 gridId) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32((gameId));
    _keyTuple[1] = bytes32((gridId));

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, bytes32 gameId, bytes32 gridId) internal {
    bytes32[] memory _keyTuple = new bytes32[](2);
    _keyTuple[0] = bytes32((gameId));
    _keyTuple[1] = bytes32((gridId));

    _store.deleteRecord(_tableId, _keyTuple);
  }
}