//
//  UploadFileView.swift
//  BFBScanner
//
//  Created by Faten Mahmoudi on 17/10/2023.
//

import SwiftUI
import PhotosUI
import Vision

struct UploadFileView: View {
  
  @ObservedObject private(set) var viewModel: UploadFileViewModel
  
  @State private var selectedItem: PhotosPickerItem? = nil
  @State private var selectedImageData: Data? = nil
  
  init(viewModel: UploadFileViewModel) {
    self.viewModel = viewModel
  }
  
  var body: some View {
    
    PhotosPicker(
      selection: $selectedItem,
      matching: .images,
      photoLibrary: .shared()) {
        HStack {
          Image(systemName: "square.and.arrow.up")
          Text("Importer")
        }
      }
      .padding()
      .foregroundColor(.buttonColor)
      .cornerRadius(.infinity)
      .overlay(
        RoundedRectangle(cornerRadius: .infinity)
          .stroke(Color.buttonColor, lineWidth: 2)
      )
      .onChange(of: selectedItem) { newItem in
        Task {
          if let data = try? await newItem?.loadTransferable(type: Data.self) {
            selectedImageData = data
            if let selectedImageData,
               let uiImage = UIImage(data: selectedImageData) {
              viewModel.updateFields(image: uiImage)
            }
          }
        }
      }
  }
  
}

#Preview {
  UploadFileView(viewModel: UploadFileViewModel(with: ExtractIBANProvider(), delegate: nil))
}
