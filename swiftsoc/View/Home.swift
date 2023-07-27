//
//  Home.swift
//  swiftsoc
//
//  Created by una ivan on 27/07/23.
//

import SwiftUI
import MapKit
import Combine

struct Home: View {
    
    @State private var selectedTab = 0
    var body: some View {
        ScrollView(.vertical){
            VerticalFeed()
        }
    }
}


struct HorizontalStory: View {
    
    @State private var selectedTab = 0
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10){
                
                VStack(alignment: .center) {
                    Image("meHD")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .padding(.top, 10)
                        .padding(.leading, 5)
                    
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(Color.blue)
                        .padding(.top, -25)
                        .font(.system(size: 28))
                    
                    Text("Start a story")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                }
                .frame(width: 100, height: 140)
                .background(Color(.systemGray6))
                .cornerRadius(16)
                
                ZStack(alignment: .topLeading) {
                    AsyncImage(url: URL(string: "https://images.unsplash.com/photo-1674574124349-0928f4b2bce3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1471&q=80"))
                    { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                    } placeholder: {
                        Color.gray.opacity(0.1)
                    }
                    .frame(maxWidth: 100, maxHeight: 140)
                    .cornerRadius(16)
                    
                    Image("user1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .padding(.top, 10)
                        .padding(.leading, 5)
                }
                
                ZStack(alignment: .topLeading) {
                    AsyncImage(url: URL(string: "https://images.unsplash.com/photo-1690151711465-2bfe4e69f241?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=711&q=80"))
                    { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                    } placeholder: {
                        Color.gray.opacity(0.1)
                    }
                    .frame(maxWidth: 100, maxHeight: 140)
                    .cornerRadius(16)
                    
                    Image("user2")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .padding(.top, 10)
                        .padding(.leading, 5)
                }
                
                ZStack(alignment: .topLeading) {
                    AsyncImage(url: URL(string: "https://images.unsplash.com/photo-1687360441387-0179af118555?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=627&q=80"))
                    { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                    } placeholder: {
                        Color.gray.opacity(0.1)
                    }
                    .frame(maxWidth: 100, maxHeight: 140)
                    .cornerRadius(16)
                    
                    Image("user3")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .padding(.top, 10)
                        .padding(.leading, 5)
                }
                
                ZStack(alignment: .topLeading) {
                    AsyncImage(url: URL(string: "https://plus.unsplash.com/premium_photo-1664879730410-801591701960?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=688&q=80"))
                    { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                    } placeholder: {
                        Color.gray.opacity(0.1)
                    }
                    .frame(maxWidth: 100, maxHeight: 140)
                    .cornerRadius(16)
                    
                    Image("user4")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .padding(.top, 10)
                        .padding(.leading, 5)
                }
                
                ZStack(alignment: .topLeading) {
                    AsyncImage(url: URL(string: "https://images.unsplash.com/photo-1688819092299-9a1c4f59279c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80"))
                    { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                    } placeholder: {
                        Color.gray.opacity(0.1)
                    }
                    .frame(maxWidth: 100, maxHeight: 140)
                    .cornerRadius(16)
                    
                    Image("user5")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .padding(.top, 10)
                        .padding(.leading, 5)
                }
                
            }.padding(.leading, 15)
        }
    }
}


struct VerticalFeed: View {
    
    @StateObject private var viewModel = PostViewModel()
    
    var body: some View {
        VStack{
            HorizontalStory()
            NavigationView {
                List(viewModel.posts, id: \.id) { post in
                    VStack(alignment: .leading){
                        HStack(alignment: .center){
                            Image(post.avatar)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)

                            VStack(alignment: .leading){
                                Text(post.peoplename)
                                    .font(.system(size: 18))

                                Text("Added 3 photos")
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.top, 12)
                        .padding(.leading, 12)
                        .padding(.trailing, 12)

                        HStack(alignment: .center){
                            Text(post.postcaption)
                                .font(.system(size: 16))
                        }
                        .padding(.top, 12)
                        .padding(.leading, 12)
                        .padding(.trailing, 12)
                        
                        Grid() {
                            GridRow {
                                VStack{
                                    if let imageUrl = post.postimageUrls[safe: 0] {
                                        AsyncImage(url: imageUrl) { image in
                                            image
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 300, height: 230)
                                        } placeholder: {
                                            Color.gray.opacity(0.1)
                                        }
                                        .frame(maxWidth: 150, maxHeight: 200)
                                        .cornerRadius(16)
                                    }
                                }.rotationEffect(Angle(degrees: -8))
                                    .padding(.leading, -12)
                                    .padding(.trailing, 12)

                                VStack{
                                    if let imageUrl = post.postimageUrls[safe: 1] {
                                        AsyncImage(url: imageUrl) { image in
                                            image
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 200, height: 250)
                                        } placeholder: {
                                            Color.gray.opacity(0.1)
                                        }
                                        .frame(maxWidth: 130, maxHeight: 140)
                                        .cornerRadius(16)
                                    }
                                }.rotationEffect(Angle(degrees: 10))
                                    .padding(.leading, 24)
                                    .padding(.trailing, -12)
                                    .padding(.top, -24)
                            }

                            HStack(alignment: .center){
                                if let imageUrl = post.postimageUrls[safe: 2] {
                                    AsyncImage(url: imageUrl) { image in
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 150, height: 200)
                                    } placeholder: {
                                        Color.gray.opacity(0.1)
                                    }
                                    .frame(maxWidth: 100, maxHeight: 100)
                                    .cornerRadius(16)
                                }
                            }
                            .rotationEffect(Angle(degrees: 2))
                            .padding(.top, -74)

                        }
                        .padding(.leading, 32)
                        .padding(.trailing, 32)
                        .padding(.bottom, 24)
                        .padding(.top, 12)

                        HStack{
                            HStack{
                                Image(systemName: "heart.fill")
                                    .font(.system(size: 26))
                                    .foregroundColor(.red)
                                Image(systemName: "bubble.left.fill")
                                    .font(.system(size: 24))
                                    .foregroundColor(.gray)
                                Image(systemName: "arrowshape.turn.up.forward.fill")
                                    .font(.system(size: 24))
                                    .foregroundColor(.gray)
                            }

                            Spacer()
                            HStack{
                                HStack(spacing: -16){
                                    if let firstAvatarLike = viewModel.posts.first?.avatarlikes[0] {
                                        Image("\(firstAvatarLike)")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 30, height: 30)
                                    }

                                    if let secondAvatarLike = viewModel.posts.first?.avatarlikes[1] {
                                        Image("\(secondAvatarLike)")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 30, height: 30)
                                    }

                                    if let thirdAvatarLike = viewModel.posts.first?.avatarlikes[2] {
                                        Image("\(thirdAvatarLike)")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 30, height: 30)
                                    }
                                }
                                Text("and \(post.otherlikes) others")
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.bottom, 12)
                        .padding(.leading, 12)
                        .padding(.trailing, 12)
                    }.listRowSeparator(.hidden)
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemGray6))
                        .cornerRadius(32)
                }
            }
            .listStyle(.plain)
            .frame(height: UIScreen.main.bounds.height)
            .onAppear {
                viewModel.fetchData()
            }
        }
        
        
            
        }
    }

extension Array {
    subscript(safe index: Int) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
