//
//  BeneficiaryInfosView.swift
//  BFBScanner
//
//  Created by Faten Mahmoudi on 17/10/2023.
//

import SwiftUI

struct BeneficiaryInfosView: View {
  
  @State private var name: String = "Nom"
  @State private var accountTag: String = "Libellé"
  @State private var isAccountHolder = false
  
    var body: some View {
      VStack {
        
        Toggle("Vous êtes titulaire du compte", isOn: $isAccountHolder)
          .font(.headline)
          .foregroundStyle(.white)
          .padding(.top, 20)
        
        HStack {
          Text(Constant.nameBenef.rawValue)
            .font(.headline)
            .foregroundStyle(.white)
            .multilineTextAlignment(.leading)
            .padding(.top, 20)
          
          Spacer()
        }
        
        ZStack {
          TextField("Nom", text: $name)
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
        
        HStack {
          Text(Constant.tag.rawValue)
            .font(.headline)
            .foregroundStyle(.white)
            .multilineTextAlignment(.leading)
            .padding(.top, 20)
          
          Spacer()
        }
        
        ZStack {
          TextField("Libellé", text: $accountTag)
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
        
        Text(Constant.warning.rawValue)
          .font(.headline)
          .foregroundStyle(.white)
          .multilineTextAlignment(.leading)
          .padding(.top, 20)
        
        Button(action: {}) {
          Text("Ajouter")
        }
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .background(Color.buttonColor)
        .cornerRadius(.infinity)
        .foregroundColor(.white)
        .font(.headline)
        .padding(.all, 16)
        
      }
      .background(Color.black)
    }
}

extension BeneficiaryInfosView {
  enum Constant: String {
    case warning = "Attention : les propositions de placements financiers miraculeux (tous placements atypiques à fort rendement...) sont le plus souvent des arnaques. Vérifiez systématiquement sur le site de l'Autorité des Marchés Financiers (AMF), en particulier avant tout virement vers l'étranger. Le Service Client BforBank se tient également à votre disposition."
    case nameBenef = "Nom du bénéficiaire"
    case tag = "Libellé du compte"
  }
}

#Preview {
    BeneficiaryInfosView()
}
