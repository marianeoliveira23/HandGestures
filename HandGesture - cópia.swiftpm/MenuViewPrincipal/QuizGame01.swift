import SwiftUI

struct QuizView: View {
    @State private var currentQuestionIndex: Int = 0
    @State private var selectedAnswer: String? = nil
    @State private var showFeedback: Bool = false
    @State private var score: Int = 0
    @State private var errors: Int = 0
    
    let questions: [QuizQuestion] = [
        QuizQuestion(
            question: "Select the correct term for a person who uses sign language as their first language:",
            answers: ["Hearing person", "Person with hearing impairment", "Deaf person", "Mute person"],
            correctAnswer: "Deaf person",
            feedback: "Correct answer: 'Deaf person'. This term refers to individuals who use sign language as their first language and belong to the Deaf community, which has its own culture and linguistic identity."
        ),
        QuizQuestion(
            question: "Brazilian Sign Language (Libras) is a direct translation from Portuguese.",
            answers: ["True", "False", "Only partially translated", "Depends on the region of Brazil"],
            correctAnswer: "False",
            feedback: "Correct answer: 'False'. Libras is not a direct translation from Portuguese; it has its own grammatical structure."
        ),
        QuizQuestion(
            question: "Which sign language is most influenced by the French alphabet?",
            answers: ["British Sign Language (BSL)", "Brazilian Sign Language (Libras)", "American Sign Language (ASL)", "All of the above"],
            correctAnswer: "American Sign Language (ASL)",
            feedback: "Correct answer: 'American Sign Language (ASL)'. ASL has strong influence from French Sign Language (LSF)."
        ),
        QuizQuestion(
            question: "Does each country have its own unique sign language?",
            answers: ["Yes, each country has a unique language", "No, there are only five universal sign languages", "Only in countries that officially recognize sign language", "Depends on the country's culture"],
            correctAnswer: "Yes, each country has a unique language",
            feedback: "Correct answer: 'Yes, each country has a unique language'. Each country developed its own sign language over time."
        ),
        QuizQuestion(
            question: "Are Libras and ASL mutually intelligible?",
            answers: ["Yes, completely", "No, but they share some similarities", "Yes, because both originate from French Sign Language (LSF)", "No, they are totally different"],
            correctAnswer: "No, but they share some similarities",
            feedback: "Correct answer: 'No, but they share some similarities'. While they share some features, Libras and ASL are not mutually intelligible."
        ),
        QuizQuestion(
            question: "Can people who use sign languages understand all other sign languages automatically?",
            answers: ["Yes, because they all follow the same visual grammar", "No, each sign language has a unique structure", "Only if the languages are from the same continent", "Yes, but they need initial training"],
            correctAnswer: "No, each sign language has a unique structure",
            feedback: "Correct answer: 'No, each sign language has a unique structure'. Each sign language has its own grammar and vocabulary."
        ),
        QuizQuestion(
            question: "Are facial expressions just a complement in sign language communication?",
            answers: ["True, they are optional", "False, they are an essential part of grammar", "Only to emphasize emotions", "Depends on the situation"],
            correctAnswer: "False, they are an essential part of grammar",
            feedback: "Correct answer: 'False, they are an essential part of grammar'. Facial expressions are crucial in conveying meaning in sign languages."
        ),
        QuizQuestion(
            question: "Are there no slang or regional variations in sign languages?",
            answers: ["True, it is a standardized language", "False, there are regional variations and slang", "Only in sign languages with official recognition", "Only in small communities"],
            correctAnswer: "False, there are regional variations and slang",
            feedback: "Correct answer: 'False, there are regional variations and slang'. Just like spoken languages, sign languages have regional differences and slang."
        ),
        QuizQuestion(
            question: "In ASL, is fingerspelling more common than using specific signs?",
            answers: ["True, fingerspelling is more widely used", "False, specific signs are the foundation of communication", "Only for proper names", "Depends on the Deaf person"],
            correctAnswer: "False, specific signs are the foundation of communication",
            feedback: "Correct answer: 'False, specific signs are the foundation of communication'. Fingerspelling is mainly used for proper names or words without a specific sign."
        )
    ]
    
    var body: some View {
        ZStack {
            Color("LightGrayishBlue").ignoresSafeArea()
            VStack(alignment: .leading, spacing: 10) {
                if currentQuestionIndex < questions.count {
                    let currentQuestion = questions[currentQuestionIndex]
                    
                    Text(currentQuestion.question)
                        .font(.custom("Noteworthy-Bold", size: 24))
                        .foregroundColor(.black)
                        .bold()
                        .padding(.bottom, 10)
                    
                    ForEach(currentQuestion.answers, id: \..self) { answer in
                        Button(action: {
                            selectedAnswer = answer
                            showFeedback = true
                            if answer == currentQuestion.correctAnswer {
                                score += 1
                            } else {
                                errors += 1
                            }
                        }) {
                            HStack {
                                Text(answer)
                                    .foregroundColor(.black)
                                    .font(.custom("Noteworthy-Bold", size: 18))
                                    .multilineTextAlignment(.leading)
                                Spacer()
                                if selectedAnswer == answer {
                                    Image(systemName: selectedAnswer == currentQuestion.correctAnswer ? "checkmark.circle" : "xmark.circle")
                                        .foregroundColor(selectedAnswer == currentQuestion.correctAnswer ? .green.opacity(0.6) : .red.opacity(0.6))
                                }
                            }
                            .padding()
                            .background(selectedAnswer == answer ? (selectedAnswer == currentQuestion.correctAnswer ? Color.green.opacity(0.3) : Color.red.opacity(0.3)) : Color.white.opacity(0.5))
                            .cornerRadius(10)
                        }
                        .disabled(showFeedback)
                    }
                    
                    if showFeedback {
                        Text(currentQuestion.feedback)
                            .font(.custom("Noteworthy-Bold", size: 18))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(10)
                            .multilineTextAlignment(.leading)
                        
                        Button(action: {
                            currentQuestionIndex += 1
                            selectedAnswer = nil
                            showFeedback = false
                        }) {
                            Text("NEXT")
                                .font(.custom("Noteworthy-Bold", size: 15))
                                .foregroundColor(.black)
                                .padding()
                                .frame(maxWidth:.infinity)
                                .background(Color("MediumWarmCream"))
                                .cornerRadius(12)
                                .shadow(color: .black, radius: 2, x: 2, y: 2)
                                .padding(.horizontal, 40)
                        }
                    }
                } else {
                    ZStack{
                        Image("Finish")
                        VStack{
                            Text("Quiz Completed!")
                                .font(.custom("Noteworthy-Bold", size: 35))
                                .shadow(color: .lightWarmCream, radius: 2, x: 2, y: 2)
                                .foregroundColor(.black)
                                .bold()
                                .frame(maxWidth: .infinity, alignment: .center)
                            
                            Text("Correct answers: \(score)")
                                .font(.custom("Noteworthy-Bold", size: 24))
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment: .center)
                            
                            Text("Incorrect answers: \(errors)")
                                .font(.custom("Noteworthy-Bold", size: 24))
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment: .center)
                        }
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
}
struct QuizQuestion {
    let question: String
    let answers: [String]
    let correctAnswer: String
    let feedback: String
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}
#Preview {
    NavigationStack {
        QuizView()
    }
}



