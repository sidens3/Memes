//
//  GeneratorViewController.swift
//  Memes
//
//  Created by Михаил Зиновьев on 27.11.2021.
//

import UIKit

class GeneratorViewController: UIViewController {
    private let generatorManager = GeneratorManager()

    override func viewDidLoad() {
        super.viewDidLoad()

//        testApi()
        generatorManager.fetchMeme(meme: MemeRequestModel(topText: "",
                                                          bottomText: "",
                                                          memeName: "Condescending-Wonka",
                                                          fontSize: "50",
                                                          font: "Impact"))
    }
}

//MARK: - Private
private extension GeneratorViewController {
    func testApi() {
        let headers = [
            "x-rapidapi-host": "ronreiter-meme-generator.p.rapidapi.com",
            "x-rapidapi-key": "b47c20d26fmsh9a638b90d3c84fcp1de599jsn6eae9cde9d97"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://ronreiter-meme-generator.p.rapidapi.com/meme?top=Top%20Text&bottom=Bottom%20Text&meme=Condescending-Wonka&font_size=50&font=Impact")! as URL,
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
