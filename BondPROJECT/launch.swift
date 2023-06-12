//
//  launch.swift
//  Bond
//
//  Created by Ghadah on 02/11/1444 AH.
//

import SwiftUI

struct launch: View {
    @State var isPresented = false
    var body: some View {NavigationView{
        ZStack {
            
            Color("P").edgesIgnoringSafeArea(.all)
            VStack{
                Image("workers")
                    .resizable()
                    .scaledToFit()
                    .padding(.vertical,-60)
                Spacer()
                //                .imageScale(.large)
                //                .foregroundColor(.accentColor)
                VStack(alignment: .leading){
                    Text("Let’s Bond !")
                        .multilineTextAlignment(.leading)
                    //                    .font(.system(.body, design: .rounded))
                        .foregroundColor(.white)
                    
                        .font(.system(size: 32,weight: .heavy, design: .rounded))
                    //                        .fontWeight(.heavy)
                        .padding(.bottom,-15)
                        .padding()
                    Text("Bond with your employees within the company by creating a community, keep everyone updated and cheered up.")
                        .foregroundColor(Color("gray"))
                        .padding()
                        .font(.system(size: 16,weight: .medium, design: .rounded))
                        .multilineTextAlignment(.leading)
                    }
                Spacer()
                    .frame(height: 20)
                
                Button {
                    
                    print("Button pressed")
                } label: {
                    NavigationLink(destination: RegesterM()){
                        ZStack{
                            Rectangle()
                                .frame(width: 350,height: 53,alignment: .center)
                                .foregroundColor(Color("Lav"))
                                .cornerRadius(10)
                            
                            Text("Create")
                                .font(.system(size: 18,weight: .semibold, design: .rounded))
                                .padding(20)
                                .foregroundColor(.white)
                                .bold()
                            
                            
                            //                        Rectangle()
                            //                            . frame (width: 300, height: 300)
                            //                            .foregroundColor(morph ? .blue : .green)
                            //                            .cornerRadius (morph ? 300/2 : 0)
                            //
                            //                            .onTapGesture {
                            //
                            //                                self.morph.toggle()
                            
                        }
                    }
                    
                    
                    
                    
                }
                HStack{
                    Text("Already have a community ? ")
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 16,weight: .medium, design: .rounded))
                    Button{
                        isPresented=true
                    }label: {
                        Text("Sign in")
                            .foregroundColor(Color("Lav"))
                            .font(.system(size: 16,weight: .medium, design: .rounded))
                        
                            .underline()
                        
                        
                    }
                    
                }
                Spacer()
                    .frame(height: 30)
            }
            
            
        }
          
    }  .navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            
        }
    }
    
    struct launch_Previews: PreviewProvider {
        static var previews: some View {
            launch()
        }
    
}
