//
//  Pokemon.swift
//  Pokedex_Foundation_iOS
//
//  Created by Pedro Akira Cardoso Toma on 10/02/26.
//

import SwiftUI

// Informações simplificadas de um pokémon
struct Pokemon: Codable, Identifiable {
    
    let name: String
    let url: String
    var id: String {url}
}

// Lista de Pokémons
struct PokemonList: Codable {
    var results: [Pokemon]
}

// Pokemon Data - Informações de pokémons específicos
struct PokemonData: Codable {
    let id: Int
    let name: String
    let sprites: Sprites
    let types: [TypeSlot]
    let stats: [Stat]
    let height: Int
    let weight: Int
    let moves: [Move]
}

struct TypeSlot: Codable {
    let slot: Int
    let type: TypeDetail
}

struct TypeDetail: Codable {
    let name: String
}

struct Sprites: Codable {
    let other: OtherSprites
}

struct OtherSprites: Codable {
    let officialArtwork: OfficialArtwork
    
    // resolve problem with item in JSON not in snake case
    enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }
}

struct OfficialArtwork: Codable {
    let frontDefault: String
}

struct Stat: Codable {
    let baseStat: Int
    let stat: StatName
}

struct StatName: Codable {
    let name: String
}

// Moves Info
struct Move: Codable {
    let move: MoveBasicInfo
    let versionGroupDetails: [MoveVersion]
}

struct MoveBasicInfo: Codable {
    let url: String
}

struct MoveVersion: Codable {
    let levelLearnedAt: Int
    let versionGroup: GameVersion
}

struct GameVersion: Codable {
    let name: String
}

// Moves Specific Info (new url)
struct MoveData: Codable {
    let name: String
    let power: Int?
    let pp: Int
    let accuracy: Int?
    let type: MoveTypeDetail
    let damageClass: MoveClass
}

struct MoveTypeDetail: Codable {
    let name: String
}

struct MoveClass: Codable {
    let name: String
}

