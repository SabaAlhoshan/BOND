//
//  ContentView1.swift
//  segmentTEST
//
//  Created by saba on 09/11/1444 AH.
//
import SwiftUI

struct ContentView1: View {

    enum ViewSelection: String, CaseIterable {
        case view1 = "View 1"
        case view2 = "View 2"
        case view3 = "View 3"

        var color: Color {
            switch self {
            case .view1:
                return .red
            case .view2:
                return .blue
            case .view3:
                return .green
            }
        }
    }

    @State private var selectedView = ViewSelection.view1

    var body: some View {
        VStack {
            Picker(selection: $selectedView, label: Text("Select a view")) {
                ForEach(ViewSelection.allCases, id:\.self) { viewSelection in
                    Text(viewSelection.rawValue)
                }
            }
            .pickerStyle(SegmentedPickerStyle())

            List {
                ForEach(1..<10) { index in
                    Text("Row \(index)")
                        .background(selectedView.color)
                }
            }
        }
    }
}
struct ContentView1_Previews: PreviewProvider {
    static var previews: some View {
        ContentView1()
    }
}
