//
//  Register.swift
//  FinalPrpject
//
//  Created by MacBook Pro on 02/04/23.
//

import SwiftUI

struct Register: View {
    @State private var userName:String=""
    @State private var email:String=""
    @State private var password:String=""
    @State private var isLoginViewPresented = false
    var body: some View {
        VStack(spacing:16){
           // BackNavigationComponent()
            ImageComponent(ImageName: "registerImage")
            TitleComponen(text: "Sign Up")
            SubtitleComponent(text: "Create your Account")
            TextfieldComponent(text: $userName, placeholder: "Username")
            TextfieldComponent(text: $email, placeholder: "Email")
            TextfieldComponent(text: $password, placeholder: "Password")
            MainBottonComponent(text: "Sign up")
            Button(action: {
                self.isLoginViewPresented = true
            }){
                Text("Login")
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .background(Color(.white))
            }
            
            
        }
        .fullScreenCover(isPresented: $isLoginViewPresented) {
            Login()
        }
       
    }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register()
    }
}
