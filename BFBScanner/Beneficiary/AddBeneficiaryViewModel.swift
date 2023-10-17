//
//  AddBeneficiaryViewModel.swift
//  BFBScanner
//
//  Created by Faten Mahmoudi on 16/10/2023.
//

import Foundation
import Combine

final class AddBeneficiaryViewModel: ObservableObject {
  var extractedIBAN: String = "FR76 XXXX"
  @Published private(set) var isIBANextracted: Bool = false
  
  var uploadFileViewModel: UploadFileViewModel
  
  init() {
    self.uploadFileViewModel = UploadFileViewModel(with: ExtractIBANProvider())
  }
  
  func setDelegate() {
    self.uploadFileViewModel.delegate = self
  }
}

extension AddBeneficiaryViewModel: UpdateFieldsProtocol {
  func updateFields(iban: String, shouldShowInfos: Bool) {
    self.extractedIBAN = iban
    self.isIBANextracted = shouldShowInfos
  }
  
}
