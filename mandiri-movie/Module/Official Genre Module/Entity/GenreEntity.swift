//
//  GenreEntity.swift
//  mandiri-movie
//
//  Created by Isaac on 6/11/23.
//

import Foundation

struct GenreBodyResponse: Codable {
    let genres: [GenreBodyFullResponse]?
}

struct GenreBodyFullResponse: Codable {
    let id: Int
    let name: String
}
