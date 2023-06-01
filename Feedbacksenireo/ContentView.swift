

import SwiftUI

struct ContentView: View {
//    @State var cards: Array<String> = []
//    @State var isExpanded: Array<Bool> = []
    @State var isExpanded = false
    @State var selectedCard: Feedset? = nil
    @State private var FeedSet_array: [Feedset] = Feedset.get_all()
    var body: some View {
      
            VStack(spacing: 0){
//                HStack {
//                    Text("Collection")
//                    Button {
//                        FeedSet_array.append(Feedset(setcategory: "Testing", department: "black", feedcontent: "Sorry, but I don't like how the new way of meetnigs is going.", days:"7"))
//                    } label: {
//                        Image(systemName: "plus")
//                            .resizable()
//                            .frame(width: 30, height: 30)
//                            .padding()
//                    }
//
//                }
                ScrollView {
                    ForEach(FeedSet_array) { feedset in
//                    ForEach(0..<cards.count, id: \.self) { i in
                        Button(
                            action: {
                             
                                        withAnimation {
                                            selectedCard = feedset
                                              //  isExpanded.toggle()
                                               

                                            
                                        }
                                
                            },
                            label: {
                                ZStack {
                                    
                                    if selectedCard == feedset {
                                        
                                        Rectangle()
                                            .fill(Color("DarkGray"))
                                            .frame(width: 349, height: 349)
                                            .cornerRadius(20)
                                            .multilineTextAlignment(.center)
                                            .offset(x:0, y: 10)
                                        ZStack{
                                        Color.purple
                                            .cornerRadius(20)
                                            .padding(.horizontal, 20)
                                            .padding(.vertical, 145)
                                        
                                            .offset(x:0, y: -140)
                                        Color.purple
                                            .padding(.horizontal, 20)
                                            .padding(.vertical, 145)
                                            .offset(x:0, y: -120)
                                            HStack{
//                                                Spacer()
                                                Text(feedset.days)
                                                
                                                    .foregroundColor(.white)
                                                    .bold()
//                                                Spacer()
                                                Text("Day")
                                                    .foregroundColor(.white)
                                                    .bold()
//                                                Spacer()
                                                
                                            }.offset(x:0, y: -130)

                                    }
                                        
                                        VStack {
                                            
                                          

                                            
                                            
                                            
                                            ZStack{

                                                Rectangle()
                                                    .fill(Color("LightGray"))
                                                    .frame(width: 310, height: 180)
                                                    .cornerRadius(20)
                                                Text(feedset.feedcontent)
                                                    .font(.caption)
                                                    .foregroundColor(.white)
                                            }.offset(x:0, y:-15)
                                            Button(action: {
                                               FormPage()                   }) {
                                                    Text("Done")
                                                        .foregroundColor(.white)
                                                        .padding(.horizontal, 130)
                                                        .padding(.vertical, 10)
                                                        .background(Color("LightGray"))
                                                        .cornerRadius(10)

                                                }.offset(x:0, y:-10)

                                            
                                        }.offset(x: 0, y: 50)
                                            .padding(42)
                                            .multilineTextAlignment(.center)
                                        
                                        
                                    } else {
                                        Rectangle()
                                            .fill(Color("DarkGray"))
                                            .frame(width: 328, height: 126)
                                            .cornerRadius(20)
                                            .multilineTextAlignment(.center)
                                        VStack {
                                            
                                            
                                            Text(feedset.setcategory)
                                                .font(.system(size: 20, weight: .bold))
                                                .foregroundColor(.white)
                                                .offset(x:0, y: -10)

                 
                                            Text("Click to check your feedback")
                                                .font(.caption)
                                                .foregroundColor(.white)
                                                .offset(x:30, y: -1)
                                            
                                        }
                                        .multilineTextAlignment(.center)
                                        
                                        
                                        HStack{
                                            
                                            VStack{
                                                
                                                Spacer()
                                                Text(feedset.days)
                                                
                                                    .foregroundColor(.white)
                                                    .bold()
                                                Spacer()
                                                Text("Day")
                                                    .foregroundColor(.white)
                                                    .bold()
                                                Spacer()
                                                
                                                
                                            }.offset(x:30, y: 0)
                                            
                                                .padding(30)
                                                .background{
                                                    Color.purple
                                                        .cornerRadius(20)
                                                        .offset(x:30, y: 0)
                                                    Color.purple
                                                        .padding(.horizontal, 10)
                                                        .padding(.vertical,0)
                                                        .offset(x:45, y: 0)
                                                    
                                                }
                                            
                                            Spacer()
                                            
                                            
                                        }
                                        
                                        
                                    }
                                    
                                    //                                }
                                }
                                
                            }
                        )
//                    }
                }
            }.onChange(of: FeedSet_array) { newValue in
                //            Update this database, and somehow store the data
                //            and save it permanently… even after restarting the phone
                print("Update this database, and somehow store the data and save it permanently… even after restarting the phone")
                print(FeedSet_array.count)
                
            }.preferredColorScheme(.dark)
            
//                .onAppear {
//                    cards = Array(1...100).map(\.description)
//                    isExpanded = .init(repeating: false, count: cards.count)
//                }
        }
    }
}

import SwiftUI
struct Feedset: Identifiable, Equatable {
    let id = UUID()
    let setcategory: String
    let department: String
    let feedcontent: String
    let days: String
    
    static func get_all() -> [Feedset] {
        return [Feedset(setcategory: "Suggestion", department: " Operations Employee", feedcontent: "Sorry, but I don't like how the new way of meetnigs is going I hope we can go back to the old one.", days:"1"),
                Feedset(setcategory: "Complaint", department: "Finance Employee", feedcontent: "Sorry, but I don't like how the new way of meetnigs is going I hope we can go back to the old one.", days:"2"),Feedset(setcategory: "Thought", department: "Intrnal IT Employee", feedcontent: "Sorry, but I don't like how the new way of meetnigs is going I hope we can go back to the old one.", days:"3"),Feedset(setcategory: "Suggestion", department: "Intrnal IT Employee", feedcontent: "Sorry, but I don't like how the new way of meetnigs is going I hope we can go back to the old one.", days:"4"),Feedset(setcategory: "Complaint", department: "Intrnal IT Employee", feedcontent: "Sorry, but I don't like how the new way of meetnigs is going I hope we can go back to the old one.", days:"5"),Feedset(setcategory: "Thought", department: "Intrnal IT Employee", feedcontent: "Sorry, but I don't like how the new way of meetnigs is going I hope we can go back to the old one.", days:"6")
        ]
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
