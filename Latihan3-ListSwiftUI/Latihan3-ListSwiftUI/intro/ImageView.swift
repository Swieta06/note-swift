//
//  ImageView.swift
//  Latihan3-ListSwiftUI
//
//  Created by MacBook Pro on 24/03/23.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        ZStack (){
            // MARK: -OVERLAY
            
            LinearGradient(colors: [Color.yellow,Color.blue,Color.purple], startPoint: .topLeading, endPoint:.bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            Image("bg_image")
                .resizable()
                .scaledToFill()
                .frame(width: 300)
                .clipShape(Circle())
                .overlay{
                    ZStack{
                        Circle()
                            .opacity(0.5)
                        HStack{
                            Image(systemName: "cloud.sun.rain")
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(.white,.yellow,.blue)
                                .font(.system(.largeTitle))
                                .opacity(0.9)
                            Text("Fruit Ninja")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                    }
                }
            
            // MARK: - Image Stack
//            Image(systemName: "cloud.hail")
//                .font(.system(size: 40))
//                .symbolRenderingMode(.hierarchical)
//                .foregroundStyle(.indigo)
//                .shadow(color: .gray, radius: 10, x: 0, y: 10)
//                .padding()
//            Image("bg_image")
//                .resizable()
//                .scaledToFill()
//                .frame(width: 300,height: 200)
//                .clipShape(RoundedRectangle(cornerRadius: 10))
//                .opacity(0.6)
        }//ZSTACK
        
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
