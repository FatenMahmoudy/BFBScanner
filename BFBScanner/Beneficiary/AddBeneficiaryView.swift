//
//  AddBeneficiaryView.swift
//  BFBScanner
//
//  Created by Faten Mahmoudi on 16/10/2023.
//

import SwiftUI

struct AddBeneficiaryView: View {
  
  @State private var isScannerLinkActive = false
  @ObservedObject private var viewModel = AddBeneficiaryViewModel()
  
  init() {
    self.viewModel.setDelegate()
  }
  
  var body: some View {
    NavigationStack {
      ScrollView {
        VStack(spacing: 20) {
          
          Text("Scannez, importez ou saisissez l'IBAN")
            .font(.headline)
            .foregroundStyle(.gray)
            .lineLimit(1)
            .multilineTextAlignment(.leading)
            .padding(.top, 20)
          
          HStack(alignment: .top, spacing: 30) {
            
            NavigationLink(destination: ScanIBANView(), isActive: $isScannerLinkActive) {
              
              Button(action: {
                self.isScannerLinkActive = true
              }) {
                HStack {
                  Image(systemName: "camera.fill")
                  Text("Scanner")
                }
                
              }
              .padding()
              .foregroundColor(.buttonColor)
              .cornerRadius(.infinity)
              .overlay(
                RoundedRectangle(cornerRadius: .infinity)
                  .stroke(Color.buttonColor, lineWidth: 2)
              )
              
            }
            
            UploadFileView(viewModel: viewModel.uploadFileViewModel)
            
          }
          
          ZStack {
            TextField("FR76 XXXX", text: $viewModel.extractedIBAN)
              .padding()
              .foregroundColor(.white)
              .background(Color.secondary)
            
            Divider()
              .background(
                Color.white
                  .frame(height: 2)
                  .offset(y: 20)
              )
            
          }
          .background(Color.gray)
          
          if viewModel.isIBANextracted == true {
            BeneficiaryInfosView()
          }
          
          Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
          ToolbarItem(placement: .principal) {
            Text("Ajouter un bénéficiaire")
              .font(.headline)
              .foregroundColor(.white)
          }
        }
        .frame(maxWidth: .infinity)
        .background(Color.black)
        
      }
      .background(Color.black)
    }
    
  }
}

#Preview {
  AddBeneficiaryView()
}
