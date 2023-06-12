//
//  todoLIST.swift
//  BondPROJECT
//
//  Created by saba on 16/11/1444 AH.
//



import SwiftUI

struct TodoItem: Identifiable {
    let id = UUID()
    let task: String
    var isCompleted: Bool = false
}

struct todoLIST: View {
    @State private var newTask: String = ""
    @State private var todoList: [TodoItem] = []
    
    var body: some View {
        
        ZStack{
            
            Color.accentColor
                .edgesIgnoringSafeArea(.all)
            VStack{
//                Text("Hey TEAM 👋🏼 , Let's Get it Done!")
//                    .fontWeight(.heavy)
                NavigationView{
                    
                    List {
                       
            
                        ForEach(todoList) { item in
                            
                            HStack {
                                Button(action: {
                                    
                                    toggleCompletion(for: item)
                                }, label: {
                                    Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                                        .foregroundColor(.purple)
                                    })
                                Text(item.task)
                            }
                            .listRowBackground(Color("BoxColor"))
                       
                        }
                        
                        .onDelete(perform: deleteTask)
                    }
                    
                    .background(Color.accentColor
                    )
//                    .overlay(content: {
//                        Text("Task not yet assigned")
//                            .foregroundColor(.white)
//                            .font(.system(size: 15 , weight: .regular, design: .default))
//                            .opacity(0.7)
//                    })
              
              
    
                }
//                .onAppear {
//                         // Placed here for sample purposes, normally set globally
//                         UITableView.appearance().backgroundColor = .clear
//                     }
                
              
//
//                .tint(Color.blue)
////                .background{
//
//                        Color.accentColor
//                            .edgesIgnoringSafeArea(.all)
//
//                }
                .scrollContentBackground(.hidden)
                      .frame(width: 400,height: 200 )
                
                //                }
                //                .background(.blue)
                //                .padding(40)
                
                HStack {
                    
                    TextField("Add a task", text: $newTask)
                        .accentColor(.white)
                       
                        .padding()
                        .frame(width: 300)
                       
                    
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
//                                .foregroundColor(.black)
//                                .opacity(0.3)
                                
                                .stroke(Color.purple, lineWidth: 1)
                                   
                                .frame(height: 40)
                        )
                    //                        .padding()
                    //                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    //                        .frame(width: 250)
                    
                    Button(action: {
                        addTask()
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 33,height: 33)
                                .foregroundColor(.purple)
                            Image(systemName: "plus")
                                .bold()
                                .foregroundColor(.white)
                            //                            Text("Add")
                                .font(.system(size: 15, weight: .regular, design: .rounded))
                            
                                .foregroundColor(.white)
                            
                        }
                    })
                    
                }
                .offset(y:-60)
                //                .padding(.vertical,500)
                
                
                .preferredColorScheme(.dark)
                .foregroundColor(.white)
                //            .navigationTitle("Hey TEAM 👋🏼,Let's Get it Done!")
                
                
            }
            //            .frame(width: 200,height: 200)
          
        }
    
    }
    private func addTask() {
        guard !newTask.isEmpty else { return }
        todoList.append(TodoItem(task: newTask))
        newTask = ""
    }
    
    private func deleteTask(at offsets: IndexSet) {
        todoList.remove(atOffsets: offsets)
    }
    
    private func toggleCompletion(for item: TodoItem) {
        guard let index = todoList.firstIndex(where: { $0.id == item.id }) else { return }
        todoList[index].isCompleted.toggle()
    }
}


struct todoLIST_Previews: PreviewProvider {
    static var previews: some View {
        todoLIST()
    }
}
struct CustomColor {
    static let myColor = Color("GraidantColorP")
    // Add more here...
}
