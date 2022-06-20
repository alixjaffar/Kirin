//
//  KirinApp.swift
//  Kirin
//
//  Created by Ali Jaffar on 2022-05-26.
//

import SwiftUI

@main
struct SeeFoodApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(classifier: ImageClassifier())
        }
    }
}
