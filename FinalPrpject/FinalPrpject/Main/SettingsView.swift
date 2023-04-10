//
//  SettingsView.swift
//  FinalPrpject
//
//  Created by MacBook Pro on 10/04/23.
//

import SwiftUI

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            VStack(spacing: 20){
                //Mark: - section info
              sectionInfo
                // Mark: Section App
                //SettingsRow(name: "Swieta Nh", content: <#String#>)
                GroupBox{
                    Divider().padding(.vertical,4)
                    VStack(spacing:8){
                        SettingsRow(name: "Developer", content: "Swieta")
                        SettingsRow(name: "Design",linkLable: "UI design",linkDestination: "uistore.design")
                        SettingsRow(name: "Compatibility",content: "iOS 15")
                        SettingsRow(name: "Api",linkLable: "Open Trivia",linkDestination: "opentdb.com")
                        SettingsRow(name: "Version",content: "1.1.0")
                    }
                    
                    //SettingsRow()
                    
                }label: {
                    SettingsLableView(labelText: "Application", labelImage: "iphone")
                }
                .padding()
            }//: VSTACK
        }//:scrollview
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

//MARK: -SETTINGS VIEW
struct SettingsLableView: View {
    var labelText: String
    var labelImage: String
    
    var body: some View {
        HStack {
            Text(labelText.uppercased())
                .fontWeight(.bold)
            Spacer()
            Image(systemName: labelImage)
        }
    }
}
//Mark: -Extention
extension SettingsView{
    // 1. Settings Info
    private var sectionInfo: some View{
        GroupBox{
            Divider().padding(.vertical,4)
            HStack(alignment: .center, spacing: 10){
                Image("Content")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80,
                    height: 80)
                    .cornerRadius(10)
                Text("Quarantine is the perfect time to spend your day learning something new, from anywhere!.")
                    .font(.system(size: 12))
            }
        }label: {
            SettingsLableView(labelText: "App Info", labelImage: "info.circle")
        }
        .padding()
    }
}
// Mark: - Settings Row

struct SettingsRow: View {
    var name: String
    var content: String?
    var linkLable:String?
    var linkDestination: String?
    var body: some View {
        
        HStack{
            Text(name)
                .foregroundColor(.gray)
            Spacer()
            if (content != nil) {
                Text(content ?? "N/A")
            } else if (linkLable != nil && linkDestination != nil){
                Link(linkLable!, destination: URL(string: "https://\(linkDestination!)")!)
                    .tint(Color("Main"))
                Image(systemName: "arrow.up.right.square")
                    .foregroundColor(Color("Main"))
            }else {
                EmptyView()
            }
        }
    }
}

