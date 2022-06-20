//
//  ViewModel.swift
//  Kirin
//
//  Created by Ali Jaffar on 2022-06-18.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var image: UIImage?
    @Published var showPicker = false
    
}
