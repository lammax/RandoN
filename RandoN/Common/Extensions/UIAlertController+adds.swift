//
//  UIAlertController+adds.swift
//  myPlace
//
//  Created by Mac on 06/12/2018.
//  Copyright © 2018 Unit. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    func addImage(imageO: UIImage?) {
        
        if let image = imageO {
            
            let maxSize : CGSize = CGSize(width: 240, height: 300)
            let imageSize = image.size
            
            var ratio: CGFloat!
            if (imageSize.width > imageSize.height) {
                ratio = maxSize.width / imageSize.width
            } else {
                ratio = maxSize.height / imageSize.height
            }
            
            let scaledSize = CGSize(width: imageSize.width * ratio, height: imageSize.height * ratio)
            var scaledImage = image.withSize(scaledSize)!
            
            if imageSize.height > imageSize.width {
                let left = (maxSize.width - scaledImage.size.width) / 2
                scaledImage = scaledImage.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: -left, bottom: 0, right: 0))
            }
            
            let imageAction = UIAlertAction(title: "", style: .default, handler: nil)
            imageAction.isEnabled = false
            
            imageAction.setValue(scaledImage.withRenderingMode(.alwaysOriginal), forKey: "image")
            self.addAction(imageAction)
        }
        
    }
    
}
