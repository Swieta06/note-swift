//
//  SplashScreen.swift
//  FinalPrpject
//
//  Created by MacBook Pro on 31/03/23.
//

import SwiftUI

struct MoveScreen:View{
    var body: some View{
        NavigationView{
            SplashScreen()
            
        }
     
    }
}

struct SplashScreen: View {
    @State private var isLoading=false
    @State private var isActive=false
    var body: some View {
            VStack{
                ImageComponent(ImageName:"Content")
                if isLoading{
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .red))
                        .scaleEffect(2)
                        .padding()
                        .background(Color.white.opacity(0.75))
                        .cornerRadius(10)
                }
                
                
            }
         .onAppear{startLoadView()}
                   .background(
                       NavigationLink(
                           destination: NavigationScreen(),
                           isActive: $isActive,
                           label: { EmptyView() }
                       )
                       .frame(width: 0, height: 0)
                      .hidden()
                   )
            //ContentView()
    }
    func startLoadView(){
        isLoading=true
        DispatchQueue.main.asyncAfter(deadline: .now()+2){
            isLoading=false
            isActive=true
            print(isActive)

        }
    }
  
    
}



struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        MoveScreen()
    }
}
