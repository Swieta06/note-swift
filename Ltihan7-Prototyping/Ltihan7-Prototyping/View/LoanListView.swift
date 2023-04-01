//
//  LoanListView.swift
//  Ltihan7-Prototyping
//
//  Created by MacBook Pro on 31/03/23.
//

import SwiftUI

struct LoanListView: View {
    //harus dikasih observ karna ini struct agaraperubahan ikut terupdate
   @ObservedObject var loanStore=LoanStore()
    var body: some View {
        NavigationStack{
            List(loanStore.loans){loan in
                loanRowView(loan:loan)
               
                
            }
            .listStyle(InsetListStyle())
            .task {
                self.loanStore.fetchLatestLoans()
            }
        }
    }
}

struct LoanListView_Previews: PreviewProvider {
    static var previews: some View {
        LoanListView()
    }
}
