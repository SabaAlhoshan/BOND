//
//  ContentView.swift
//  BondPROJECT
//
//  Created by saba on 16/11/1444 AH.
//


import SwiftUI
import RealityKit

struct ContentView : View {
    
    var count = Count()
    
    var body: some View {
        ZStack() {
            ARViewContainer(count: count)
            VStack {
                Spacer()
                CounterButtonBarView(count: count)
            }
        }
        .edgesIgnoringSafeArea(.all)
        
        
//        HomePage()
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
