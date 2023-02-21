//
//  ProfileViewModel.swift
//  NavigTest
//
//  Created by Mac on 05.12.2022.
//

import Foundation

public struct PostViewModel {
    
    private let post: Post
    
    public init (post: Post) {
        self.post = post
    }
   
    public var author: String {
        return post.author ?? "NO DATA"
    }
  
    public var description: String {
        return post.description ?? "NO DATA"
    }
    
    public var image: String {
        return post.image ?? "NO DATA"
    }
    
    public var likes: Int {
        return post.lokes ?? 0
    }
    
    public var views: Int {
        return post.views ?? 0
    }
}
