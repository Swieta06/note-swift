//
//  ProgressBarComponent.swift
//  FinalPrpject
//
//  Created by MacBook Pro on 07/04/23.
//

import SwiftUI

struct ProgressBarComponent: View {
    var progress:CGFloat
    var body: some View {
        ZStack(alignment: .leading){
            Rectangle()
                .frame(maxWidth: 350,maxHeight: 4)
                .foregroundColor(Color("Secondary"))
                .cornerRadius(10)
                .opacity(0.327)
            Rectangle()
                .frame(width: progress,height: 4)
                .foregroundColor(Color("Main"))
                .cornerRadius(10)
        }
    }
}

struct ProgressBarComponent_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarComponent(progress: 50)
    }
}
