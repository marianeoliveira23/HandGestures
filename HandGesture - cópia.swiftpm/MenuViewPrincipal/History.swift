import SwiftUI

struct SignLanguageView: View {
    
    var body: some View {
        VStack(spacing: 20){
            ScrollView {
                VStack(spacing: 20) {
                    Text("Learn about important topics about sign language")
                        .font(.custom("Noteworthy-Bold", size: 22))
                        .multilineTextAlignment(.center)
                        .shadow(color: .black, radius: 2, x: 2, y: 2)
                    
                    VStack(alignment: .center, spacing: 10) {
                        Text("Origins of Sign Languages")
                            .font(.custom("Noteworthy-Bold", size: 20))
                            .multilineTextAlignment(.center)
                            .shadow(color: .black, radius: 2, x: 2, y: 2)
                        Text("Sign languages ​​emerged in ancient times as a result of the need for people who did not speak using sounds to communicate. The gestures emerged without a structure, but over time they began to be studied and organized so that they became a language with its own structure.")
                            .font(.custom("SFProRounded", size:18))
                            .foregroundColor(.black)
                    }
                    .padding()
                    .background(Color("LightDark"))
                    .cornerRadius(10)
                    
                    VStack(alignment: .center, spacing: 10) {
                        Text("What are sign languages")
                            .font(.custom("Noteworthy-Bold", size: 22))
                            .multilineTextAlignment(.center)
                            .shadow(color: .black, radius: 2, x: 2, y: 2)
                        Text("Sign languages ​​emerged with the aim of the deaf community expressing themselves through signs that truly manifest their emotions and feelings. Deaf people use sign language as their first language and their second language is the official language of their country of origin, but in written form.")
                            .font(.custom("SFProRounded", size:18))
                            .foregroundColor(.black)
                    }
                    .padding()
                    .background(Color("LightDark"))
                    .cornerRadius(10)
                    VStack(alignment: .center, spacing: 10) {
                        Text("Who are deaf and who are hearing")
                            .font(.custom("Noteworthy-Bold", size: 22))
                            .multilineTextAlignment(.center)
                            .shadow(color: .black, radius: 2, x: 2, y: 2)
                        Text("Deaf people is the term used when referring to people who have had total hearing loss and use sign language as a form of communication and expression. The hearing person is the one who effectively listens and expresses himself through oral language. The hearing person is able to use sign language to communicate with deaf people and members of their community.")
                            .font(.custom("SFProRounded", size:18))
                            .foregroundColor(.black)
                    }.padding()
                        .background(Color("LightDark"))
                        .cornerRadius(10)
                    VStack(alignment: .center, spacing: 10) {
                        Text("Characteristics of sign languages")
                            .font(.custom("Noteworthy-Bold", size: 22))
                            .multilineTextAlignment(.center)
                            .shadow(color: .black, radius: 2, x: 2, y: 2)
                        Text("Sign languages ​​are known for their unique visual-spatial experience and are complemented by gestures and expressions in the language itself. Sign languages ​​are structured according to the culture of the country itself, which means that sign languages ​​are not universal, so each country has its own language, but there are few similarities.")
                            .font(.custom("SFProRounded", size:18))
                            .foregroundColor(.black)
                        
                    }.padding()
                        .background(Color("LightDark"))
                        .cornerRadius(10)
                    
                    VStack(alignment: .center, spacing: 10) {
                        Text("First Country to Establish a Sign Language")
                            .font(.custom("Noteworthy-Bold", size: 19))
                            .multilineTextAlignment(.center)
                            .shadow(color: .black, radius: 2, x: 2, y: 2)
                        Text("France was the first country to begin educational work for deaf people through the monk Pedro Ponce de Léon. The monk helped in the educational process of two deaf children of Spanish nobility. His method consisted of teaching sign language, writing and oralization. From then on, other educators proposed to study and create effective methods for teaching and learning for deaf people.")
                            .font(.custom("SFProRounded", size:18))
                            .foregroundColor(.black)
                    }
                    .padding()
                    .background(Color("LightDark"))
                    .cornerRadius(10)
                    VStack(alignment: .center, spacing: 10) {
                        Text("Emergence of Libras (Brazilian Sign Language)")
                            .font(.custom("Noteworthy-Bold", size: 18))
                            .multilineTextAlignment(.center)
                            .shadow(color: .black, radius: 2, x: 2, y: 2)
                        Text("In Brazil, sign language developed after Dom Pedro II invited the French deaf teacher Ernest Huet to begin his educational career in Brazil at the National Institute of Education for the Deaf (INES). This teacher used a method proposed by Abbot L’Épée and became the basis for the structuring of Brazilian Sign Language (LIBRAS).")
                            .font(.custom("SFProRounded", size:18))
                            .foregroundColor(.black)
                    }
                    .padding()
                    .background(Color("LightDark"))
                    .cornerRadius(10)
                    
                    VStack(alignment: .center, spacing: 10) {
                        Text("Emergence of ASL (American Sign Language)")
                            .font(.custom("Noteworthy-Bold", size: 18))
                            .multilineTextAlignment(.center)
                            .shadow(color: .black, radius: 2, x: 2, y: 2)
                        Text("American Sign Language emerged from French Sign Language and was consolidated at the American School for the Deaf (ASD). Like other sign languages, American Sign Language has its own grammar that differs from spoken languages.")
                            .font(.custom("SFProRounded", size:18))
                            .foregroundColor(.black)
                    }
                    .padding()
                    .background(Color("LightDark"))
                    .cornerRadius(10)
                    Spacer()
                }.padding()
            }
        }
        .foregroundStyle(Color.white)
        .background(Color("LightGrayishBlue"))
        .toolbarBackground(.lightGrayishBlue, for: .navigationBar)
        .tint(.black)
        .font(.custom("Noteworthy-Bold", size: 8))
        
    }
}
#Preview {
    NavigationStack {
        SignLanguageView()
    }
}



