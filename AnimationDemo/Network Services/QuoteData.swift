//
//  QuoteData.swift
//  AnimationDemo
//
//  Created by Brendon Cecilio on 12/31/19.
//  Copyright © 2019 Brendon Cecilio. All rights reserved.
//

import Foundation

struct Quote: Codable {
    let author: String
    let id: Int
    let quote: String
    let permalink: String
}
