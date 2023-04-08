//
//  Profile.swift
//  FinalPrpject
//
//  Created by MacBook Pro on 02/04/23.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        VStack(spacing: 12){
            //BackNavigationComponent()
            TitleComponen(text: "Profile")
            Image("Avatar")
            VStack(alignment: .leading){
                Text("Account Information")
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                    .kerning(1.2)
                CardProfileComponent(image: "name", title: "Name", description: "Swieta Nurjanah hetty")
                CardProfileComponent(image: "email", title: "Email", description: "Swieta@gmail.com")
                CardProfileComponent(image: "password", title: "Password", description: "*******")
            }
            Spacer()
        }
       
    }
    
    
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
