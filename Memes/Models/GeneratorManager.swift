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
    var delegate: GeneratorManagerDelegate?
    
    private let headers = [
        "x-rapidapi-host": "ronreiter-meme-generator.p.rapidapi.com",
        "x-rapidapi-key": "b47c20d26fmsh9a638b90d3c84fcp1de599jsn6eae9cde9d97"
    ]
    
    func fetchMeme(meme: MemeRequestModel) {
        guard let requestUrl = meme.url else { return }
        
        let request = NSMutableURLRequest(url: requestUrl,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                delegate?.didFailWithError(error: error!)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
                parseJSON(data ?? Data())
            }
        })

        dataTask.resume()
    }
    
    func parseJSON(_ memeData: Data) -> MemeResponseModel?{
        let decoder = JSONDecoder()
        do {
            print("")
            print(String(decoding: memeData, as: UTF8.self))
            print("")
            let decodedData = try decoder.decode(MemeResponseModel.self, from: memeData)
            
            let type = decodedData.type
            
            let memeResponse = MemeResponseModel(type: type)
            return memeResponse
        } catch {
            delegate?.didFailWithError(error: error)
            print("parse error detected")
            print(error.localizedDescription)
            return nil
        }
    }
}
