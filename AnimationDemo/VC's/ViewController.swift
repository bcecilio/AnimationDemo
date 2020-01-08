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
    @IBOutlet weak var getEnlightenedButton: UIButton!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var cursorImage: UIImageView!
    
    var quote = [Quote]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getEnlightenedButton.layer.cornerRadius = 9
        view.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        quoteView.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        yellowView.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
    }
    
//    func animateCursor() {
//
//        cursorImage.transform = CGAffineTransform(translationX: 2, y: 2)
//        view.addSubview(cursorImage)
//    }
    
    @IBAction func getQuoteButton(_ sender: UIButton) {
        
        quoteView.transform = CGAffineTransform(scaleX: 2, y: 2)
        quoteView.transform = .identity
        
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
