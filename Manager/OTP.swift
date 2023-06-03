//
//  OTP.swift
//  Bond
//
//  Created by Ghadah on 08/11/1444 AH.
//

import SwiftUI
//import _AuthenticationServices_SwiftUI

//كلمي البنات عن الخط
struct OTP: View {
    @State private var n1 = ""
    @State private var n2 = ""
    @State private var n3 = ""
    @State private var n4 = ""
    @Environment(\.presentationMode) var presentationMode2
    @State private var isPresented = false
    @State private var isPresented2 = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {NavigationView{
        ZStack{
            Color("P").edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                    .frame(height: 180)
                HStack{
                    
                    VStack(alignment: .leading){
                        HStack{
                            Button{
                                presentationMode2.wrappedValue.dismiss()
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
                            .frame(height: 50)
                        
                        
                    }
                    
                }
                
                
                VStack{
                    HStack{
                        TextField("", text: $n1)
                            .font(.system(size: 15,weight: .semibold, design: .rounded))
                            .frame(width: 61,height: 60 )
                            .foregroundColor(.white)
                            .background(.gray)
                            .opacity(0.5)
                            .cornerRadius(10)
                            .keyboardType(.decimalPad)
                            .padding(.horizontal,5)
                        
                        
                        TextField("", text: $n2)
                            .font(.system(size: 15,weight: .semibold, design: .rounded))
                            .frame(width: 61,height: 60 )
                            .foregroundColor(.white)
                            .background(.gray)
                            .opacity(0.5)
                            .keyboardType(.decimalPad)
                            .cornerRadius(10)
                            .padding(.horizontal,5)
                        
                        
                        TextField("", text: $n3)
                            .font(.system(size: 15,weight: .semibold, design: .rounded))
                            .frame(width: 61,height: 60 )
                            .foregroundColor(.white)
                            .background(.gray)
                            .opacity(0.5)
                            .cornerRadius(10)
                            .keyboardType(.decimalPad)
                            .padding(.horizontal,5)
                        
                        TextField("", text: $n4)
                            .font(.system(size: 15,weight: .semibold, design: .rounded))
                            .frame(width: 61,height: 60 )
                            .foregroundColor(.white)
                            .background(.gray)
                            .opacity(0.5)
                            .cornerRadius(10)
                            .keyboardType(.decimalPad)
                            .padding(.horizontal,5)
                        
                        
                    }
                    Text("Please enter a 4-digit-code that have been sent to you through @email name ")
                        .foregroundColor(.gray)
                        .font(.system(size: 16))
                        .multilineTextAlignment(.leading)
                        .padding()
                    Button{
                        isPresented=true
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
        }.preferredColorScheme(.dark)
            .navigationBarItems(leading: btnBack3)
    } .navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
    }
    var btnBack3 : some View {
        VStack {
            Spacer()
                .frame(height: 100)
//            HStack{
//                Button{
//
//                    self.presentationMode.wrappedValue.dismiss()
//                }label: {
//
//                    Image(systemName: "chevron.left")
//
//                        .bold()
//                        .foregroundColor(Color("Lav"))
//
//                    Text("Company’s info")
//                        .multilineTextAlignment(.leading)
//                        .font(.system(size: 32,weight: .heavy, design: .rounded))
//                        .padding(.vertical,-10)
//                        .foregroundColor(.white)
//
//                }
//            }
//            Spacer()
//                .frame(height: 20)
//            Text("If you are a manger, fill in the following")
//                .foregroundColor(.gray)
//                .font(.system(size: 16))
//                .multilineTextAlignment(.leading)
            
            
        }
        
    }}
    
    struct OTP_Previews: PreviewProvider {
        static var previews: some View {
            OTP()
        }
    }

