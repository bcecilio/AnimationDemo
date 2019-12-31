//
//  QuoteAPI.swift
//  AnimationDemo
//
//  Created by Brendon Cecilio on 12/31/19.
//  Copyright © 2019 Brendon Cecilio. All rights reserved.
//

import Foundation

struct QuoteAPI {
    static func fetchQuote(completion: @escaping (Result<Quote,AppError>) -> ()) {
        
        let endpointURL = "https://ron-swanson-quotes.herokuapp.com/v2/quotes"
        
        guard let url = URL(string: endpointURL) else {
            completion(.failure(.badURL(endpointURL)))
            return
        }
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let quoteData = try JSONDecoder().decode(Quote.self, from: data)
                    let quote = quoteData
                    completion(.success(quote))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
}
