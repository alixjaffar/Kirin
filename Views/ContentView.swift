//
//  ContentView.swift
//  Kirin
//
//  Created by Ali Jaffar on 2022-05-26.
//

import SwiftUI
import UIKit

struct ContentView: View {

    
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
                }
                
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




