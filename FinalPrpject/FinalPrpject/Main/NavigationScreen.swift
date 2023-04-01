import SwiftUI

struct NavigationScreen: View {
    @AppStorage ("currentPage") var currentPage = 1
    var body: some View {
        ZStack{
            if currentPage == 1{
                ScreenView(image: "image1", title: "Learn anytime and anywhere", details: "Quarantine is the perfect time to spend your day learning something new, from anywhere!")
            }
            if currentPage == 2{
                ScreenView(image: "image2", title: "Find a course for you", details: "Quarantine is the perfect time to spend your day learning something new, from anywhere!")
            }
            if currentPage == 3{
                ScreenView(image: "image3", title: "Improve your skills", details: "Quarantine is the perfect time to spend your day learning something new, from anywhere!")
            }
        }
    }
}

struct NavigationScreen_Previews: PreviewProvider {
    static var previews: some View {
       NavigationScreen()
    }
}

struct ScreenView: View {
    @AppStorage("currentPage") var currentPage = 1
    var image: String
    var title: String
    var details: String
    var body: some View {
        VStack{
            HStack{
                if currentPage == 1 {
                    Text("Hallo Learners ! ")
                        .font(.title)
                        .fontWeight(.semibold)
                        .kerning(1.4)
                }
                else{
                    Button(action: {
                        currentPage=currentPage-1
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .padding(.vertical,10)
                            .padding(.horizontal)
                            .background(Color.black.opacity(0.4))
                            .cornerRadius(10)
                    })
                }
                Spacer()
                Button(action: {
                    currentPage=4
                }, label: {
                    Text("Skip")
                        .fontWeight(.semibold)
                        .kerning(1.2)
                })
            }.padding()
                .foregroundColor(.black)
            Spacer(minLength: 0)
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal,16)
                .frame(height: 300)
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .kerning(1.2)
                .padding(.top)
                .padding(.bottom,5)
            Text(details)
                .font(.body)
                .fontWeight(.regular)
                .kerning(1.2)
                .padding([.leading,.trailing])
                .multilineTextAlignment(.center)
            
            Spacer(minLength: 0)
            
            //progressBarr
            HStack{
                if currentPage == 1{
                    Color("Main").frame(height: 8/UIScreen.main.scale)
                    Color(.lightGray).frame(height: 8/UIScreen.main.scale)
                    Color(.lightGray).frame(height: 8/UIScreen.main.scale)
                }
                else if currentPage == 2{
                    Color(.lightGray).frame(height: 8/UIScreen.main.scale)
                    Color("Main").frame(height: 8/UIScreen.main.scale)
                    Color(.lightGray).frame(height: 8/UIScreen.main.scale)
                }
                else if currentPage == 3{
                    Color(.lightGray).frame(height: 8/UIScreen.main.scale)
                    Color(.lightGray).frame(height: 8/UIScreen.main.scale)
                    Color("Main").frame(height: 8/UIScreen.main.scale)
                }
               
            }
            //.padding(.horizontal)
            .padding()

            //
            
            Button(action: {
                if currentPage < totalPage {
                    currentPage = currentPage + 1
                } else {
                    currentPage = 1
                }
            }, label: {
                if currentPage == 3{
                    Text("Get Started")
                        .fontWeight(.semibold)
                        .frame(minWidth: 0,maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color("Main"))
                        .cornerRadius(40)
                        .padding(.horizontal,16)
                }else{
                    Text("Next")
                        .fontWeight(.semibold)
                        .frame(minWidth: 0,maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color("Main"))
                        .cornerRadius(40)
                        .padding(.horizontal,16)
                }
                
            })
            .onChange(of: currentPage) { _ in
                UserDefaults.standard.set(currentPage, forKey: "currentPage")
            }
        }
    }
}

let totalPage = 3

