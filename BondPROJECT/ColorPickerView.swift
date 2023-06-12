//
//  ColorPickerView.swift
//  segmentTEST
//
//  Created by saba on 09/11/1444 AH.
//


import Foundation
import SwiftUI

struct ColorPickerView : View {
    
    let colors = [Color.black,Color.green,Color.blue,Color.red,Color.yellow]
    
    @Binding var selectedColor: Color
    
    var body : some View {
        
        VStack{
            ForEach(colors, id: \.self) { color in
                
                Image(systemName: selectedColor == color ?
                      Constance.Icons.recordCircleFill : Constance.Icons.circleFill)
                
                .foregroundColor(color)
                .font(.system(size: 16))
              
                    .clipShape(Circle())
                    
//                .stroke(Color.black, lineWidth: 2)
                .onTapGesture{
                    selectedColor = color
                }
              
                
            }
        }
        .offset(x:130,y:-50)
    }
}

struct ColorPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerView(selectedColor: .constant(.blue))
    }
}
