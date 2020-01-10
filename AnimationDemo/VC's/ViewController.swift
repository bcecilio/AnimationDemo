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
    @IBOutlet weak var getQuoteButton: UIButton!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var cursorImage: UIImageView!
    
    var quote = [Quote]()
    
    var currentAnimation = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getQuoteButton.layer.cornerRadius = 9
        view.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        quoteView.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        yellowView.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        
        quoteView.text = "Press the Button to get a funny joke and find out who wrote it!"
    }
    
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
