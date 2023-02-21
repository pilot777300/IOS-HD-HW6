//
//  PostData.swift
//  NavigTest
//
//  Created by Mac on 05.12.2022.
//

import Foundation


public struct Post {
   
    public var author: String?
    public var description: String?
    public var image: String?
    public var lokes: Int?
    public var views: Int?
    
    public init(author: String?, description: String?, image: String?, lokes: Int?, views: Int?) {
        self.author = author
        self.description = description
        self.image = image
        self.lokes = lokes
        self.views = views
    }
    
}


