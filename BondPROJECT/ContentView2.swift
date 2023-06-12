//
//  ContentView2.swift
//  segmentTEST
//
//  Created by saba on 09/11/1444 AH.
//
import SwiftUI

struct ContentView2: View {

    enum ViewSelection: String, CaseIterable {
        case view4 = "View 4"
        case view5 = "View 5"
        case view6 = "View 6"
    }

    @State private var selectedView = ViewSelection.view4

    var body: some View {
        VStack {
            Picker(selection: $selectedView, label: Text("Select a view")) {
                ForEach(ViewSelection.allCases, id:\.self) { viewSelection in
                    Text(viewSelection.rawValue)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .accentColor(.red)

            if selectedView == .view4 {
                View4()
            } else if selectedView == .view5 {
                View5()
            } else {
                View6()
            }
        }
    }
}

struct View4: View {
    var body: some View {
        Text("View 1")
    }
}

struct View5: View {
    var body: some View {
        Text("View 2")
    }
}

struct View6: View {
    var body: some View {
        Text("View 3")
    }
}
struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
