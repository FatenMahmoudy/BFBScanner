//
//  UpdateFieldsProtocol.swift
//  BFBScanner
//
//  Created by Faten Mahmoudi on 17/10/2023.
//

import Foundation

protocol UpdateFieldsProtocol: AnyObject {
  func updateFields(iban: String, shouldShowInfos: Bool)
}
