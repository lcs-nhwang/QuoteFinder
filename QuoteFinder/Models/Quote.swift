//
//  Quote.swift
//  QuoteFinder
//
//  Created by Nicholas Hwang on 5/3/2025.
//

import Foundation

struct Quote: Identifiable, Codable {
    //MARK: Stored Properties
    let quoteText: String?
    let quoteAuthor: String?
    let senderName: String?
    let senderLink: String?
    let id: Int
}
let exampleQuote = Quote(
    quoteText: "a",
    quoteAuthor: "b",
    senderName: "c",
    senderLink: "d",
    id: 123
)
