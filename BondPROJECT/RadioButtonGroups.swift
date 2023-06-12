import SwiftUI

//MARK:- Group of Radio Buttons
enum Share: String {
    case suggestion = "Suggestion"
    case complaint = "Complaint"
    case thought = "Thought"
}

struct RadioButtonGroups: View {
    let callback: (String) -> ()
    
    @State var selectedId: String = ""
    
    var body: some View {
        VStack {
            radioSuggestionMajority
            radioComplaintMajority
            radioThoughtMajority
        }
    }
    
    var radioSuggestionMajority: some View {
        RadioButtonField(
            id: Share.suggestion.rawValue,
            label: Share.suggestion.rawValue,
            isMarked: selectedId == Share.suggestion.rawValue ? true : false,
            callback: radioGroupCallback
        )
    }
    
    var radioComplaintMajority: some View {
        RadioButtonField(
            id: Share.complaint.rawValue,
            label: Share.complaint.rawValue,
            isMarked: selectedId == Share.complaint.rawValue ? true : false,
            callback: radioGroupCallback
        )
    }
    
    var radioThoughtMajority: some View {
        RadioButtonField(
            id: Share.thought.rawValue,
            label: Share.thought.rawValue,
            isMarked: selectedId == Share.thought.rawValue ? true : false,
            callback: radioGroupCallback
        )
    }

    
    func radioGroupCallback(id: String) {
        selectedId = id
        callback(id)
    }
}
