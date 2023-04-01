//
//  loanRowView.swift
//  Ltihan7-Prototyping
//
//  Created by MacBook Pro on 31/03/23.
//

import SwiftUI

struct loanRowView: View {
    var loan : Loan
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text(loan.name)
                    .font(.system(.headline,design: .rounded))
                    .fontWeight(.bold)
                Text(loan.country)
                    .font(.system(.subheadline,design: .rounded))
                
                Text(loan.use)
                    .font(.system(.body,design: .rounded))
                
            }// stack
            Spacer()
            Text("$\(loan.amount)")
                .font(.system(.title,design: .rounded))
                .fontWeight(.bold)
            
        }// hstack
        .padding()
        .frame(minWidth: 0,maxWidth: .infinity)
    }
}

struct loanRowView_Previews: PreviewProvider {
    static var previews: some View {
        loanRowView(loan: Loan(name: "Russel", country: "Indonesia", use: "for buying", amount: 200000))
    }
}
