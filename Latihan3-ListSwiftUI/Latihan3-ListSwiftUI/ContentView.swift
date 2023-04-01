//
//  ContentView.swift
//  Latihan3-ListSwiftUI
//
//  Created by MacBook Pro on 24/03/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack (alignment: .center, spacing: 8){
            Image(systemName:"brain.head.profile")
                .font(.system(size: 60))
                .foregroundColor(Color("blueocean"))
                .padding(.bottom,12)
            Text("Hello iOS Developer")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.red)
                .padding(.bottom,4)
            Text("ini halaman 2")
                .font(.headline)
                .foregroundColor(.green)
            Text("your time is limited, so dont waste it living someone else's life. dont be trapped by dogma-which is living with the resilt of others people thinking")
                .multilineTextAlignment(.center)
                .lineLimit(3)
                .lineSpacing(10)
                .truncationMode(.tail)
                .padding()
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
