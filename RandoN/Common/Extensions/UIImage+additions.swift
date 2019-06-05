//
//  UIImage+additions.swift
//  myPlace
//
//  Created by Mac on 06/11/2018.
//  Copyright © 2018 Unit. All rights reserved.
//

import UIKit

extension UIImage {
    
    func withSize(_ size:CGSize) -> UIImage? {
        UIGraphicsBeginImageContext(CGSize(width: size.width, height: size.height))
        self.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    public convenience init?(maybeData: Data?) {
        guard let data = maybeData else {
            return nil
        }
        self.init(data: data)
    }
    
}
