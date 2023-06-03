//
//  onboardingAll.swift
//  Bond
//
//  Created by Ghadah on 08/11/1444 AH.
//

import SwiftUI

struct onboardingPage: View {
    @State private var pageIndex = 0
    
    private let pages: [Page] = Page.samplePages
    private let dotAppearance = UIPageControl.appearance()
    
    var body: some View {
        NavigationView{
            ZStack{
                Color("P").edgesIgnoringSafeArea(.all)
                VStack{
                    TabView(selection: $pageIndex) {
                        ForEach(pages) { page in
                            
                            VStack {
                                onboardingView(page: page)
                                //                                .padding(.vertical,40)
                                    .offset(y:-10)
                                if page == pages.last {
                                    
                                    Button{} label: {   NavigationLink(destination: launch()){ ZStack{
                                        
                                        Text("Sign up")
                                            .frame(width: 350,height: 53,alignment: .center)
                                            .background(Color("Lav"))
                                            .cornerRadius(10)
                                            .foregroundColor(.white)
                                            .font(.system(size: 18,weight: .semibold, design: .rounded))
                                            .padding(20)
                                        
                                            .bold()
                                        
                                    }}}
                                    HStack {
                                        Text("Or")
                                            .foregroundColor(.white)
                                            .multilineTextAlignment(.leading)
                                            .font(.system(size: 16,weight: .medium, design: .rounded))
                                        Button{
                                            
                                        }label: {
                                            Text(" Join as new !")
                                                .foregroundColor(Color("Lav"))
                                                .font(.system(size: 16,weight: .medium, design: .rounded))
                                            
                                                .underline()
                                            
                                            
                                        }
                                        
                                    }
                                    
                                    //                                    .buttonStyle(.bordered)
                                    
                                    
                                } else {
                                    Button(action: incrementPage, label: { ZStack{
                                        
                                        Text("Next")
                                            .frame(width: 350,height: 53,alignment: .center)
                                            .background(.white)
                                            .cornerRadius(10)
                                            .foregroundColor(Color("Lav"))
                                            .foregroundColor(.white)
                                            .font(.system(size: 18,weight: .semibold, design: .rounded))
                                            .padding(30)
                                        
                                            .bold()
                                        
                                    }})
                                    .padding(.vertical,10)
                                }
                                
                            }
                            .tag(page.tag)
                            
                        }
                    }      .padding(.vertical,30)
                    //        .animation(.easeInOut, value: pageIndex)// 2
                        .indexViewStyle(.page(backgroundDisplayMode: .interactive))
                    
                        .tabViewStyle(PageTabViewStyle())
                    
                    //        .onAppear {
                    //            dotAppearance.currentPageIndicatorTintColor = .white
                    //            dotAppearance.pageIndicatorTintColor = .gray
                    //
                    //        }
                    
                    
                }
            }}
        .preferredColorScheme(.dark)
        //        Button("next", action: incrementPage)
        //            .buttonStyle(.borderedProminent)
        
        
        //            .offset(y:-200)
    
    }
        func incrementPage() {
            pageIndex += 1
        }
        
        func goToZero() {
            pageIndex = 0
        }
    }

struct onboardingPage_Previews: PreviewProvider {
    static var previews: some View {
        onboardingPage()
    }
}
