//
//  FormPage.swift
//  FeedBack
//
//  Created by Lina on 09/11/1444 AH.
//

import SwiftUI

struct FormPage: View {
    @State private var feedbackarea = ""
    @State private var showingAlert = false
        @State private var navigateToView = false
    @State private var isRectangleVisible = false
    var body: some View {
 
            
            NavigationView {
VStack {
                            Text("What would you like to share today?")
                                .foregroundColor(.white)
                                .font(Font.headline)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            RadioButtonGroups { selected in
                                print("Selected Share is: \(selected)")
                               
                            }

                            .frame(maxWidth: .infinity, alignment: .leading)
                            Text("Your free space:")
                                .font(Font.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            ZStack{

                                TextField("Enter your feedback", text: $feedbackarea)
                                
                                    .foregroundColor(.white)
                                    .offset(x:8, y:-70)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .frame(width: 320, height: 218)
                                    .background(Color("LightGray"))
                                    .cornerRadius(20)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(LinearGradient(gradient: Gradient(colors: [Color("DarkGray"), Color("DarkGray")]), startPoint: .leading, endPoint: .trailing))
                                    .cornerRadius(20)
                            }
  
        
        
        
        Button("Send") {
            isRectangleVisible = true
        }
        .foregroundColor(.white)
//        .foregroundColor(.gray)
        .frame(width: 350,height: 50)
        .background(Color("LightGray"))
        .cornerRadius(10)
        .offset(x:0, y:10)
        
        if isRectangleVisible {
            
               
                ZStack{
                    Rectangle()
                    .frame(width: 2000, height: 2000)
                    .ignoresSafeArea(.all)
                    .foregroundColor(.black)
                    .offset(x:0, y:-300)
                    Rectangle()
                        .fill(Color("DarkGray"))
                        .frame(width: 300, height: 300)
                        .cornerRadius(20)
                    VStack{
                        Image(systemName: "hand.thumbsup")
                            .resizable()
                            .frame(width: 85, height: 85)
                            .foregroundColor(Color("LightGray"))
                            .frame(width: 320, height: 20)
                            .padding()
                            .foregroundColor(Color("DarkGray"))
                        Text("Your Feedback is sent!")
                            .font(.system(size: 25))
                            .font(.title)
                            .bold()
                            .foregroundColor(Color("LightGray"))
                            .offset(x:0, y:30)
                        Text("Thank you, your voice has been heard.")
                            .font(.system(size: 15))
                            .font(.title3)
                            .foregroundColor(Color("LightGray"))
                            .offset(x:0, y:10)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                        Button(action: {
                           FormPage()                   }) {
                                Text("Done")
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 110)
                                    .padding(.vertical, 10)
                                    .background(Color("LightGray"))
                                    .cornerRadius(10)
                                 
                                
                            }.offset(x:0, y:15)
                        
                    }
                    
                }.offset(x:0, y:-290)
            
        }
    

                            
                            NavigationLink(destination: ContentView(), isActive: $navigateToView) {
                                EmptyView()
                            }
                        }
                        .navigationTitle("")
                    }
        
                
          
            
            
//        }
        .padding(20)
            .preferredColorScheme(.dark)
        
           
    }
}



struct FormPage_Previews: PreviewProvider {
    static var previews: some View {
        FormPage()
    }
}

