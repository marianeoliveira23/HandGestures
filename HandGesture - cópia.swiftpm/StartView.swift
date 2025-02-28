import SwiftUI

struct StartView: View {
    @State private var showOnboarding = false;
    var body: some View {
        ZStack {
            Color("LightGrayishBlue").edgesIgnoringSafeArea(.all);
            VStack {
                Spacer()
                Image("Logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .shadow(color: .black, radius: 2, x: 2, y: 2)
                Text("HandGestures")
                    .font(.custom("Noteworthy-Bold", size:35))
                    .shadow(color: .lightWarmCream, radius: 2, x: 2, y: 2)
                Spacer()
                Button(action: { showOnboarding = true }) {
                    Text("START")
                        .font(.custom("Noteworthy-Bold", size:16))
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("MediumWarmCream"))
                        .cornerRadius(12)
                        .shadow(color: .black, radius: 2, x: 2, y: 2)
                        .padding(.horizontal, 100)
                }
                .fullScreenCover(isPresented: $showOnboarding)
                { OnboardingView() }; Spacer()
            }
        }
    }
}
