//
//  HomePage.swift
//  BondPROJECT
//
//  Created by saba on 16/11/1444 AH.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        ZStack{
            
            Color.accentColor
                .edgesIgnoringSafeArea(.all)
            HStack(alignment:.center,spacing: 160 ){
                VStack(alignment:.leading){
                    Text("Hello,")
                        .foregroundColor(.gray)
                        .font(.system(size: 30, weight: .medium, design: .default))
                       
                    Text("SABA")
                        .foregroundColor(.white)
                        .font(.system(size: 40, weight: .heavy, design: .default))
                        .opacity(0.6)
                     
                }
            
                Image("ProfileImage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60,height:60)
                
            }
           
            .padding(.vertical,-400)
            //
            VStack{
                Text("Hey Team 👋🏼, Let’s Get It DONE!")
                    .foregroundColor(.white)
                    .font(.system(size: 18 , weight: .regular, design: .default))
                    .opacity(0.6)
                    .offset(x:-40,y:-280)
                    Rectangle()
                    .frame(width: 350 , height: 0.5)
                    .opacity(0.2)
                    .offset(y:-290)
                    
//                Divider()
//
//                    .background(.white)
//                    .frame(width: 350)
            }
            VStack{
                todoLIST()
                    .frame(width: 100,height: 200)
                    .padding(.bottom,250)
                Text("Activites")
                    .foregroundColor(.white)
                    .font(.system(size: 15 , weight: .regular, design: .default))
                    .opacity(0.7)
                    .offset(x:-120,y:-270)
                Rectangle()
                .frame(width: 350 , height: 0.5)
                .opacity(0.2)
                .offset(y:-280)
            }
            
            Button {
                
            }label: {
                ZStack
                {
                    
                    RoundedRectangle(cornerRadius: 10)
                    
                        .frame(width: 150,height: 50)
                        .foregroundColor(Color("GraidantColorP"))
                        .shadow(radius: 10)
                        
                    Text("New Bond")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                    
                }
            }
            .padding(.top,720)
            
            Button {
                
            }label: {
                ZStack
                {
                    
                    RoundedRectangle(cornerRadius: 10)
                    
                        .frame(width: 100,height: 160)
                        .foregroundColor(Color("BoxColor"))
                        .shadow(radius: 17)
                    VStack(spacing: -10){
                        Text("AR Gifts")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                        Text("See What you’ve received From your Manager !SCAN, CPTURE, SHAREYOU DESERVED IT!")
                            .foregroundColor(.white)
                            .font(.system(size: 10, weight: .light, design: .rounded))
                            .multilineTextAlignment(.center)
                            .frame(width: 90 , height: 100)
                    }
                }
            }
            .padding(.top,110)
            .padding(.leading,205)
            
            
            Button {
                
            }label: {
                ZStack
                {
                    
                    RoundedRectangle(cornerRadius: 10)
                    
                        .frame(width: 190,height: 160)
                        .foregroundColor(Color("BoxColor"))
                        .shadow(radius: 17)
                    VStack(spacing: 5){
                        Text("Send Anonymous Feedback")
                            .foregroundColor(.white)
                            .font(.system(size: 10, weight: .bold, design: .rounded))
                        Text("Share whatever you want anonymously to your manager.A thought, compliment or anything bothering you at work!")
                            .foregroundColor(.white)
                            .font(.system(size: 10, weight: .light, design: .rounded))
                            .multilineTextAlignment(.center)
                            .frame(width: 90 , height: 100)
                    }
                }
            }
            .padding(.top,450)
            .padding(.leading,120)
                
            
            Button {
                
            }label: {
                ZStack
                {
                    
                    RoundedRectangle(cornerRadius: 10)
                    
                        .frame(width: 100,height: 160)
                        .foregroundColor(Color("BoxColor"))
                        .shadow(radius: 17)
                    VStack(spacing: -20){
                        Text("BONDS’ Board")
                            .foregroundColor(.white)
                            .font(.system(size: 11, weight: .bold, design: .rounded))
                        Text("All previous Bonds See what you’ve missed!and give it a REACTION.")
                            .foregroundColor(.white)
                            .font(.system(size: 10, weight: .light, design: .rounded))
                            .multilineTextAlignment(.center)
                            .frame(width: 90 , height: 100)
                    }
                }
            }
            .padding(.top,450)
            .padding(.leading,-145)
            
            
            
            Button {
                
            }label: {
                
                //image button
                RoundedRectangle(cornerRadius: 16,style: .continuous)
                //                        .fill(Color.blue)
                
                    .stroke(Color("BoxColor"), lineWidth: 2)
                
                //                            .foregroundColor(.blue)
                //
                    .frame(width: 190 , height: 160)
                
                //                            .frame(width: 300 , height: 300)
                
                
                
                
                
                
            }
            .padding(.top,110)
            .padding(.leading,-105)
        }
            
        }
    }

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}





