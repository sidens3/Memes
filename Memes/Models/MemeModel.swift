//
//  MemeModel.swift
//  Memes
//
//  Created by Михаил Зиновьев on 27.11.2021.
//

import Foundation

struct MemeRequestModel {
    let topText: String
    let bottomText: String
    let memeName: String
    let fontSize: String?
    let font: String?
    
    var url: URL? {
        URL(string: "https://ronreiter-meme-generator.p.rapidapi.com/meme?top=\(topText)&bottom=\(bottomText)&meme=\(memeName)&font_size=\(fontSize ?? "50")&font=\(font ?? "Impact")")
    }
}

struct MemeResponseModel: Codable {
    let type: String
}
