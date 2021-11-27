//
//  GeneratorManager.swift
//  Memes
//
//  Created by Михаил Зиновьев on 27.11.2021.
//

import Foundation

protocol GeneratorManagerDelegate {
    func didGenerateMeme(_ generatorManager: GeneratorManager, meme: MemeResponseModel)
    func didFailWithError( error: Error)
}

struct GeneratorManager {
    private let headers = [
        "x-rapidapi-host": "ronreiter-meme-generator.p.rapidapi.com",
        "x-rapidapi-key": "b47c20d26fmsh9a638b90d3c84fcp1de599jsn6eae9cde9d97"
    ]
    
    func fetchMeme(meme: MemeRequestModel) {
        let requestUrl = "https://ronreiter-meme-generator.p.rapidapi.com/meme?top=\(meme.topText)&bottom=\(meme.bottomText)&meme=\(meme.memeName)&font_size=\(meme.fontSize)&font=\(meme.font)"
        
        let request = NSMutableURLRequest(url: NSURL(string: requestUrl)! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
            }
        })

        dataTask.resume()
    }
}
