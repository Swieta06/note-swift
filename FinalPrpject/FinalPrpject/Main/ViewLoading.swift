//
//  ViewLoading.swift
//  FinalPrpject
//
//  Created by MacBook Pro on 01/04/23.
//

import SwiftUI

var loadingView: some View {
    ProgressView()
        .progressViewStyle(CircularProgressViewStyle())
        .scaleEffect(2)
        .padding()
        .background(Color.white.opacity(0.75))
        .cornerRadius(10)
    
}



//struct ViewLoading_Previews:PreviewProvider{
//    static var previews: some View {
//       loadingView
//    }
//}
