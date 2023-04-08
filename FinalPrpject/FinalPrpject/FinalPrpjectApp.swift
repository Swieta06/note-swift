//
//  FinalPrpjectApp.swift
//  FinalPrpject
//
//  Created by MacBook Pro on 31/03/23.
//

import SwiftUI

@main
struct FinalPrpjectApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
                SplashScreen()
                
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}
