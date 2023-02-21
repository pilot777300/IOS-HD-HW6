//
//  FeedModel.swift
//  NavigTest
//
//  Created by Mac on 08.11.2022.
//

import Foundation

class FeedModel {
    var secretWord: String = "Word"
    
    func check(word: String) -> Bool {
         word == secretWord
    }
}
