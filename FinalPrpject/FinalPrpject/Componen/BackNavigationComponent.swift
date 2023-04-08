//
//  BackNavigationComponent.swift
//  FinalPrpject
//
//  Created by MacBook Pro on 02/04/23.
//

import SwiftUI

struct BackNavigationComponent: View {
    var body: some View {
        HStack(){
            Image(systemName: "chevron.left")
                .foregroundColor(.white)
                .padding(.vertical,10)
                .padding(.horizontal)
                .background(Color.blue.opacity(0.4))
                .cornerRadius(10)
                .padding()
            Spacer()
        }
      
    }
}

struct BackNavigationComponent_Previews: PreviewProvider {
    static var previews: some View {
        BackNavigationComponent()
    }
}
