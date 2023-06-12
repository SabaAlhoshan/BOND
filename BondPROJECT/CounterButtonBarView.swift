//
//  CounterButtonBarView.swift
//  BondPROJECT
//
//  Created by saba on 22/11/1444 AH.
//


import SwiftUI

struct CounterButtonBarView: View {
    @State private var compname = ""
    @State var count: Count
    
    var body: some View {
        HStack(alignment: .center, spacing: 50) {
            TextField("Company’s name", text: $compname)
                .font(.system(size: 15,weight: .semibold, design: .rounded))
                .frame(width: 200,height: 53 ,alignment: .leading)
                .padding(.horizontal)
                .foregroundColor(.white)
                .background(.gray)
                .opacity(0.5)
                .cornerRadius(10)
            
            Button { // Decrement Button
                 count.num = compname
                print("Tap -- : \(count.num)")
            } label: {
                Image(systemName: "paperplane.fill")
            }

        
//
//            Button { // Increment Button
//                count.num += 1
//                print("Tap ++ : \(count.num)")
//            } label: {
//                Image(systemName: "plus.diamond")
//            }
        }
        .padding(.bottom, 15)
        .font(.system(size: 32))
        .foregroundColor(.white)
        .frame(width: UIScreen.main.bounds.width, height: 80, alignment: .center)
        .background(Color.black)
        .opacity(0.87)
    }
}


//
//
//{
//    HStack(alignment: .center, spacing: 50) {
//
//        Button { // Decrement Button
//            count.num -= 1
//            print("Tap -- : \(count.num)")
//        } label: {
//            Image(systemName: "minus.diamond")
//        }
//
//        Button { // Reset Button
//            count.num = 0
//            print("Tap    : \(count.num)")
//        } label: {
//            Image(systemName: "xmark.diamond.fill")
//        }
//
//        Button { // Increment Button
//            count.num += 1
//            print("Tap ++ : \(count.num)")
//        } label: {
//            Image(systemName: "plus.diamond")
//        }
//    }
//    .padding(.bottom, 15)
//    .font(.system(size: 32))
//    .foregroundColor(.white)
//    .frame(width: UIScreen.main.bounds.width, height: 80, alignment: .center)
//    .background(Color.black)
//    .opacity(0.87)
//}
