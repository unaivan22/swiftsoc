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
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HorizontalStory()
                }
                //                .padding(.horizontal)
                
                // Vertical scrolling list (List B)
                VStack(alignment: .leading, spacing: 5) {
                    VerticalFeed()
                    Divider()
                }
                .padding()
                
                
            }
            .padding(.top, 10) // Add padding to separate content from the top edge
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
                    AsyncImage(url: URL(string: "http://127.0.0.1:3000/media/swiftsoc/stories/stories1.jpg"))
                    { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .brightness(-0.5)
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
                    AsyncImage(url: URL(string: "http://127.0.0.1:3000/media/swiftsoc/stories/stories2.jpg"))
                    { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .brightness(-0.5)
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
                    AsyncImage(url: URL(string: "http://127.0.0.1:3000/media/swiftsoc/stories/stories3.jpg"))
                    { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .brightness(-0.5)
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
                    AsyncImage(url: URL(string: "http://127.0.0.1:3000/media/swiftsoc/stories/stories4.jpg"))
                    { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .brightness(-0.5)
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
                    AsyncImage(url: URL(string: "http://127.0.0.1:3000/media/swiftsoc/stories/stories5.jpg"))
                    { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .brightness(-0.5)
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
    @State private var isShowingBottomSheetComment = false
    @State private var isShowingBottomSheetShare = false
    @State private var selectedImageURL: URL?
    
    @State private var isShowingGallery = false
    
    @StateObject private var viewModel = PostViewModel()
    
    let baseURL = "http://127.0.0.1:3000/"
    
    
    var body: some View {
        VStack{
            ForEach(viewModel.posts, id: \.id) { post in
                VStack(alignment: .leading){
                    if post.posttype == 1 {
                        HomeRowGallery(post: post)
                    } else if post.posttype == 2 {
                        HomeRowMap(post: post)
                    } else if post.posttype == 3 {
                        HomeRowText(post: post)
                    }
                }.listRowSeparator(.hidden)
                    .frame(maxWidth: .infinity)
                    .background(Color(.systemGray6))
                    .cornerRadius(24)
            }
            .listStyle(.plain)
            .padding(.bottom, 24)
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


struct HomeRowGallery: View {
    @State private var isShowingBottomSheetComment = false
    @State private var isShowingBottomSheetShare = false
    @StateObject private var viewModel = PostViewModel()
    
    let baseURL = "http://127.0.0.1:3000/"
    
    let post: Post
    
    var body: some View {
        HStack(alignment: .center){
            Image(post.avatar)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
            
            VStack(alignment: .leading){
                Text(post.peoplename)
                    .font(.system(size: 18))
                
                Text("Added \(post.postimage.count) photos")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
            Spacer()
            Text(post.posttime)
                .font(.system(size: 16))
                .foregroundColor(.gray)
                .padding(.trailing, 8)
        }
        .padding(.top, 12)
        .padding(.leading, 12)
        .padding(.trailing, 12)
        
        HStack(alignment: .center){
            Text(post.postcaption)
                .font(.system(size: 16))
        }
        .padding(.top, 2)
        .padding(.bottom, 24)
        .padding(.leading, 12)
        .padding(.trailing, 12)
        
        
        VStack{
            //                            Button("") {
            //                                isShowingGallery = true
            //                            }
            //                            .sheet(isPresented: $isShowingGallery) {
            //                                BottomSheetGallery(isPresented: $isShowingGallery, post: post)
            //                            }
            ForEach(post.postimage.prefix(3), id: \.self) { imageUrl in
                if let imageURL = URL(string: baseURL + imageUrl) {
                    AsyncImage(url: imageURL) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        Color.gray.opacity(0.1)
                    }
                    .frame(maxWidth: 150, maxHeight: 200)
                    .cornerRadius(16)
                    .rotationEffect(Angle(degrees: imageUrl == post.postimage[0] ? -8 : (imageUrl == post.postimage[1] ? 10 : 2)))
                    .padding(.leading, imageUrl == post.postimage[0] ? -160 : (imageUrl == post.postimage[1] ? 24 : 0))
                    .padding(.trailing, imageUrl == post.postimage[2] ? 0 : -120)
                    .padding(.top, imageUrl == post.postimage[1] ? -200 : (imageUrl == post.postimage[2] ? -100 : 0))
                    //                                    .onTapGesture {
                    //                                        // Show BottomSheetGallery for this image
                    //                                        isShowingGallery = true
                    //                                    }
                }
            }
            .buttonStyle(BorderlessButtonStyle())
            
            
            HStack(alignment: .lastTextBaseline){
                Text("+ \(post.postimage.count - 3)")
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
                    .background(Color.white)
                    .foregroundColor(Color.gray)
                    .cornerRadius(18.0)
                    .font(.system(size: 18))
            }
            .padding(.top, -52)
            .padding(.trailing, -2)
            .frame(maxWidth: .infinity, alignment: .trailing)
            
            
        }
        .padding(.leading, 32)
        .padding(.trailing, 32)
        .padding(.bottom, 24)
        .padding(.top, 12)
        
        
        HStack{
            HStack(alignment: .top, spacing: 20){
                VStack{
                    Image(systemName: "heart.fill")
                        .font(.system(size: 26))
                        .foregroundColor(.pink)
                    
                    HStack(alignment: .lastTextBaseline){
                        Text("2K")
                            .padding(.top, 4)
                            .padding(.bottom, 4)
                            .padding(.leading, 8)
                            .padding(.trailing, 8)
                            .background(Color.red)
                            .foregroundColor(Color.white)
                            .cornerRadius(18.0)
                            .font(.system(size: 14))
                    }
                    .padding(.top, -52)
                    .padding(.trailing, -34)
                    //                                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                Button(action: {
                    isShowingBottomSheetComment = true
                    isShowingBottomSheetShare = false
                }) {
                    VStack {
                        Image(systemName: "bubble.left.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.gray)
                        
                        HStack(alignment: .lastTextBaseline) {
                            Text("64")
                                .padding(.top, 4)
                                .padding(.bottom, 4)
                                .padding(.leading, 8)
                                .padding(.trailing, 8)
                                .background(Color.red)
                                .foregroundColor(Color.white)
                                .cornerRadius(18.0)
                                .font(.system(size: 14))
                        }
                        .padding(.top, -52)
                        .padding(.trailing, -34)
                    }
                }.buttonStyle(BorderlessButtonStyle())
                    .sheet(isPresented: $isShowingBottomSheetComment, content: {
                        BottomSheetComment(isPresented: $isShowingBottomSheetComment)
                    })
                
                Button(action: {
                    isShowingBottomSheetShare = true
                    isShowingBottomSheetComment = false
                }) {
                    VStack {
                        Image(systemName: "arrowshape.turn.up.forward.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.gray)
                    }
                }.buttonStyle(BorderlessButtonStyle())
                    .sheet(isPresented: $isShowingBottomSheetShare, content: {
                        BottomSheetShare(isPresented: $isShowingBottomSheetShare)
                    })
                
                
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
        .padding(.top, 4)
        .padding(.bottom, 12)
        .padding(.leading, 12)
        .padding(.trailing, 12)
    }
}

struct HomeRowMap: View {
    @State private var isShowingBottomSheetComment = false
    @State private var isShowingBottomSheetShare = false
    @StateObject private var viewModel = PostViewModel()
    let post: Post
    
    
    @State private var locationText = "Loading location..."
    @State private var coordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    var body: some View {
        HStack(alignment: .center){
            Image(post.avatar)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
            
            VStack(alignment: .leading){
                Text(post.peoplename)
                    .font(.system(size: 18))
                
                Text("On \(locationText)")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .onAppear {
                        fetchLocationName()
                        updateCoordinateRegion()
                    }
            }
            Spacer()
            Text(post.posttime)
                .font(.system(size: 16))
                .foregroundColor(.gray)
                .padding(.trailing, 8)
        }
        .padding(.top, 12)
        .padding(.leading, 12)
        .padding(.trailing, 12)
        
        HStack(alignment: .center){
            Text(post.postcaption)
                .font(.system(size: 16))
                .foregroundColor(.black)
        }
        .padding(.top, 2)
        .padding(.bottom, 2)
        .padding(.leading, 12)
        .padding(.trailing, 12)
        
        HStack{
            Map(coordinateRegion: $coordinateRegion, showsUserLocation: false, userTrackingMode: .none, annotationItems: [post]) { item in
                MapPin(coordinate: CLLocationCoordinate2D(latitude: item.latitude, longitude: item.longitude), tint: .red)
            }
            .frame(height: 200)
            .cornerRadius(16)
            .padding()
            .disabled(true)
        }
        .padding(.bottom, 24)
        
        HStack{
            HStack(alignment: .top, spacing: 20){
                VStack{
                    Image(systemName: "heart.fill")
                        .font(.system(size: 26))
                        .foregroundColor(.pink)
                    
                    HStack(alignment: .lastTextBaseline){
                        Text("332")
                            .padding(.top, 4)
                            .padding(.bottom, 4)
                            .padding(.leading, 8)
                            .padding(.trailing, 8)
                            .background(Color.red)
                            .foregroundColor(Color.white)
                            .cornerRadius(18.0)
                            .font(.system(size: 14))
                    }
                    .padding(.top, -52)
                    .padding(.trailing, -34)
                    //                                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                Button(action: {
                    isShowingBottomSheetComment = true
                    isShowingBottomSheetShare = false
                }) {
                    VStack {
                        Image(systemName: "bubble.left.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.gray)
                        
                        HStack(alignment: .lastTextBaseline) {
                            Text("127")
                                .padding(.top, 4)
                                .padding(.bottom, 4)
                                .padding(.leading, 8)
                                .padding(.trailing, 8)
                                .background(Color.red)
                                .foregroundColor(Color.white)
                                .cornerRadius(18.0)
                                .font(.system(size: 14))
                        }
                        .padding(.top, -52)
                        .padding(.trailing, -34)
                    }
                }.buttonStyle(BorderlessButtonStyle())
                    .sheet(isPresented: $isShowingBottomSheetComment, content: {
                        BottomSheetComment(isPresented: $isShowingBottomSheetComment)
                    })
                
                Button(action: {
                    isShowingBottomSheetShare = true
                    isShowingBottomSheetComment = false
                }) {
                    VStack {
                        Image(systemName: "arrowshape.turn.up.forward.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.gray)
                    }
                }.buttonStyle(BorderlessButtonStyle())
                    .sheet(isPresented: $isShowingBottomSheetShare, content: {
                        BottomSheetShare(isPresented: $isShowingBottomSheetShare)
                    })
                
                
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
        .padding(.top, 4)
        .padding(.bottom, 12)
        .padding(.leading, 12)
        .padding(.trailing, 12)
    }
    private func fetchLocationName() {
        let location = CLLocation(latitude: post.latitude, longitude: post.longitude)
        let geocoder = CLGeocoder()
        
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            if let placemark = placemarks?.first {
                let address = "\(placemark.locality ?? ""), \(placemark.country ?? "")"
                self.locationText = address
            } else {
                self.locationText = "Unknown Location"
            }
        }
    }
    
    private func updateCoordinateRegion() {
        coordinateRegion = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: post.latitude, longitude: post.longitude),
            span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        )
    }
}

struct HomeRowText: View {
    @State private var isShowingBottomSheetComment = false
    @State private var isShowingBottomSheetShare = false
    @StateObject private var viewModel = PostViewModel()
    let post: Post
    
    var body: some View {
        HStack(alignment: .center){
            Image(post.avatar)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
            
            VStack(alignment: .leading){
                Text(post.peoplename)
                    .font(.system(size: 18))
                
                //                Text("Post \(post.postimage.count) photos")
                //                    .font(.system(size: 14))
                //                    .foregroundColor(.gray)
            }
            Spacer()
            Text(post.posttime)
                .font(.system(size: 16))
                .foregroundColor(.gray)
                .padding(.trailing, 8)
        }
        .padding(.top, 12)
        .padding(.leading, 12)
        .padding(.trailing, 12)
        
        HStack(alignment: .center){
            Text(post.postcaption)
                .font(.system(size: 16))
        }
        .padding(.top, 2)
        .padding(.bottom, 32)
        .padding(.leading, 12)
        .padding(.trailing, 12)
        
        HStack{
            HStack(alignment: .top, spacing: 20){
                VStack{
                    Image(systemName: "heart.fill")
                        .font(.system(size: 26))
                        .foregroundColor(.pink)
                    
                    HStack(alignment: .lastTextBaseline){
                        Text("2K")
                            .padding(.top, 4)
                            .padding(.bottom, 4)
                            .padding(.leading, 8)
                            .padding(.trailing, 8)
                            .background(Color.red)
                            .foregroundColor(Color.white)
                            .cornerRadius(18.0)
                            .font(.system(size: 14))
                    }
                    .padding(.top, -52)
                    .padding(.trailing, -34)
                    //                                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                Button(action: {
                    isShowingBottomSheetComment = true
                    isShowingBottomSheetShare = false
                }) {
                    VStack {
                        Image(systemName: "bubble.left.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.gray)
                        
                        HStack(alignment: .lastTextBaseline) {
                            Text("64")
                                .padding(.top, 4)
                                .padding(.bottom, 4)
                                .padding(.leading, 8)
                                .padding(.trailing, 8)
                                .background(Color.red)
                                .foregroundColor(Color.white)
                                .cornerRadius(18.0)
                                .font(.system(size: 14))
                        }
                        .padding(.top, -52)
                        .padding(.trailing, -34)
                    }
                }.buttonStyle(BorderlessButtonStyle())
                    .sheet(isPresented: $isShowingBottomSheetComment, content: {
                        BottomSheetComment(isPresented: $isShowingBottomSheetComment)
                    })
                
                Button(action: {
                    isShowingBottomSheetShare = true
                    isShowingBottomSheetComment = false
                }) {
                    VStack {
                        Image(systemName: "arrowshape.turn.up.forward.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.gray)
                    }
                }.buttonStyle(BorderlessButtonStyle())
                    .sheet(isPresented: $isShowingBottomSheetShare, content: {
                        BottomSheetShare(isPresented: $isShowingBottomSheetShare)
                    })
                
                
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
        .padding(.top, 4)
        .padding(.bottom, 12)
        .padding(.leading, 12)
        .padding(.trailing, 12)
    }
}
