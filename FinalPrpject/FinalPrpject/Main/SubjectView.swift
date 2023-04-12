//
//  SubjectView.swift
//  FinalPrpject
//
//  Created by MacBook Pro on 10/04/23.
//

import SwiftUI

struct SubjectView: View {
    var subjectModel:SubjectModel
    var body: some View {
        ScrollView{
            Text("")
        }

    }
}

struct SubjectView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectView(subjectModel: SubjectModel.all[0])
    }
}
