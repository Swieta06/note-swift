//struct Courses: View {
//    @State var selectedCategory: String?
//    var categories: [String] = ["#Css", "#Swift", "#Html"]
//    
//    var body: some View {
//        NavigationView {
//            VStack(alignment: .leading) {
//                Text("Hello,")
//                    .fontWeight(.semibold)
//                Text("Swieta Nurjanah Hetty")
//                    .font(.title)
//                    .fontWeight(.bold)
//                VStack(alignment: .leading, spacing: 15) {
//                    HStack(alignment: .center) {
//                        Text("Category : ")
//                        ForEach(categories, id: \.self) { category in
//                            Button(action: {
//                                selectedCategory = category
//                            }) {
//                                Text(category)
//                                    .foregroundColor(selectedCategory == category ? .white : .black)
//                                    .padding(.horizontal, 10)
//                                    .padding(.vertical, 5)
//                                    .background(selectedCategory == category ? Color.blue : Color.gray.opacity(0.3))
//                                    .cornerRadius(10)
//                            }
//                        }
//                    }
//                    ScrollView(showsIndicators: false) {
//                        VStack(spacing: 20) {
//                            switch selectedCategory {
//                            case "#Css":
//                                Button(action: {
//                                    if let url = URL(string: "https://www.w3schools.com/css") {
//                                        UIApplication.shared.open(url)
//                                    }
//                                }) {
//                                    CardCrouseComponent(image: "Course_image4", Title: "Css", subtitle: "CSS is the language we use to style an HTML document")
//                                }
//                            case "#Swift":
//                                NavigationLink {
//                                    QuizView()
//                                        .environmentObject(quizManager)
//                                } label: {
//                                    CardCrouseComponent(image: "Course_Image", Title: "Quiz", subtitle: "Let’s put your memory on this topic test. Solve tasks and check your knowledge.")
//                                }
//                            case "#Html":
//                                Button(action: {
//                                    if let url = URL(string: "https://www.w3schools.com/html") {
//                                        UIApplication.shared.open(url)
//                                    }
//                                }) {
//                                    CardCrouseComponent(image: "Course_Image2", Title: "HTML", subtitle: "HTML is the standard markup language for Web pages.")
//                                }
//                            default:
//                                EmptyView()
//                            }
//                        }
//                    }
//                }
//            }
//            .navigationBarHidden(true)
//            .tint(.black)
//        }
//    }
//}
