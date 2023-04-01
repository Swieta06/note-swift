//
//  Settings.swift
//  Ltihan7-Prototyping
//
//  Created by MacBook Pro on 30/03/23.
//

import SwiftUI

struct Settings: View {
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
                        SettingsRow(name: "Developer", content: "Swieta nh")
                        SettingsRow(name: "Designer", content: "aaaaaaaa")
                        SettingsRow(name: "Compatibility",content: "iOS 16")
                        SettingsRow(name: "website",linkLable: "iOS Bootcamp",linkDestination: "google.com")
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
        Settings()
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
extension Settings{
    // 1. Settings Info
    private var sectionInfo: some View{
        GroupBox{
            Divider().padding(.vertical,4)
            HStack(alignment: .center, spacing: 10){
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80,
                    height: 80)
                    .cornerRadius(10)
                Text("Hic modi dolores At sunt voluptatem qui aspernatur voluptates sed dolorem fuga eos dolorem dolorem est facilis maiores et sunt quia. Nam accusantium cumque et consequatur similique sit odit voluptate aut modi dicta.")
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
                    .tint(.purple)
                Image(systemName: "arrow.up.right.square")
                    .foregroundColor(.purple)
            }else {
                EmptyView()
            }
        }
    }
}
