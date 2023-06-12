//
//  onboardingView.swift
//  Bond
//
//  Created by Ghadah on 08/11/1444 AH.
//

import SwiftUI

struct onboardingView: View {
    var page: Page
    
    var body: some View {
        VStack(spacing: 10) {
            Image("\(page.imageUrl)")
                .resizable()
                .scaledToFit()
                .padding()
                .cornerRadius(30)
//                .background(.gray.opacity(0.10))
                .cornerRadius(10)
                .padding()
            
            Text(page.name)
                .font(.system(size: 32,weight: .heavy, design: .rounded))
            
            Text(page.description)
                .foregroundColor(Color("gray"))
                              
                    .font(.system(size: 16,weight: .medium, design: .rounded))
                .multilineTextAlignment(.center)
                .frame(width: 300)
        }
    }
}

struct onboardingView_Previews: PreviewProvider {
    static var previews: some View {
        onboardingView(page: Page.samplePage)
    }
}
