//
//  ExtractionError.swift
//  BFBScanner
//
//  Created by Faten Mahmoudi on 17/10/2023.
//

import Foundation

enum ExtractionError: String, Error {
    case nocgImage = "Failed to get CGImage from image"
    case technical
    case parsingFailed
}
