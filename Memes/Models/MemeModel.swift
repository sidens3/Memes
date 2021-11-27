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
    let fontSize: String
    let font: String
}

struct MemeResponseModel {
    let url: String
}
