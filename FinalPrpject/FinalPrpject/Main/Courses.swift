//
//  Courses.swift
//  FinalPrpject
//
//  Created by MacBook Pro on 02/04/23.
//

import SwiftUI
import WebKit
struct Courses: View {
    @StateObject var quizManager = QuizManager()
    @State var selectedCategory: String?
    var categories: [String] = ["#All", "#Quiz", "#Learning",]
        
    var body: some View {
        NavigationView() {
            VStack(alignment: .leading){
                Text("Hello,")
                    .fontWeight(.semibold)
                Text("Swieta Nurjanah Hetty")
                    .font(.title)
                    .fontWeight(.bold)
//                HStack(alignment: .center){
//                    Text("Category : ")
//                    CategoryButtonComponent(text: "#Quiz")
//                    CategoryButtonComponent(text: "#Swift")
//                    CategoryButtonComponent(text:"#Html" )
//                }
                HStack(alignment: .center) {
                    Text("Category : ")
                    ForEach(categories, id: \.self) { category in
                        Button(action: {
                            selectedCategory = category
                        }) {
                            Text(category)
                                .foregroundColor(selectedCategory == category ? .white : .black)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(selectedCategory == category ? Color("Secondary") : Color("Main").opacity(0.3))
                                .cornerRadius(10)
                        }
                    }
                }
                
                //end code -------
                ScrollView(showsIndicators: false){
                    VStack(alignment: .leading){
                        VStack(alignment: .leading,spacing: 15){
                            //ScrollView(showsIndicators: false){
                            VStack(spacing: 20){
                            switch selectedCategory {
                            case "#Quiz":
                                NavigationLink{
                                    QuizView()
                                        .environmentObject(quizManager)
                                }label: {
                                    CardCrouseComponent(image: "Course_Image", Title: "Quiz", subtitle: "Let’s put your memory on this topic test. Solve tasks and check your knowledge.")
                                }
                            case "#Learning":
                                Button(action: {
                                    if let url = URL(string: "https://www.w3schools.com/html") {
                                        UIApplication.shared.open(url)
                                    }
                                }) {
                                    CardCrouseComponent(image: "Course_Image2", Title: "HTML", subtitle: "HTML is the standard markup language for Web pages.")
                                }
                                Button(action: {
                                    if let url = URL(string: "https://www.w3schools.com/css") {
                                        UIApplication.shared.open(url)
                                    }
                                }) {
                                    CardCrouseComponent(image: "Course_image4", Title: "Css", subtitle: "CSS is the language we use to style an HTML document")
                                }
                            case "#All":
                                NavigationLink{
                                    QuizView()
                                        .environmentObject(quizManager)
                                }label: {
                                    CardCrouseComponent(image: "Course_Image", Title: "Quiz", subtitle: "Let’s put your memory on this topic test. Solve tasks and check your knowledge.")
                                }
                                Button(action: {
                                    if let url = URL(string: "https://www.w3schools.com/html") {
                                        UIApplication.shared.open(url)
                                    }
                                }) {
                                    CardCrouseComponent(image: "Course_Image2", Title: "HTML", subtitle: "HTML is the standard markup language for Web pages.")
                                }
                                Button(action: {
                                    if let url = URL(string: "https://www.w3schools.com/css") {
                                        UIApplication.shared.open(url)
                                    }
                                }) {
                                    CardCrouseComponent(image: "Course_image4", Title: "Css", subtitle: "CSS is the language we use to style an HTML document")
                                }
                                Button(action: {
                                    if let url = URL(string: "https://www.w3schools.com/js/") {
                                        UIApplication.shared.open(url)
                                    }
                                }) {
                                    CardCrouseComponent(image: "Course_Image3", Title: "JavaScript", subtitle: "JavaScript is the programming language of the Web.")
                                }
                            default:
                                NavigationLink{
                                    QuizView()
                                        .environmentObject(quizManager)
                                }label: {
                                    CardCrouseComponent(image: "Course_Image", Title: "Quiz", subtitle: "Let’s put your memory on this topic test. Solve tasks and check your knowledge.")
                                }
                                Button(action: {
                                    if let url = URL(string: "https://www.w3schools.com/html") {
                                        UIApplication.shared.open(url)
                                    }
                                }) {
                                    CardCrouseComponent(image: "Course_Image2", Title: "HTML", subtitle: "HTML is the standard markup language for Web pages.")
                                }
                                Button(action: {
                                    if let url = URL(string: "https://www.w3schools.com/css") {
                                        UIApplication.shared.open(url)
                                    }
                                }) {
                                    CardCrouseComponent(image: "Course_image4", Title: "Css", subtitle: "CSS is the language we use to style an HTML document")
                                }
                                Button(action: {
                                    if let url = URL(string: "https://www.w3schools.com/js/") {
                                        UIApplication.shared.open(url)
                                    }
                                }) {
                                    CardCrouseComponent(image: "Course_Image3", Title: "JavaScript", subtitle: "JavaScript is the programming language of the Web.")
                                }
                               // EmptyView()
                                
                            }
                        }
                        }
                        
                    }
                    
                }
            }
        }
        .navigationBarHidden(true)
      
        .tint(.black)
    }
}

struct Courses_Previews: PreviewProvider {
    static var previews: some View {
        Courses()
    }
}
struct WebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
