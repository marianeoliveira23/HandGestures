import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color("LightGrayishBlue")
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 30) {
                    Text("Menu")
                        .font(.custom("Noteworthy-Bold", size: 35))
                        .shadow(color: .lightWarmCream, radius: 4, x: 4, y: 4)
                        .padding(.top, 20)
                    
                    VStack(spacing: 20) {
                        HStack(spacing: 20) {
                            NavigationLink(destination: SignLanguageView())
                            {
                                VStack(spacing: 0) {
                                    Image("HistoryImage")
                                        .resizable()
                                        .frame(width: 150, height: 150)
                                        .shadow(radius: 20)
                                    Text("History")
                                        .font(.custom("Noteworthy-Bold", size: 16))
                                        .bold()
                                        .shadow(color: .lightWarmCream, radius: 4, x: 4, y: 4)
                                    
                                }.padding()
                                
                            }
                            
                            NavigationLink(destination: GestureView()) {
                                VStack(spacing: 0){
                                    Image("A&N")
                                        .resizable()
                                        .frame(width: 150, height: 150)
                                        .shadow(radius: 20)
                                    Text("Alphabet and Numbers")
                                        .font(.custom("Noteworthy-Bold", size: 16))
                                        .bold()
                                        .shadow(color: .lightWarmCream, radius: 4, x: 4, y: 4)
                                }.padding()
                            }
                        }
                        
                        HStack(spacing: 20) {
                            NavigationLink(destination: QuizView()) {
                                VStack(spacing: 0){
                                    Image("Quiz1")
                                        .resizable()
                                        .frame(width: 150, height: 150)
                                        .shadow(radius: 20)
                                    Text("Quiz-Level 1")
                                        .font(.custom("Noteworthy-Bold", size: 16))
                                        .bold()
                                        .shadow(color: .lightWarmCream, radius: 4, x: 4, y: 4)
                                }.padding()
                            }
                            NavigationLink(destination: QuizLevel2View()) {
                                VStack(spacing: 0){
                                    Image("Quiz2")
                                        .resizable()
                                        .frame(width: 150, height: 150)
                                        .shadow(radius: 20)
                                        .toolbarRole(.editor)
                                    Text("Quiz-Level 2")
                                        .font(.custom("Noteworthy-Bold", size: 16))
                                        .bold()
                                        .shadow(color: .lightWarmCream, radius: 4, x: 4, y: 4)
                                }.padding()
                            }
                        }
                    }
                }
            }
            
            .foregroundStyle(Color.black)
            .accentColor(.black)
            .navigationTitle("")
            
        }
        .tint(.black)
        .font(.custom("Noteworthy-Bold", size: 8))
    }
}
struct MenuContainer: View {
    var title: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color("MediumWarmCream"))
                .frame(width: 160, height: 160)
                .shadow(radius: 5)
            
            Text(title)
                .font(.custom("Noteworthy-Bold", size: 18))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}
#Preview {
    NavigationStack {
        MenuView()
    }
}


