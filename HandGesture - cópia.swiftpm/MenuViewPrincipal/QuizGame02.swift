import SwiftUI

struct QuizQuestion02 {
    let id: Int
    let aslImage: String
    let librasImage: String
    let correctAnswer: String
    let options: [String]
    let feedback: String
}

let quizQuestions: [QuizQuestion02] = [
    QuizQuestion02(
        id: 1,
        aslImage: "ASL-A",
        librasImage: "LIBRAS-A",
        correctAnswer: "A",
        options: ["A", "B", "C", "D"],
        feedback: "Correct answer: 'A'. This is the correct sign for the letter A in ASL and Libras."
    ),
    QuizQuestion02(
        id: 2,
        aslImage: "ASL-H",
        librasImage: "LIBRAS-H",
        correctAnswer: "H",
        options: ["L", "J", "H", "Z"],
        feedback: "Correct answer: 'H'. This is the correct sign for the letter H in ASL and Libras."
    ),
    QuizQuestion02(
        id: 3,
        aslImage: "ASL-T",
        librasImage: "LIBRAS-T",
        correctAnswer: "T",
        options: ["Y", "G", "V", "T"],
        feedback: "Correct answer: 'T'. This is the correct sign for the letter T in ASL and Libras."
    ),
    QuizQuestion02(
        id: 4,
        aslImage: "ASL-6",
        librasImage: "LIBRAS-6",
        correctAnswer: "6",
        options: ["1", "3", "6", "9"],
        feedback: "Correct answer: '6'. This is the correct sign for the number 6 in ASL and Libras."
    ),
    QuizQuestion02(
        id: 5,
        aslImage: "ASL-7",
        librasImage: "LIBRAS-7",
        correctAnswer: "7",
        options: ["5", "6", "7", "8"],
        feedback: "Correct answer: '7'. This is the correct sign for the number 7 in ASL and Libras."
    ),
    QuizQuestion02(
        id: 6,
        aslImage: "ASL-10",
        librasImage: "LIBRAS-10",
        correctAnswer: "10",
        options: ["10", "9", "8", "7"],
        feedback: "Correct answer: '10'. This is the correct sign for the number 10 in ASL and Libras."
    ),
    QuizQuestion02(
        id: 7,
        aslImage: "ASL-X",
        librasImage: "LIBRAS-X",
        correctAnswer: "X",
        options: ["U", "V", "X", "Z"],
        feedback: "Correct answer: 'X'. This is the correct sign for the letter X in ASL and Libras."
    ),
    QuizQuestion02(
        id: 8,
        aslImage: "ASL-F",
        librasImage: "LIBRAS-F",
        correctAnswer: "F",
        options: ["E", "F", "G", "H"],
        feedback: "Correct answer: 'F'. This is the correct sign for the letter F in ASL and Libras."
    ),
    QuizQuestion02(
        id: 9,
        aslImage: "notExist",
        librasImage: "LIBRAS-CEDILHA",
        correctAnswer: "Ç",
        options: ["O", "C", "Ç", "D"],
        feedback: "Correct answer: 'Ç'. This is the correct sign for the letter Ç in Libras and this sign does not exist in ASL."
    )
]

struct QuizLevel2View: View {
    @State private var currentQuestionIndex: Int = 0
    @State private var selectedAnswer: String? = nil
    @State private var showFeedback: Bool = false
    @State private var score: Int = 0
    @State private var errors: Int = 0
    
    var body: some View {
        ZStack {
            Color("LightGrayishBlue").ignoresSafeArea()
            VStack(alignment: .leading, spacing: 10) {
                if currentQuestionIndex < quizQuestions.count {
                    let currentQuestion = quizQuestions[currentQuestionIndex]
                    
                    Text("Select the alternative that corresponds to the sign in ASL and LIBRAS respectively:")
                        .font(.custom("Noteworthy-Bold", size: 18))
                        .foregroundColor(.black)
                        .bold()
                        //.padding(.bottom, 10)
                    
                    HStack {
                        Image(currentQuestion.aslImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .shadow(color: .black, radius: 2, x: 2, y: 2)
                            //.padding(10)
                            .padding(.horizontal, 10)
                        
                        Image(currentQuestion.librasImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .shadow(color: .black, radius: 2, x: 2, y: 2)

                    }
                    
                    ForEach(currentQuestion.options, id: \.self) { option in
                        Button(action: {
                            selectedAnswer = option
                            showFeedback = true
                            if option == currentQuestion.correctAnswer {
                                score += 1
                            } else {
                                errors += 1
                            }
                        }) {
                            HStack {
                                Text(option)
                                    .foregroundColor(.black)
                                    .font(.custom("Noteworthy-Bold", size: 18))
                                Spacer()
                                if selectedAnswer == option {
                                    Image(systemName: selectedAnswer == currentQuestion.correctAnswer ? "checkmark.circle" : "xmark.circle")
                                        .foregroundColor(selectedAnswer == currentQuestion.correctAnswer ? .green.opacity(0.6) : .red.opacity(0.6))
                                }
                            }
                            .padding()
                            .background(selectedAnswer == option ? (selectedAnswer == currentQuestion.correctAnswer ? Color.green.opacity(0.2) : Color.red.opacity(0.2)) : Color.white.opacity(0.5))
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
                            VStack{
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
                                .padding()
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

struct QuizLevel2View_Previews: PreviewProvider {
    static var previews: some View {
        QuizLevel2View()
    }
}
#Preview {
    QuizLevel2View()
}



