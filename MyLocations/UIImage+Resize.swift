//
//  UIImage+Resize.swift
//  MyLocations
//
//  Created by Claudia Dalila Silva Valencia on 18/04/24.
//

import UIKit

extension UIImage {
    func resized(withBounds bounds: CGSize) -> UIImage {
        let horizontalRatio = bounds.width / size.width
        let verticalRatio = bounds.height / size.height
        let ratio = min(horizontalRatio, verticalRatio)
        let newsize = CGSize(
            width: size.width * ratio,
            height: size.height * ratio)
        UIGraphicsBeginImageContextWithOptions(newsize, true, 0)
        draw(in: CGRect(origin: CGPoint.zero, size: newsize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}
