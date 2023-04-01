//
//  ContentView.swift
//  Ltihan7-Prototyping
//
//  Created by MacBook Pro on 29/03/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            ArticleListView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Browse")
                }
            Text("watch")
                .font(.system(.largeTitle,design: .rounded))
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("Watch")
                }
            LoanListView()
                .font(.system(.largeTitle,design: .rounded))
                .tabItem {
                    Image(systemName: "rectangle.and.text.magnifyingglass")
                    Text("Search")
                }
            Settings()
                //.font(.system(.largeTitle,design: .rounded))
                .tabItem {
                    Image(systemName: "gear")
                    Text("Setting")
                }
        }//:Tabview
        .tint(.purple)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
