//
//  Home.swift
//  FinalPrpject
//
//  Created by MacBook Pro on 02/04/23.
//

import SwiftUI

struct Home: View {
    var body: some View {
            TabView{
                Courses()
                .tabItem{
                    Image(systemName: "books.vertical")
                    Text("Courses")
                    
                }
                Profile()
                .tabItem{
                    Image(systemName: "person")
                    Text("Profile")
                }
                //Text("setting")
                SettingsView()
                .tabItem{
                    Image(systemName: "gearshape")
                    Text("Settings")
                        
                }
                
            }
            .tint(Color("Main"))
        }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
