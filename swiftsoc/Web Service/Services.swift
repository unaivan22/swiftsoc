//
//  Services.swift
//  swiftsoc
//
//  Created by una ivan on 27/07/23.
//

import Foundation

class PostViewModel: ObservableObject {
    @Published var posts: [Post] = []

    init() {
        fetchData()
    }

    func fetchData() {
        guard let url = URL(string: "https://raw.githubusercontent.com/unaivan22/openJson/main/swiftsoc.json") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let decodedData = try decoder.decode([String: [Post]].self, from: data)
                if let posts = decodedData["post"] {
                    DispatchQueue.main.async {
                        self.posts = posts
                    }
                }
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
            }
        }.resume()
    }
}
