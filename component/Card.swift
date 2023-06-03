//
//  Card.swift
//  Bond
//
//  Created by Ghadah on 08/11/1444 AH.
//

import SwiftUI

struct Card: View {
    @State var morph = false
    @State var morph2 = false
    @State var morph3 = false
    @State var morph4 = false
    @State var morph5 = false
  
    var body: some View {
      
        ZStack{
            
            Rectangle()
                .frame(width : morph4 ? 300 : 300, height : morph2 ? 200 : 100)
                .foregroundColor(morph4 ? .gray.opacity(0.5) : .gray.opacity(0.5))
                .cornerRadius(10)
                .animation(.timingCurve(0, 0, 0, 0))
                .onTapGesture {
                    self.morph.toggle()
                    self.morph2.toggle()
                    self.morph3.toggle()
                    self.morph4.toggle()
                    self.morph5.toggle()
                    
                    
                }
            Rectangle()
                .frame(width : morph2 ? 300 : 100, height : morph2 ? 100 : 100)
                .foregroundColor(morph ? .gray.opacity(0.0) : Color("Lav"))
                .cornerRadius(10)
                .animation(.timingCurve(0, 0, 0, 0))
                .offset(x: morph3 ? 0 : -125)
            
                .onTapGesture {
                    self.morph.toggle()
                    self.morph2.toggle()
                    self.morph3.toggle()
                    self.morph4.toggle()
                    self.morph5.toggle()
                    
                    
                }
            
            
        }.preferredColorScheme(.dark)
    }
    }


struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card()
    }
}
