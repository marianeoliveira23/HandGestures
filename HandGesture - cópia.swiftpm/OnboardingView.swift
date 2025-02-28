import SwiftUI

struct OnboardingView: View {
    @State private var currentPage = 0
    @State private var navigateToMenu = false
    
    var body: some View {
        TabView(selection: $currentPage) {
            OnboardingPageView(
                title: "Welcome to Hand Gestures",
                description: "This app highlights the differences between Brazilian Sign Language (Libras) and American Sign Language (ASL)",
                imageName: "Welcome"
            )
            .tag(0)
            
            OnboardingPageView(
                title: "Important",
                description: "Its goal is to help raise awareness and understand that each country has its own sign language, avoiding misunderstandings and promoting respect for the linguistic diversity of the deaf community.",
                imageName: "Important"
            )
            .tag(1)
            
            VStack {
                OnboardingPageView(
                    title: "Let's Get Started!",
                    description: "Understanding these distinctions strengthens inclusion and global communication in an accessible way. Click the button below to explore the app.",
                    imageName: "Start"
                )
                
                Button(action: {
                    navigateToMenu = true
                }) {
                    Text("EXPLORE")
                        .font(.custom("Noteworthy-Bold", size: 18))
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("MediumWarmCream"))
                        .cornerRadius(12)
                        .shadow(color: .black, radius: 2, x: 2, y: 2)
                    .padding(.horizontal, 40)                }
                .padding(.top, 20)
            }
            .tag(2)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .ignoresSafeArea()
        .background(Color("LightGrayishBlue"))
        .fullScreenCover(isPresented: $navigateToMenu) {
            MenuView()
            
        }
    }
}

struct OnboardingPageView: View {
    let title: String
    let description: String
    let imageName: String
    
    var body: some View {
        VStack(spacing: 20) {
            Image(imageName)
                .padding()
                .foregroundColor(.white)
            
            Text(title)
                .font(.custom("Noteworthy-Bold", size: 24))
                .shadow(color: .black, radius: 3, x: 3, y: 3)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            Text(description)
                .font(.custom("Noteworthy-Bold", size: 20))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
                .foregroundColor(.white)
        }
        .padding()
    }
}
//
//struct TelaQuiz: View {
//    var body: some View {
//        QuizLevelView()
//            .navigationBarTitleDisplayMode(.inline)
//            .background(Color("LightGrayishBlue").ignoresSafeArea())
//        
//    }
//}

