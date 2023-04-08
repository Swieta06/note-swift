//
//  Login.swift
//  FinalPrpject
//
//  Created by MacBook Pro on 02/04/23.
//
// note handle arror dan nextpage belum selesai
import SwiftUI

struct Login: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var wrongUsername: Int = 0
    @State private var wrongPassword: Int = 0
    @State private var showingLoginScreen: Bool = false
    @State private var isSignUpViewPresented: Bool=false
    var body: some View {
        NavigationView{
            VStack(spacing:16){
               // BackNavigationComponent()
                ImageComponent(ImageName:"loginImage")
                TitleComponen(text: "Login")
                SubtitleComponent(text: "Login with social networks")
                HStack(spacing: 12){
                    Image("facebook")
                    Image("instagram")
                    Image("gmail")
                }
                TextfieldComponent(text: $username, placeholder: "Username")
                
                TextfieldComponent(text: $password, placeholder: "Password")
                    .border(.red,width: CGFloat(wrongPassword))
                Button("Login"){
                    authenticateUser(username: username, password: password)
                }
                .frame(width: 343, height: 53)
                .foregroundColor(.white)
                .background(Color("Main"))
                .cornerRadius(16)
                NavigationLink(destination: Home(), isActive: $showingLoginScreen){
                    EmptyView()
                }
                Button(action: {
                    self.isSignUpViewPresented = true
                }){
                    Text("Sign Up")
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .background(Color(.white))
                }
                
                
            }
            .fullScreenCover(isPresented: $isSignUpViewPresented) {
                Register()
            }
            
        }
        //.navigationBarHidden(true)
    }
    
    func authenticateUser(username:String,password:String){
  
        if(username.lowercased()=="swieta"){
            wrongUsername = 0
            if password.lowercased()=="password"{
                wrongPassword = 0
                //Home()
                print("berhasil login")
                showingLoginScreen=true
                //showingloginscree
            }else{
                wrongPassword = 1
            }
        }else{
            wrongUsername = 1
        }
        
    }
}


struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
