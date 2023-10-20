//
//  UploadFileViewModelTests.swift
//  BFBScannerTests
//
//  Created by Faten Mahmoudi on 20/10/2023.
//

import XCTest
@testable import BFBScanner

final class UploadFileViewModelTests: XCTestCase {
  
  var viewModel: UploadFileViewModel!
  
  override func setUpWithError() throws {
    viewModel = UploadFileViewModel(with: ExtractIBANProvider(), delegate: nil)
  }
  
  override func tearDownWithError() throws {
    viewModel = nil
  }
  
  func testUpdateFields() throws {
    viewModel.updateFields(image: UIImage(named: "rib")!)
    XCTAssertTrue(viewModel.isIBANextracted == true)
    XCTAssertTrue( viewModel.extractedIBAN == "FR76 4061 8802 6100 0400 0000 007")
  }
  
}
