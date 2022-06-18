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
    
    var body: some View {
         ZStack {
            NavigationView {
                    Text("Kirin")
                        .onAppear() {
                            withAnimation(Animation.easeInOut(duration: 0.6)) {
                                    fadeInOut.toggle()
                                }
                            
                        }.opacity(fadeInOut ? 0 : 1)
                        .padding()
                        .font(.largeTitle.weight(.bold))
                        .frame(width: 300, height: 300, alignment: .topLeading)
                        .foregroundColor(Color("Color1"))
                        .background(
                            RoundedRectangle(cornerRadius: 20,style: .circular) .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [.gray, .red]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                            
                            )
                        )
                    )
                NavigationView{
                    Text("Kirin")
                        .font(.largeTitle.weight(.bold))
                        .frame(width: 300, height: 300, alignment: .topLeading)
                    
                }

 }
             
             NavigationView {
                 Text("Kirin")
                     .onAppear() {
                         withAnimation(Animation.easeIn(duration:3)) {
                             fadeInOut.toggle()
                         }
                     }
                     .font(.largeTitle.weight(.bold))
                     .frame(width: 350, height: 500)
                     .foregroundColor(Color("Color1"))
                     .background(
                         RoundedRectangle(cornerRadius: 20,style: .circular) .fill(
                             LinearGradient(
                                 gradient: Gradient(colors: [.gray, .red]),
                                 startPoint: .leading,
                                 endPoint: .trailing
                         
                         )
                     )
                 )
             }
             
             
    }
        
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
            .previewInterfaceOrientation(.portrait)
            
        
    }
}

}


