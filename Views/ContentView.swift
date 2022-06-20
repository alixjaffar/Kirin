//
//  ContentView.swift
//  Kirin
//
//  Created by Ali Jaffar on 2022-05-26.
//

import SwiftUI
import UIKit

struct ContentView: View {

    @State var tapped = false
    @State private var fadeInOut = false
    @State private var showImage: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    @State var isPresenting: Bool = false
    @State var uiImage: UIImage?
    @ObservedObject var classifier: ImageClassifier
    
    var body: some View {
        VStack{
            HStack {
                
                Text("Kirin")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(Color("Color1"))
                Spacer()
                    .padding()
            }
            
        
            
            HStack{
        
                Image(systemName: "photo")
                    .onTapGesture {
                        isPresenting = true
                        sourceType = .photoLibrary
                    
                    }
                Spacer()
                

                Image(systemName: "camera")
                    .onTapGesture {
                        isPresenting = true
                        sourceType = .camera

                            }
                

                    }
                    .font(.title)
                    .foregroundColor(Color("Color1"))
            
                    
                    Rectangle()
                        .strokeBorder()
                        .opacity(0)
                        .ignoresSafeArea()

                        .overlay(
                            Group {
                                if uiImage != nil {
                                    Image(uiImage: uiImage!)
                                        .resizable()
                                        .scaledToFit()
                                }
                            }
                        )
                
                    
                    
                    VStack{
                        Button(action: {
                            if uiImage != nil {
                                classifier.detect(uiImage: uiImage!)
                            }
                        }) {
                            Image(systemName: "")
                                .foregroundColor(.gray)
                                .font(.title)
                        } .background (
                            LinearGradient(
                                gradient: Gradient(colors: [.gray, .red]),
                                startPoint: .leading,
                                endPoint: .trailing))
                        
                        
                        Group {
                            if let imageClass = classifier.imageClass {
                                HStack{
                                    Text("Image categories:")
                                        .font(.caption)
                                    Text(imageClass)
                                        .bold()
                                }
                            } else {
                                HStack{
                                    Text("Image categories: NA")
                                        .font(.caption)
                                    
                                }
                            }
                            
                        }
                        .font(.subheadline)
                        .padding()
                        .shadow(color: Color.white, radius: 20)
                        .cornerRadius(10)
                        .ignoresSafeArea()
                        .background(
                            RoundedRectangle(cornerRadius: 20,style: .circular) .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [.green, .green]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                
  

                        
                            
                            )
                        )
                    )
                        .padding()
                        
                        
                    }
            HStack {
                if !tapped {
                    Spacer()
                    Image(systemName: "asterisk.circle")
                        .padding()
                        .foregroundColor(Color("Color1"))

                
                } else {
                    VStack(alignment: .leading) {
                        Text( "Why should we care?")
                            .font(.title.weight (.bold))
                            .padding()
                        Text("By Recycling we can convert materials into new goods, minimising the need to use natural resources and helping to maintain natural environments for the future. Using recycled materials in the production process requires significantly less energy than generating new items from raw materials. Recycling minimises the need for raw material extraction, refining, and processing, all of which contribute to air and water pollution. Recycling saves energy while also lowering greenhouse gas emissions, which aids in the fight against climate change. When we recycle, recyclable materials are reprocessed into new goods, reducing the quantity of garbage sent to landfills and thereby lowering methane emissions, a potent greenhouse gas.")
                            .font (.caption.weight( .regular))
                            .padding()
                            .frame(height: 280)
                    }
                    .frame(width: 350, alignment: .leading)
                    .background (
                        LinearGradient(
                            gradient: Gradient(colors: [.blue, .green]),
                            startPoint: .leading,
                            endPoint: .trailing))
                    .cornerRadius(20)
                    .shadow(color: Color(.secondaryLabel),
                            radius: 12,
                            x: 0,
                            y: 5
                    )
            }
            
        }
        .onTapGesture{
            withAnimation{
                tapped.toggle()

            }
        }
    }
        .padding()
        .background (
            LinearGradient(
                gradient: Gradient(colors: [.purple, .teal]),
                startPoint: .leading,
                endPoint: .trailing))

                
                .sheet(isPresented: $isPresenting){
                    ImagePicker(uiImage: $uiImage, isPresenting:  $isPresenting, sourceType: $sourceType)
                        .onDisappear{
                            if uiImage != nil {
                                classifier.detect(uiImage: uiImage!)
                            }
                        }
                    
                }
                .padding()
                .background (
                    LinearGradient(
                        gradient: Gradient(colors: [.purple, .teal]),
                        startPoint: .leading,
                        endPoint: .trailing))
    
    }
        
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(classifier: ImageClassifier())
            .preferredColorScheme(.light)
            .previewInterfaceOrientation(.portrait)
            .environmentObject(ViewModel())
        
            
        
    }
}





