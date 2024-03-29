//
//  GenerateSceneWorker.swift
//  RandoN
//
//  Created by Mac on 03/06/2019.
//  Copyright (c) 2019 Lammax. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class GenerateSceneWorker {
    
    func calcRandomNumbers(model: GenerateScene.Numbers.Request, isUnique: Bool) -> [Int]? {
        //DONE: make array with values - remove gotten values, and every time get random value from remain array

        if let from = model.maybeFrom, let fromInt = Int(from), let to = model.maybeTo, let toInt = Int(to), let nums = model.maybeNums, let numsInt = Int(nums) {
            var resArr: [Int] = []

            let minVal = min(fromInt, toInt)
            let maxVal = max(fromInt, toInt)
            var availableValues: [Int] = [Int](minVal...maxVal)
            
            while resArr.count < numsInt && availableValues.count > 0 {
                let randomIndex = Int(arc4random_uniform(UInt32(availableValues.count)))
                let nextVal = availableValues[randomIndex]
                if isUnique {
                    if !resArr.contains(nextVal) {
                        resArr.append(nextVal)
                        availableValues.remove(at: randomIndex)
                    }
                } else {
                    resArr.append(nextVal)
                }
            }
            return resArr
        } else {
            return nil
        }
    }
    
}
