//
//  PokeAPI.swift
//  Pokedex_Foundation_iOS
//
//  Created by Pedro Akira Cardoso Toma on 10/02/26.
//

import SwiftUI
import Foundation

struct PokeAPI {
    static func getPokemons() async throws -> [Pokemon] {
        
        let endpoint = "https://pokeapi.co/api/v2/pokemon?offset=0&limit=151"
        
        guard let url = URL(string: endpoint) else {
            throw APIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            return try decoder.decode(PokemonList.self, from: data).results
        } catch {
            throw APIError.invalidData
        }
    }
    
    static func getPokemonData(name: String) async throws -> PokemonData {
        
        let endpoint = "https://pokeapi.co/api/v2/pokemon/\(name)"
        
        guard let url = URL(string: endpoint) else {
            throw APIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            return try decoder.decode(PokemonData.self, from: data)
        } catch {
            throw APIError.invalidData
        }
        
    }
    
    static func getMoveData(url: String) async throws -> MoveData {
        
        let endpoint = url
        
        guard let url = URL(string: endpoint) else {
            throw APIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            return try decoder.decode(MoveData.self, from: data)
        } catch {
            throw APIError.invalidData
        }
        
        
    }
}
