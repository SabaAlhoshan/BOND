//
//  RegesterM2.swift
//  Bond
//
//  Created by Ghadah on 08/11/1444 AH.
//
import SwiftUI


struct RegesterM2: View {
    @State private var namee = ""
    @State private var pass = ""
    @State private var pass2 = ""
    @Environment(\.presentationMode) var presentationMode2
    @State private var isPresented = false
    @State private var isPresented2 = false
    @State private var idea = ""
    @State private var image = UIImage()
    @State private var showSheet = false
    @State private var T = "Click to Add Image"
    @State private var titale = ""
    @State private var des = ""
    @State var photoIcon="person.crop.circle.fill.badge.plus"
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {NavigationView{
        ZStack{
            Color("P").edgesIgnoringSafeArea(.all)
            VStack {
                
                HStack{
                    
                    VStack(alignment: .leading){
                        HStack{
                            Button{
                                presentationMode2.wrappedValue.dismiss()
                            }label: {

                                Image(systemName: "chevron.left")

                                    .bold()
                                    .foregroundColor(Color("Lav"))

                                Text(" Your profile ")
                                    .multilineTextAlignment(.leading)
                                    .font(.system(size: 32,weight: .heavy, design: .rounded))
                                    .padding(.vertical,-10)
                                    .foregroundColor(.white)

                            }.offset(x:-40)


                        }
                        Spacer()
                            .frame(height: 20)
                        Text("If you are an employee , fill the following")
                            .foregroundColor(.gray)
                            .font(.system(size: 16))
                            .multilineTextAlignment(.leading)
                            .offset(x:-18)

                    }
                    
                }
                //                ZStack{
                //
                //
                //
                //                    Image(uiImage: self.image)
                //
                //                        .resizable()
                //                        .cornerRadius(20)
                //                        .frame(width: 350, height: 200)
                //
                //                        .background(Color("blue").opacity(0.2))
                //                        .aspectRatio(contentMode: .fit)
                //                        .clipShape(RoundedRectangle(cornerRadius: 10))
                //                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("blue")))
                //                        .padding()
                //
                //                        .onTapGesture {
                //                            showSheet = true
                //                            T = ""
                //                            photoIcon=""
                //
                //                        }
                //                    Image(systemName: "\(photoIcon)")
                //                        .foregroundColor(.white)
                //                        .font(.system(size: 40))
                //                        .padding(.vertical,-40)
                //                        .frame( alignment: .center)
                //                        .opacity(0.6)
                //                    Text(T)
                //                        .font(.system(size: 10))
                //                        .font(.body)
                //                        .offset(y:20)
                //                        .foregroundColor(.white)
                //                        .offset(y:9)
                //                } .sheet(isPresented: $showSheet) {
                //                    // Pick an image from the photo library:
                //                    ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
                
                //                    Button{
                //
                //                    }label: {
                ZStack{
                    Image(uiImage: self.image)
                    
                        .resizable()
                        .cornerRadius(100)
                        .frame(width: 100, height: 100)
                    
                        .background(Color("blue").opacity(0.2))
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(.white.opacity(0)))
                        .padding()
                    
                        .onTapGesture {
                            showSheet = true
                            T = ""
                            photoIcon=""}
                    Image(systemName:photoIcon)
                    
                        .bold()
                        .foregroundColor(Color("Lav"))
                        .font(.system(size: 60))
                        .padding()
                }
                
                
                //                    }
                .sheet(isPresented: $showSheet) {
                    // Pick an image from the photo library:
                    ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)}
                VStack{
                    //                    Button{
                    //
                    //                    }label: {
                    //
                    //                        Image(systemName:"person.crop.circle.fill.badge.plus")
                    //
                    //
                    //
                    //
                    //                    }
                    
                    Text("Name :")
                        .frame(width: 320,height: 10 ,alignment: .leading)
                        .foregroundColor(.white)
                        .font(.system(size: 20,weight: .semibold, design: .rounded))
                        .padding()
                    TextField("ex : Khalid", text: $namee)
                        .font(.system(size: 15,weight: .semibold, design: .rounded))
                        .frame(width: 320,height: 53 ,alignment: .leading)
                        .padding(.horizontal)
                        .foregroundColor(.white)
                        .background(.gray)
                        .opacity(0.5)
                        .cornerRadius(10)
                    Spacer()
                        .frame(height: 20)
                    
                    Text("Password :")
                        .font(.system(size: 20,weight: .semibold, design: .rounded))
                        .frame(width: 320,height: 10 ,alignment: .leading)
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                    SecureField("************* ", text: $pass)
                        .font(.system(size: 15,weight:.semibold, design: .rounded))
                        .frame(width: 320,height: 53 ,alignment: .leading)
                        .padding(.horizontal)
                        .foregroundColor(.white)
                        .background(.gray)
                        .opacity(0.5)
                        .cornerRadius(10)
                    Text("Confirm password :")
                        .font(.system(size: 20,weight: .semibold, design: .rounded))
                        .frame(width: 320,height: 10 ,alignment: .leading)
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                    SecureField("*************  ", text: $pass2)
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
                        isPresented2=true
                    }label: {
                        Text("Sign In")
                            .foregroundColor(.white)
                            .frame(width: 350,height: 53,alignment: .center)
                            .background(Color("Lav"))
                            .bold()
                            .cornerRadius(10)
                    }
                    //                    .fullScreenCover(isPresented: $isPresented2,
                    //                                     content: TapPage.init)
                    
                    
                    HStack{
                        Text("Already an employee? ")
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
                            //                        }   .fullScreenCover(isPresented: $isPresented, content: SignUpIdeaOwner.init)
                            
                        }
                        //                        SignInWithAppleButton(
                        //                            onRequest: { request in
                        //                                print("onRequest")                            },
                        //                            onCompletion: { result in
                        //                                print("")
                        //                            }
                        //                        ).frame(width: 300, height: 50)
                        //
                        
                        
                    }
                }
            }
        }.preferredColorScheme(.dark)
            .navigationBarItems(leading: btnBack2)
    } .navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
    }
    var btnBack2 : some View {
        VStack {
//            HStack{
//                Button{
//                    presentationMode2.wrappedValue.dismiss()
//                }label: {
//
//                    Image(systemName: "chevron.left")
//
//                        .bold()
//                        .foregroundColor(Color("Lav"))
//
//                    Text(" Your profile ")
//                        .multilineTextAlignment(.leading)
//                        .font(.system(size: 32,weight: .heavy, design: .rounded))
//                        .padding(.vertical,-10)
//                        .foregroundColor(.white)
//
//                }.offset(x:-40)
//
//
//            }
//            Spacer()
//                .frame(height: 20)
//            Text("If you are an employee , fill the following")
//                .foregroundColor(.gray)
//                .font(.system(size: 16))
//                .multilineTextAlignment(.leading)
//                .offset(x:-18)
//
        }
        
    }}
    
    struct RegesterM2_Previews: PreviewProvider {
        static var previews: some View {
            RegesterM2()
        }
    }
    

