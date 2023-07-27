//
//  Model.swift
//  swiftsoc
//
//  Created by una ivan on 27/07/23.
//

import Foundation

struct Post: Codable, Identifiable {
    let id: Int
    let peopleName: String
    let avatar: String
    let avatarLikes: [String]
    let otherLikes: Int
    let postImage: [PostImage]
}

struct PostImage: Codable, Identifiable {
    let id: Int
    let image: String
    let caption: String
}
