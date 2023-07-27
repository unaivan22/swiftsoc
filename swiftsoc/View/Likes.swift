//
//  Likes.swift
//  swiftsoc
//
//  Created by una ivan on 27/07/23.
//

import SwiftUI

struct Likes: View {
    @StateObject private var viewModel = PostViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.posts) { post in
                VStack(alignment: .leading) {
                    Text(post.peoplename)
                        .font(.headline)
                    Text(post.postcaption)
                        .font(.subheadline)
                    ForEach(post.postimageUrls, id: \.self) { imageUrl in
                        AsyncImage(url: imageUrl)
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 100)
                    }
                }
            }
            .navigationTitle("Posts")
        }
        .onAppear {
            // Fetch data when the view appears (optional)
            viewModel.fetchData()
        }
    }
    
}
