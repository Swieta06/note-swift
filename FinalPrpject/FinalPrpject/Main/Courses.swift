//
//  Courses.swift
//  FinalPrpject
//
//  Created by MacBook Pro on 02/04/23.
//

import SwiftUI

struct Courses: View {
    @StateObject var quizManager = QuizManager()
    @State private var searchText:String=""
    var body: some View {
        NavigationView() {
            ScrollView(showsIndicators: false){
                VStack(alignment: .leading){
                    Text("Hello,")
                        .fontWeight(.semibold)
                    Text("Swieta Nurjanah Hetty")
                        .font(.title)
                        .fontWeight(.bold)
                    VStack(alignment: .leading,spacing: 10){
                        HStack(alignment: .center){
                            Text("Categori : ")
                            CategoryButtonComponent(text: "#Css")
                            CategoryButtonComponent(text: "#Swift")
                            CategoryButtonComponent(text:"#Html" )
                        }
                        NavigationLink{
                            QuizView()
                                .environmentObject(quizManager)
                        }label: {
                            CardCrouseComponent(image: "Course_Image", Title: "UI", subtitle: "Advanced mobile interface design")
                        }
                        
                            
                      
                        CardCrouseComponent(image: "Course_Image2", Title: "HTML", subtitle: "Advanced web applications")
                        CardCrouseComponent(image: "Course_Image2", Title: "HTML", subtitle: "Advanced web applications")
                        CardCrouseComponent(image: "Course_Image2", Title: "HTML", subtitle: "Advanced web applications")
                        
                        // Spacer()
                    }
                }
                //                .searchable(
                //                    text: $searchText,
                //                placement:
                //                        .navigationBarDrawer(displayMode:
                //                            .always),
                //                            prompt: "What course's that you are look for?")
            }
           
        }
        .navigationBarHidden(true)
    }
}

struct Courses_Previews: PreviewProvider {
    static var previews: some View {
        Courses()
    }
}
