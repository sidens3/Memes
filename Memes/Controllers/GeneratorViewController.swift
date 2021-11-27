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

        generatorManager.fetchMeme(meme: MemeRequestModel(topText: "",
                                                          bottomText: "",
                                                          memeName: "Condescending-Wonka",
                                                          fontSize: "50",
                                                          font: "Impact"))
    }
}

//MARK: - Private
private extension GeneratorViewController {
    
}
