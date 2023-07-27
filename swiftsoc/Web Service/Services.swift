//
//  Services.swift
//  swiftsoc
//
//  Created by una ivan on 27/07/23.
//

import Foundation

class PostsViewModel: ObservableObject {
    @Published var posts: [Post] = []

    func fetchPosts() {
        guard let url = URL(string: "https://raw.githubusercontent.com/unaivan22/openJson/main/swiftsoc.json") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let postsData = try decoder.decode([Post].self, from: data)
                DispatchQueue.main.async {
                    self.posts = postsData
                }
            } catch {
                print("Error decoding data: \(error)")
            }
        }.resume()
    }
}

