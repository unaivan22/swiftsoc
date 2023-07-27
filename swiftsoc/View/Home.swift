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
            HorizontalStory()
            
            VerticalFeed()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
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
                        .frame(width: 60, height: 60)
                        .padding(.top, 10)
                        .padding(.leading, 5)
                    
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
                
            }
        }
    }
}


struct VerticalFeed: View {
    
    @StateObject private var viewModel = PostsViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.posts, id: \.id) { post in
                VStack(alignment: .leading) {
                    Text(post.peopleName)
                        .font(.headline)
                        .foregroundColor(.black)
                    Text("Avatar likes: \(post.avatarLikes.joined(separator: ", "))")
                    Text("Other likes: \(post.otherLikes)")

                    ForEach(post.postImage, id: \.id) { image in
                        RemoteImage(url: URL(string: image.image))
                            .frame(width: 100, height: 100)
                            .cornerRadius(8)
                    }
                }
            }
//            .navigationBarTitle("Posts")
        }
        .onAppear {
            viewModel.fetchPosts()
        }
    }
}


struct RemoteImage: View {
    @StateObject private var imageLoader = ImageLoader()
    private let url: URL?

    init(url: URL?) {
        self.url = url
    }

    var body: some View {
        if let image = imageLoader.image {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
        } else {
            ProgressView()
                .onAppear {
                    imageLoader.loadImage(from: url)
                }
        }
    }
}

class ImageLoader: ObservableObject {
    @Published var image: UIImage?

    private var cancellable: AnyCancellable?

    func loadImage(from url: URL?) {
        guard let url = url else {
            return
        }

        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }
}



struct VerticalFeed_: View {

    @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 37.3361, longitude: -121.8907), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )

    var body: some View {
        VStack(spacing: 16){
            VStack(alignment: .leading){
                HStack(alignment: .center){
                    Image("user1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                    
                    VStack(alignment: .leading){
                        Text("Lia Marie")
                            .font(.system(size: 18))
                        
                        Text("Added 5 photos")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                    }
                }
                .padding(.top, 12)
                .padding(.leading, 12)
                .padding(.trailing, 12)
                
                Grid() {
                    GridRow {
                        VStack{
                            AsyncImage(url: URL(string: "https://images.unsplash.com/photo-1571385778997-1ae4643264e6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=686&q=80"))
                            { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 300, height: 230)
                            } placeholder: {
                                Color.gray.opacity(0.1)
                            }
                            .frame(maxWidth: 150, maxHeight: 200)
                            .cornerRadius(16)
                            
                        }.rotationEffect(Angle(degrees: -8))
                            .padding(.leading, -12)
                            .padding(.trailing, 12)
                        
                        VStack{
                            AsyncImage(url: URL(string: "https://images.unsplash.com/photo-1609220136736-443140cffec6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80"))
                            { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 250)
                            } placeholder: {
                                Color.gray.opacity(0.1)
                            }
                            .frame(maxWidth: 130, maxHeight: 140)
                            .cornerRadius(16)
                            
                        }.rotationEffect(Angle(degrees: 10))
                            .padding(.leading, 24)
                            .padding(.trailing, -12)
                            .padding(.top, -24)
                    }
                    
                    HStack(alignment: .center){
                        AsyncImage(url: URL(string: "https://plus.unsplash.com/premium_photo-1661281363854-a9599b110b86?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=800"))
                        { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120, height: 200)
                        } placeholder: {
                            Color.gray.opacity(0.1)
                        }
                        .frame(maxWidth: 100, maxHeight: 100)
                        .cornerRadius(16)
                        
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
                            Image("user2")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                            Image("user5")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                            Image("user4")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                        }
                        Text("And 372 others")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                    }
                }
                .padding(.bottom, 12)
                .padding(.leading, 12)
                .padding(.trailing, 12)
            }
            .frame(maxWidth: .infinity)
            .background(Color.yellow)
            .cornerRadius(32)
            
            
            
            VStack(alignment: .leading){
                HStack(alignment: .center){
                    Image("user5")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                    
                    VStack(alignment: .leading){
                        Text("Lia Marie")
                            .font(.system(size: 18))
                        
                        Text("Added 5 photos")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                    }
               }.frame(maxWidth: .infinity)
                .padding(.top, 12)
                .padding(.leading, 12)
                .padding(.trailing, 12)
                
                HStack{
//                        Map(coordinateRegion: $region)
//                                            .edgesIgnoringSafeArea(.all)
                }
                .frame(height: 150)
                .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 0))
                .cornerRadius(12)
                
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
                            Image("user2")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                            Image("user5")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                            Image("user4")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                        }
                        Text("And 372 others")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                    }
                }
                .padding(.bottom, 12)
                .padding(.leading, 12)
                .padding(.trailing, 12)
                
            }
            .frame(maxWidth: .infinity)
            .background(Color.yellow)
            .cornerRadius(32)
      
            
        }
        .padding(.leading, 20)
        .padding(.trailing, 20)
        .padding(.top, 12)
        .padding(.bottom, 12)
    }
}

