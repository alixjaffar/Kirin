//
//  Classifier .swift
//  Kirin
//
//  Created by Ali Jaffar on 2022-06-18.
//

import CoreML
import Vision
import CoreImage

struct Classifier {
    
    private(set) var results: String?
    
    mutating func detect(ciImage: CIImage) {

        guard let model = try? VNCoreMLModel(for: SavedModel(configuration: MLModelConfiguration()).model)
        else {
            return
        }
    
        
        let request = VNCoreMLRequest(model: model)
        
        let handler = VNImageRequestHandler(ciImage: ciImage, options: [:])
        
        try? handler.perform([request])
        
        guard let results = request.results as? [VNClassificationObservation] else {
            return
        }
        
        if let firstResult = results.first {
            self.results = firstResult.identifier
        }
        
    }
    
}
