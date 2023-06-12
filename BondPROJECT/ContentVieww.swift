
//  ContentView.swift
//  segmentTEST
//
//  Created by saba on 09/11/1444 AH.
//

import SwiftUI

struct ContentVieww: View {
    @Environment(\.presentationMode) var presentationMode2
    enum ViewSelection: String, CaseIterable {
        case view1 = "Note"
        case view2 = "Post"
        case view3 = "Tamplete"
    }
    
    @State private var selectedView = ViewSelection.view1
    @State private var image: Image? = nil
    
    var body: some View {
        
        
        
        ZStack{
            
            
            Color.accentColor
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading){
               
                    
                    Button{
                        presentationMode2.wrappedValue.dismiss()
                        
                    }label: {
                        
                        Image(systemName: "chevron.left")
                        
                            .bold()
                            .foregroundColor(Color("Lav"))
                        
                        
                        
                    }.padding()
            
                VStack {
                    Picker(selection: $selectedView, label: Text("Select a view")) {
                        ForEach(ViewSelection.allCases, id:\.self) { viewSelection in
                            Text(viewSelection.rawValue)
                                .foregroundColor(.white)
                        }
                        
                    }   .padding(.horizontal,50)
                        .padding()
                        .pickerStyle(SegmentedPickerStyle())
                       
                    
                    ZStack {
                        Rectangle()
                            .fill(Color.white)
                        
                        if selectedView == .view1 {
                            View1()
                        } else if selectedView == .view2 {
                          View2()
                        } else {
                            View3()
                        }
                    }
                    .frame(width: 300, height: 300)
                    .cornerRadius(15)
                    .shadow(radius: 3)
                    Button{}label: {

                        
                    }
                    
                }.offset(y:-100)
                .padding(.vertical,170)
                
            }
                    ZStack{
                        Rectangle()
                            .fill(Color("Lav"))
                            .frame(width: 200,height: 53)
                            .cornerRadius(15)
                        Text("Share it")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                      
                    }  .offset(y:200)

        }
      
        
        
        
    }
}


        
    struct Line {
        var points = [CGPoint]()
        var color : Color = .red
        var lineWidth : Double = 1.0
    }
struct View1: View {
        
        @State private var currentLine = Line()
        @State private var lines : [Line] = []
        @State private var selectedColor : Color = .red
        //by defaukt will select red


        var body: some View {
          
          
            ZStack{
                
                Canvas {  context, size in
                    for line in lines {
                        var path = Path()
                        path.addLines(line.points)
                        context.stroke(path, with: . color(line.color), lineWidth: line.lineWidth)
                    }
                }
              
                
                .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                    .onChanged({ value in
                        let newPoint = value.location
                        currentLine.points.append(newPoint)
                        self.lines.append(currentLine)
                    //drawing
                })
                        . onEnded({
                            value in
                            
                          //  self.lines.append(currentLine)
                            self.currentLine = Line(points: [],color: selectedColor)
                            //creating seperate lines
                        })
                )
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.black)
                    .opacity(0.4)
                    .frame(width:25,height:130)
                    .offset(x:130,y:-60)
                ColorPickerView(selectedColor: $selectedColor)
                
                Button(action: {}, label: {
                  Image(systemName: "arrow.counterclockwise")
                        .resizable()
                        .frame(width: 15,height: 15)
                        .foregroundColor(.white)
                        
                        .bold()
                })
            //padding for the return button
                .padding(.leading,260)
                .padding(.top,-115)
                
                    .onChange(of: selectedColor) { newColor in
                        currentLine.color = newColor
                    }
                   
            }
     
            .frame(minWidth: 100 , minHeight: 100)
           
        }
      
    }



struct View2: View {
    
    let imageNames = ["image1", "image2", "image3"]
    @State private var showCamera = false
    @State private var image: Image? = nil
    var body: some View {

   
     
        ZStack{
            
            
            
             
                      Button(action: {
                          self.showCamera = true
                              
                                     }) {
                                         ZStack{
                                             
                                             Rectangle()
                                                 .fill(.white)
                                                 .frame(width: 300, height: 500)
                                                 .cornerRadius(8)
                                             Text("Click to share a new post!")
                                                 .foregroundColor(Color("Lav"))
                                             
                                                 .font(.system(size: 20, weight: .semibold, design: .rounded))
                                         }
                      }

            
                .sheet(isPresented: $showCamera) {
                    ImagePickerView(sourceType: .camera, selectedImage: self.$image)
                }
      //1
                    
                      VStack {
                          
                          if let image = image{
                              image
                                  .resizable()
                                  .frame(width: 300, height: 500)
                                  .cornerRadius(8)
                              
                          }
                      }
            
     
//

                  
                     
                
        }
//        .sheet(isPresented: $showCamera) {
//            ImagePickerView(sourceType: .camera, selectedImage: self.$image)
//        }
            
            
            
        
    
    }
}

struct View3: View {
    var body: some View {
        Text("View 3")
    }
}

struct ContentVieww_Previews: PreviewProvider {
    static var previews: some View {
        ContentVieww()
    }
}
