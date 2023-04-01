//
//  ProgressBar.swift
//  TriviaGames
//
//  Created by MacBook Pro on 30/03/23.
//

import SwiftUI

struct ProgressBar: View {
    var progressBarr: CGFloat
    var body: some View {
        ZStack(alignment: .leading){
            Rectangle()
                .frame(maxWidth:350,maxHeight: 4)
                .foregroundColor(.yellow)
                .cornerRadius(10)
            Rectangle()
                .frame(maxWidth:progressBarr,maxHeight: 4)
                .foregroundColor(.accentColor)
                .cornerRadius(10)
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(progressBarr: 10)
    }
}
