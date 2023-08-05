//
//  Model.swift
//  swiftsoc
//
//  Created by una ivan on 27/07/23.
//

import Foundation

struct Post: Codable, Identifiable {
    let id: Int
    let peoplename: String
    let avatar: String
    let avatarlikes: [String]
    let otherlikes: Int
    let postcaption: String
    let posttype: Int
    let posttime: String
    let postimage: [String]

    var postimageUrls: [URL] {
        postimage.compactMap { URL(string: $0) }
    }
}
