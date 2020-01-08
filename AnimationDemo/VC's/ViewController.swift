//
//  ViewController.swift
//  AnimationDemo
//
//  Created by Brendon Cecilio on 12/27/19.
//  Copyright © 2019 Brendon Cecilio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var quoteView: UITextView!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var ronImage: UIImage!
    @IBOutlet weak var getEnlightenedButton: UIButton!
    
    var quote = [Quote]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//    func loadData() {
//        QuoteAPI.fetchQuote { (result) in
//            switch result {
//            case .failure(let appError):
//                DispatchQueue.main.async {
//                    self.showAlert(title: "App Error", message: "\(appError)")
//                }
//            case .success(let randomQuote):
//                self.quote =
//            }
//        }
//    }
    
    @IBAction func getQuoteButton(_ sender: UIButton) {
        
        QuoteAPI.fetchQuote { [weak self] (result) in
            switch result {
            case .failure(let appError):
                DispatchQueue.main.async {
                    self?.showAlert(title: "App Error", message: "\(appError)")
                }
            case .success(let randomQuote):
                DispatchQueue.main.async {
                    self?.quoteView.text = randomQuote.quote
                    self?.author.text = " - \(randomQuote.author )"
                }
            }
        }
    }
}
