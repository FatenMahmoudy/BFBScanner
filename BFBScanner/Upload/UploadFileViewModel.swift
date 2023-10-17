//
//  UploadFileViewModel.swift
//  BFBScanner
//
//  Created by Faten Mahmoudi on 17/10/2023.
//

import Foundation
import Combine
import UIKit

final class UploadFileViewModel: ObservableObject {
  
  private let provider: ExtractIBANProviderType
  private(set) var extractedIBAN: String = "FR76 XXXX"
  private(set) var isIBANextracted: Bool = false
  weak var delegate: UpdateFieldsProtocol?
  
  
  init(with provider: ExtractIBANProviderType, delegate: UpdateFieldsProtocol? = nil) {
    self.provider = provider
    self.delegate = delegate
  }
  
  func updateFields(image: UIImage) {
    guard let cgImage = image.cgImage else {
      print("Failed to get CGImage from image")
      return
    }
    (extractedIBAN,isIBANextracted ) = provider.extractIBAN(from: cgImage)
    self.delegate?.updateFields(iban: extractedIBAN, shouldShowInfos: isIBANextracted)
  }
  
}
