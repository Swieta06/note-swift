//
//  ContentView.swift
//  TriviaGames
//
//  Created by MacBook Pro on 30/03/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
           VStack(spacing:40){
                VStack (spacing:10){
                    Text("Trivia Games")
                        .LilacTitle()
                    Text("Are you ready to test out your trivia skills?")
                        .font(.subheadline)
                        .fontWeight(.light)
                        .foregroundColor(.gray)
                   
                }
                PrimaryButton(text: "Let's Go")
            }
            //buat atur frame
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
        }
      
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
