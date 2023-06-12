//
//  RegesterM.swift
//  Bond
//
//  Created by Ghadah on 03/11/1444 AH.
//

import SwiftUI


struct RegesterM: View {
    @State private var compname = ""
    @State private var manemail = ""
//    @Environment(\.presentationMode) var presentationMode2
    @State private var isPresented = false
    @State private var isPresented2 = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.presentationMode) var presentationMode2

    

    var body: some View {NavigationView{
        ZStack{
            
            
            Color("P").edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                    .frame(height: 60)
                HStack{
                    
                    VStack(alignment: .leading){
                        HStack{
                                                            Button{
                                                                presentationMode2.wrappedValue.dismiss()
                                                               
                                                            }label: {
                            
                                                                Image(systemName: "chevron.left")
                            
                                                                    .bold()
                                                                    .foregroundColor(Color("Lav"))
                            
                                                                Text("Company’s info")
                                                                    .multilineTextAlignment(.leading)
                                                                    .font(.system(size: 32,weight: .heavy, design: .rounded))
                                                                    .padding(.vertical,-10)
                                                                    .foregroundColor(.white)
                            
                                                            }.offset(x:-40)
                            
                            
                        }
                                                Spacer()
                                                    .frame(height: 20)
                                                Text("If you are a manger, fill in the following")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 16))
                                                    .multilineTextAlignment(.leading)
                                                    .offset(x:-18)
                        
                    }
                    
                }
                
                
                VStack{
                    Text("Name:")
                        .frame(width: 320,height: 10 ,alignment: .leading)
                        .foregroundColor(.white)
                        .font(.system(size: 25,weight: .semibold, design: .rounded))
                        .padding()
                    TextField("Company’s name", text: $compname)
                        .font(.system(size: 15,weight: .semibold, design: .rounded))
                        .frame(width: 320,height: 53 ,alignment: .leading)
                        .padding(.horizontal)
                        .foregroundColor(.white)
                        .background(.gray)
                        .opacity(0.5)
                        .cornerRadius(10)
                    Spacer()
                        .frame(height: 20)
                    
                    Text("Phone number:")
                        .font(.system(size: 25,weight: .semibold, design: .rounded))
                        .frame(width: 320,height: 10 ,alignment: .leading)
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                    TextField("5XXXXXXXX", text: $manemail)
                        .font(.system(size: 15,weight:.semibold, design: .rounded))
                        .frame(width: 320,height: 53 ,alignment: .leading)
                        .padding(.horizontal)
                        .foregroundColor(.white)
                        .background(.gray)
                        .opacity(0.5)
                        .cornerRadius(10)
                    
                    Spacer()
                        .frame(height: 50)
                    
                    
                    Button{
                       
                    }label: {
                        NavigationLink( destination: CXLRPOTPView()){
                            Text("Sign In")
                                .foregroundColor(.white)
                                .frame(width: 350,height: 53,alignment: .center)
                                .background(Color("Lav"))
                                .bold()
                                .cornerRadius(10)
                        }
                    }
                    
                    
                    HStack{
                        Text("Are you an employee? ")
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 16,weight: .medium, design: .rounded))
                            .padding(.vertical,-10)
                        
                        Button{
                            isPresented=true
                        }label: {
                            Text("Login")
                                .foregroundColor(Color("Lav"))
                                .font(.system(size: 16,weight: .medium, design: .rounded))
                                .multilineTextAlignment(.leading)
                                .underline()
                            
                        }
                        
                        
                    }
                }
            }
        }.preferredColorScheme(.dark)
         
        
            .navigationBarItems(leading: btnBack)
    }.navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
    }
    var btnBack : some View {
       VStack {
       Spacer()
               .frame(height: 100)
//            HStack{
//                                Button{
////                                    presentationMode2.wrappedValue.dismiss()
//                                    self.presentationMode.wrappedValue.dismiss()
//                                }label: {
//
//                                    Image(systemName: "chevron.left")
//
//                                        .bold()
//                                        .foregroundColor(Color("Lav"))
//
//                                    Text("Company’s info")
//                                        .multilineTextAlignment(.leading)
//                                        .font(.system(size: 32,weight: .heavy, design: .rounded))
//                                        .padding(.vertical,-10)
//                                        .foregroundColor(.white)
//
//                                }
//
//
//
//            }
//        Spacer()
//            .frame(height: 20)
//        Text("If you are a manger, fill in the following")
//            .foregroundColor(.gray)
//            .font(.system(size: 16))
//            .multilineTextAlignment(.leading)
//
           
        }
        
//        Button(action: {
//        self.presentationMode.wrappedValue.dismiss()
//        }) {
//            HStack {
//                Image(systemName: "chevron.left")
//
//                    .bold()
//                    .foregroundColor(Color("Lav"))
//
//                Text("Company’s info")
//                    .multilineTextAlignment(.leading)
//                    .font(.system(size: 32,weight: .heavy, design: .rounded))
//                    .padding(.vertical,-10)
//                    .foregroundColor(.white)
//            }
        }
    }

    
    struct RegesterM_Previews: PreviewProvider {
        static var previews: some View {
            RegesterM()
        }
    }

