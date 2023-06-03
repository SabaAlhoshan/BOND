//
//  test.swift
//  Bond
//
//  Created by Ghadah on 02/11/1444 AH.
//

import SwiftUI

class OTPViewModel: ObservableObject {
    
    var numberOfFields: Int
    
    init(numberOfFields: Int = 6) {
        self.numberOfFields = numberOfFields
    }
    
    @Published var otpField = "" {
        didSet {
            showPasteButton = false
            guard otpField.last?.isNumber ?? true else {
                otpField = oldValue
                return
            }
            if otpField.count == numberOfFields {
                showPasteButton = false
            }
        }
    }
    
    @Published var isEditing = false {
        didSet {
            if !isEditing { showPasteButton = isEditing }
        }
    }
    
    @Published var showPasteButton = false
    
    func otp(digit: Int) -> String {
        guard otpField.count >= digit else {
            return ""
        }
        return String(Array(otpField)[digit - 1])
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

@available(iOS 13.0, *)
struct CXLRPOTPView: View {
    @ObservedObject var viewModel = OTPViewModel()
    @Environment(\.colorScheme) var colorScheme
    
    private let textBoxWidth: CGFloat = 41
    private let textBoxHeight = UIScreen.main.bounds.width / 8
    private let spaceBetweenLines: CGFloat = 16
    private let paddingOfBox: CGFloat = 1
    @Environment(\.presentationMode) var presentationMode3
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    private var textFieldOriginalWidth: CGFloat {
        (textBoxWidth + CGFloat(18)) * CGFloat(viewModel.numberOfFields)
        
    }
    var body: some View {
        NavigationView{
            
            VStack {
                ZStack {    Color("P").edgesIgnoringSafeArea(.all)
                    // DOUBLE TAP AND LONG PRESS LISTENER
                    
                        Spacer()
                            .frame(height: 180)
                        HStack{
                            
                            VStack(alignment: .leading){
                                HStack{
                                    Button{
                                        presentationMode3.wrappedValue.dismiss()
                                    }label: {
                                        
                                        Image(systemName: "chevron.left")
                                        
                                            .bold()
                                            .foregroundColor(Color("Lav"))
                                        
                                        Text(" Verification Code ")
                                            .multilineTextAlignment(.leading)
                                            .font(.system(size: 32,weight: .heavy, design: .rounded))
                                            .padding(.vertical,-10)
                                            .foregroundColor(.white)
                                        
                                    }.offset(x:-30)
                                    
                                    
                                }
                                Spacer()
                                    .frame(height: 450)
                                
                                
                            }
                            
                        }
                        
                        
                        VStack{
                            
                         
                            Text("Please enter a 4-digit-code that have been sent to you through @email name ")
                                .foregroundColor(.gray)
                                .font(.system(size: 16))
                                .multilineTextAlignment(.leading)
                                .padding()
                            Text("123456")
                                .onTapGesture(count: 2) {
                                    viewModel.showPasteButton = true
                                }
                                .frame(width: textFieldOriginalWidth, height: textBoxHeight)
                                .background(Color.clear)
                                .font(Font.system(size: 90, design: .default))
                                .foregroundColor(Color.clear)
                                .onLongPressGesture(minimumDuration: 0.5) {
                                    self.viewModel.showPasteButton = true
                                }
                            
                            // OTP TEXT
                            HStack (spacing: spaceBetweenLines) {
                                ForEach(1 ... viewModel.numberOfFields, id: \.self) { digit in
                                    otpText(
                                        text: viewModel.otp(digit: digit),
                                        isEditing: viewModel.isEditing,
                                        beforeCursor: digit - 1 < viewModel.otpField.count,
                                        afterCursor: viewModel.otpField.count < digit - 1
                                    )
                                }
                            } //: HSTACK
                            
                            // TEXTFIELD FOR EDITING
                            TextField("", text: $viewModel.otpField) { isEditing in
                                viewModel.isEditing = isEditing
                            }
                            .font(Font.system(size: 90, design: .default))
                            .offset(x: 12, y: 10)
                            .frame(width: viewModel.isEditing ? 0 : textFieldOriginalWidth, height: textBoxHeight)
                            .textContentType(.oneTimeCode)
                            .foregroundColor(.clear)
                            .background(Color.clear)
                            .keyboardType(.numberPad)
                            .accentColor(.clear)
                            
                            // PASTE BUTTON
                            Button(action: pasteText, label: {
                                Text("Paste")
                            })
                            .padding(.top, 9)
                            .padding(.bottom, 9)
                            .padding(.trailing, 16)
                            .padding(.leading, 16)
                            .font(Font.system(size: 14, design: .default))
                            .accentColor(Color(.white))
                            .background(Color(colorScheme == .light ? UIColor.black : UIColor.systemGray6))
                            .cornerRadius(7.0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 7).stroke(Color(.black), lineWidth: 2)
                            )
                            .opacity(viewModel.showPasteButton ? 1 : 0)
                            .offset(x: viewModel.numberOfFields == 6 ? -150 : -100, y: -40)
                        
                            Button{
                               
                            }label: {
                                Text("Resend")
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.white)
                                    .font(.system(size: 16,weight: .medium, design: .rounded))
                                
                                .underline()}
                            Button{
                         
                            }label: {NavigationLink(destination: RegesterM2()){
                                Text("Sign In")
                                    .foregroundColor(.white)
                                    .frame(width: 350,height: 53,alignment: .center)
                                    .background(Color("Lav"))
                                    .bold()
                                    .cornerRadius(10)
                            }}
                            //                    .fullScreenCover(isPresented: $isPresented2,
                            //                                     content: TapPage.init)
                            
                            
                            
                        }
                    }
                    //: ZSTACK
            } //: VSTACK
        }.navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
    }
    func pasteText() {
        let pasteboard = UIPasteboard.general
        guard let pastedString = pasteboard.string else {
            return
        }
        let decimalInputOnly = pastedString
            .components(separatedBy:CharacterSet.decimalDigits.inverted)
            .joined()
        let otpField = decimalInputOnly.prefix(viewModel.numberOfFields)
        viewModel.otpField = String(otpField)
    }
    
    
    private func otpText(
        text: String,
        isEditing: Bool,
        beforeCursor: Bool,
        afterCursor: Bool
    ) -> some View {
        return Text(text)
            .font(Font.custom("GTWalsheim-Regular", size: 34))
            .frame(width: textBoxWidth, height: textBoxHeight)
            .background(VStack{
                Spacer()
                    .frame(height: 65)
                ZStack {
                    Capsule()
                        .frame(width: textBoxWidth, height: 2)
                        .foregroundColor(Color("Lav"))
                    
                    Capsule()
                        .frame(width: textBoxWidth, height: 2)
                        .foregroundColor(.gray)
                        .offset(x: (beforeCursor ? textBoxWidth : 0) + (afterCursor ? -textBoxWidth : 0))
                        .animation(.easeInOut, value: [beforeCursor, afterCursor])
                    .opacity(isEditing ? 1 : 0)
                } //: ZSTACK
                .clipped()
            })
            .padding(paddingOfBox)
    }
}


struct CXLRPOTPView_Previews: PreviewProvider {
    static var previews: some View {
        CXLRPOTPView(viewModel: OTPViewModel())
            .previewLayout(.sizeThatFits)
    }
}
//
//struct test: View {
//    @State var morph = false
//    @State var morph2 = false
//    @State var morph3 = false
//    @State var morph4 = false
//    @State var morph5 = false
//    @State var morphs = false
//    @State var morph2s = false
//    @State var morph3s = false
//    @State var morph4s = false
//    @State var morph5s = false
//    var body: some View {VStack{
//       ZStack{
//
//
////            Rectangle()
////                .frame(width :  100 , height :   100)
////                .offset(x: -125)
////
////            Rectangle()
////                .frame(width : morph4s ? 300 : 300, height : morph2s ? 200 : 100)
////                .foregroundColor(morph4s ? .black : .gray)
////                .cornerRadius(10)
////                .animation(.timingCurve(0, 0, 0, 0))
////                .onTapGesture {
////                    self.morphs.toggle()
////                    self.morph2s.toggle()
////                    self.morph3s.toggle()
////                    self.morph4s.toggle()
////                    self.morph5s.toggle()
////
////
////                }
////            Rectangle()
////                        .frame(width : morph2s ? 300 : 100, height : morph2s ? 100 : 100)
////                        .foregroundColor(morphs ? .black : Color("Lav"))
////                        .cornerRadius(10)
////                        .animation(.timingCurve(0, 0, 0, 0))
////                        .offset(x: morph3s ? 0 : -125)
////
////                        .onTapGesture {
////                            self.morphs.toggle()
////                            self.morph2s.toggle()
////                            self.morph3s.toggle()
////                            self.morph4s.toggle()
////                            self.morph5s.toggle()
////
////
////                        }
////
////                    .offset(x: morph5 ? 0 : -125)
//                //
//
//
//
//            }
//        ZStack{
//
//
//            //            Rectangle()
//            //                .frame(width :  100 , height :   100)
//            //                .offset(x: -125)
//
//            Rectangle()
//                .frame(width : morph4 ? 300 : 300, height : morph2 ? 200 : 100)
//                .foregroundColor(morph4 ? .gray.opacity(0.5) : .gray.opacity(0.5))
//                .cornerRadius(10)
//                .animation(.timingCurve(0, 0, 0, 0))
//                .onTapGesture {
//                    self.morph.toggle()
//                    self.morph2.toggle()
//                    self.morph3.toggle()
//                    self.morph4.toggle()
//                    self.morph5.toggle()
//
//
//                }
//            Rectangle()
//                .frame(width : morph2 ? 300 : 100, height : morph2 ? 100 : 100)
//                .foregroundColor(morph ? .gray.opacity(0.0) : Color("Lav"))
//                .cornerRadius(10)
//                .animation(.timingCurve(0, 0, 0, 0))
//                .offset(x: morph3 ? 0 : -125)
//
//                .onTapGesture {
//                    self.morph.toggle()
//                    self.morph2.toggle()
//                    self.morph3.toggle()
//                    self.morph4.toggle()
//                    self.morph5.toggle()
//
//
//                }
//
//            //                    .offset(x: morph5 ? 0 : -125)
//            //
//
//
//
//        }.preferredColorScheme(.dark)
//    }
//    }}
//
//
//struct test_Previews: PreviewProvider {
//    static var previews: some View {
//        test()
//    }
//}
//
////
////
////import SwiftUI
////
////struct test: View {
////    @State var morph = false
////    @State var morph2 = false
////    @State var morph3 = false
////
////    @State var morph4 = false
////    @State var morph5 = false
////    var body: some View {
////        ZStack{
////
////
////            Rectangle()
////                .frame(width :  300 , height :   100)
////                    Rectangle()
////                        .frame(width : morph2 ? 300 : 100, height : morph2 ? 100 : 100)
////                        .foregroundColor(morph ? .gray : .purple)
////                        .cornerRadius(10)
////                        .animation(.timingCurve(0, 0, 0, 0))
////                        .offset(x: morph3 ? 0 : -125)
////
////                        .onTapGesture {
////                            self.morph.toggle()
////                            self.morph2.toggle()
////                            self.morph3.toggle()
////                            self.morph4.toggle()
////                            self.morph5.toggle()
////
////
////                        }
////                Rectangle()
////                    .frame(width : morph4 ? 300 : 100, height : morph2 ? 200 : 100)
////                    .foregroundColor(morph4 ? .black : .blue)
////                    .cornerRadius(10)
////                    .animation(.timingCurve(0, 0, 0, 0))
////                    .offset(x: morph5 ? 0 : -125)
////                //
////
////                    .onTapGesture {
////                        self.morph.toggle()
////                        self.morph2.toggle()
////                        self.morph3.toggle()
////                        self.morph4.toggle()
////                        self.morph5.toggle()
////
////
////                    }
////
////            }
////        }
////    }
////
////
////struct test_Previews: PreviewProvider {
////    static var previews: some View {
////        test()
////    }
////}
////
//
////
////import SwiftUI
////
////struct Card: View {
////    @State var morph = false
////    @State var morph2 = false
////    @State var morph3 = false
////    @State var morph4 = false
////    @State var morph5 = false
////
////    var body: some View {
////
////        ZStack{
////
////            Rectangle()
////                .frame(width : morph4 ? 300 : 300, height : morph2 ? 200 : 100)
////                .foregroundColor(morph4 ? .gray.opacity(0.5) : .gray.opacity(0.5))
////                .cornerRadius(10)
////                .animation(.timingCurve(0, 0, 0, 0))
////                .onTapGesture {
////                    self.morph.toggle()
////                    self.morph2.toggle()
////                    self.morph3.toggle()
////                    self.morph4.toggle()
////                    self.morph5.toggle()
////
////
////                }
////            Rectangle()
////                .frame(width : morph2 ? 300 : 100, height : morph2 ? 100 : 100)
////                .foregroundColor(morph ? .gray.opacity(0.0) : Color("Lav"))
////                .cornerRadius(10)
////                .animation(.timingCurve(0, 0, 0, 0))
////                .offset(x: morph3 ? 0 : -125)
////
////                .onTapGesture {
////                    self.morph.toggle()
////                    self.morph2.toggle()
////                    self.morph3.toggle()
////                    self.morph4.toggle()
////                    self.morph5.toggle()
////
////
////                }
////
////
////        }.preferredColorScheme(.dark)
////    }
////    }
////
////
////struct Card_Previews: PreviewProvider {
////    static var previews: some View {
////        Card()
////    }
////}
