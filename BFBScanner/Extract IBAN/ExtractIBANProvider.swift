//
//  ExtractIBANProvider.swift
//  BFBScanner
//
//  Created by Faten Mahmoudi on 17/10/2023.
//

import Foundation
import Vision

protocol ExtractIBANProviderType {
  func extractIBAN(from cgImage: CGImage) -> (extractedIBAN: String, isIBANextracted: Bool)
}

class ExtractIBANProvider: ExtractIBANProviderType {
  func extractIBAN(from cgImage: CGImage) -> (extractedIBAN: String, isIBANextracted: Bool) {
    
    var extractedIBAN: String = "FR76 XXXX"
    var isIBANextracted: Bool = false
    
    let requestHandler = VNImageRequestHandler(cgImage: cgImage, options: [:])
    
    let request = VNRecognizeTextRequest { request, error in
      guard let observations = request.results as? [VNRecognizedTextObservation] else {
        return
      }
      
      for observation in observations {
        guard let candidate = observation.topCandidates(1).first else {
          continue
        }
        
        if let iban = self.extractFrenchIBAN(candidate.string) {
          extractedIBAN = iban
          isIBANextracted = true
        }
      }
    }
    
    do {
      try requestHandler.perform([request])
    } catch {
      print("Error performing text recognition: \(error.localizedDescription)")
    }
    
    return (extractedIBAN, isIBANextracted)
  }
  
  func extractFrenchIBAN(_ text: String) -> String? {
    // French IBAN regex pattern
    let regex = try! NSRegularExpression(pattern: "\\bFR\\d{2}\\s?\\d{4}\\s?\\d{4}\\s?\\d{4}\\s?\\d{4}\\s?\\d{4}\\s?\\d{3}\\b")
    let range = NSRange(location: 0, length: text.utf16.count)
    
    if let match = regex.firstMatch(in: text, options: [], range: range) {
      return (text as NSString).substring(with: match.range)
    }
    
    return nil
  }
}
