//
//  Extention.swift
//  TriviaGames
//
//  Created by MacBook Pro on 30/03/23.
//
// halaman untuk membuat extention
import Foundation
import SwiftUI

extension Text{
    func LilacTitle() -> some View{
        self.font(.title)
            .fontWeight(.heavy)
            .foregroundColor(.accentColor)
            
    }
}

