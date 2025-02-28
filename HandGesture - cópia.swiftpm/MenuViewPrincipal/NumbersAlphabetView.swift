import SwiftUI

struct GestureView: View {
    let segments = ["Alphabet", "Numbers"]
    
    let letters = ["A", "B", "C", "Ç", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    let numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    let aslImagesLetters = ["ASL-A", "ASL-B", "ASL-C", "notExist", "ASL-D", "ASL-E", "ASL-F", "ASL-G", "ASL-H", "ASL-I", "ASL-J", "ASL-K", "ASL-L", "ASL-M", "ASL-N", "ASL-O", "ASL-P", "ASL-Q", "ASL-R", "ASL-S", "ASL-T", "ASL-U", "ASL-V", "ASL-W", "ASL-X", "ASL-Y", "ASL-Z"]
    let librasImagesFingerwriting = ["LIBRAS-A", "LIBRAS-B", "LIBRAS-C", "LIBRAS-CEDILHA", "LIBRAS-D", "LIBRAS-E", "LIBRAS-F", "LIBRAS-G", "LIBRAS-H", "LIBRAS-I", "LIBRAS-J", "LIBRAS-K", "LIBRAS-L", "LIBRAS-M", "LIBRAS-N", "LIBRAS-O", "LIBRAS-P", "LIBRAS-Q", "LIBRAS-R", "LIBRAS-S", "LIBRAS-T", "LIBRAS-U", "LIBRAS-V", "LIBRAS-W", "LIBRAS-X", "LIBRAS-Y", "LIBRAS-Z"]
    
    let aslImagesNumbers = ["ASL-1", "ASL-2", "ASL-3", "ASL-4", "ASL-5", "ASL-6", "ASL-7", "ASL-8", "ASL-9", "ASL-10"]
    let librasImagesNumbers = ["LIBRAS-1", "LIBRAS-2", "LIBRAS-3", "LIBRAS-4", "LIBRAS-5", "LIBRAS-6", "LIBRAS-7", "LIBRAS-8", "LIBRAS-9", "LIBRAS-10"]
    
    @State private var selectedSegment = "Alphabet"
    
    var body: some View {
        VStack {
            Picker("Select Mode", selection: $selectedSegment) {
                ForEach(segments, id: \.self) { segment in
                    Text(segment)
                        .tag(segment)
                }
            }.font(.custom("Noteworthy-Bold", size: 12))
                .pickerStyle(.segmented)
                .padding()
            if selectedSegment == "Alphabet" {
                Letter(Alfnum: "Alphabet", caracteres: letters, aslImages: aslImagesLetters, librasImages: librasImagesFingerwriting)
            } else {
                Letter(Alfnum: "Numbers", caracteres: numbers, aslImages: aslImagesNumbers, librasImages: librasImagesNumbers)
            }
        }
        .background(Color("LightGrayishBlue"))
    }
}
struct Letter: View {
    var Alfnum: String
    var caracteres: [String]
    var aslImages: [String]
    var librasImages: [String]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Explore \(Alfnum) in ASL and Libras")
                .font(.custom("Noteworthy-Bold", size: 22))
                .shadow(color: .lightWarmCream, radius: 2, x: 2, y: 2)
                .multilineTextAlignment(.center)
                .padding()
            
            ScrollView {
                VStack {
                    HStack {
                        Text("ASL")
                            .font(.custom("Noteworthy-Bold", size: 20))
                            .frame(maxWidth: .infinity)
                            .shadow(color: .white, radius: 2, x: 2, y: 2)
                        Text("LIBRAS")
                            .font(.custom("Noteworthy-Bold", size: 20))
                            .frame(maxWidth: .infinity)
                            .shadow(color: .white, radius: 2, x: 2, y: 2)
                    }
                    .padding()
                    .background(Color.white.opacity(0.6))
                    
                    ForEach(0..<caracteres.count, id: \.self) { index in
                        HStack {
                            Image(aslImages[index])
                                .resizable()
                                .frame(width: 130, height: 130)
                                .shadow(color: .black, radius: 2, x: 2, y: 2)
                            
                            Text(caracteres[index])
                                .font(.custom("Noteworthy-Bold", size: 22))
                                .frame(width: 100, height: 100)
                                .shadow(color: .white, radius: 2, x: 2, y: 2)
                                .bold()
                            
                            Image(librasImages[index])
                                .resizable()
                                .frame(width: 130, height: 130)
                                .shadow(color: .black, radius: 2, x: 2, y: 2)
                        }.padding(.vertical, 5)
                    }
                }
            }
        }.background(Color("LightGrayishBlue"))
    }
}
#Preview {
    NavigationStack {
        GestureView()
    }
}
