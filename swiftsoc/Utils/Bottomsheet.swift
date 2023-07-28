//
//  Bottomsheet.swift
//  swiftsoc
//
//  Created by una ivan on 28/07/23.
//

import SwiftUI

struct BottomSheetComment: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            Text("Comments")
                .font(.system(size: 16))
                .foregroundColor(Color.black)
                .padding(.top, 32)
                .padding(.bottom, 3)
            
            ScrollView(.vertical, showsIndicators: false){
                HStack(alignment: .top){
                    Image("user2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)

                    VStack(alignment: .leading, spacing: 4){
                        Text("Sarah Maen")
                            .font(.system(size: 16))

                        Text("Love is in the air on the tennis court! ")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding(.bottom, 16)
                
                HStack(alignment: .top){
                    Image("user3")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)

                    VStack(alignment: .leading, spacing: 4){
                        Text("Nina Smith")
                            .font(.system(size: 16))

                        Text("Nothing beats a sunny day and a thrilling game of tennis! Who's ready to hit the court and show off their skills?")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding(.bottom, 16)
                
                HStack(alignment: .top){
                    Image("user4")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)

                    VStack(alignment: .leading, spacing: 4){
                        Text("William Saq")
                            .font(.system(size: 16))

                        Text("Game, set, match! 🏆 Another fantastic day of tennis in the books. Congratulations to all the players for their dedication and passion on the court!")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding(.bottom, 16)
                
                HStack(alignment: .top){
                    Image("user5")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)

                    VStack(alignment: .leading, spacing: 4){
                        Text("Nensi Kiu")
                            .font(.system(size: 16))

                        Text("🎾🤩 Can we take a moment to appreciate the incredible athleticism and precision in tennis? These players are simply amazing! #TennisStars #IncredibleAthletes")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding(.bottom, 16)
            }
            .padding()
            Spacer()
        }
        .background(Color.white)
        .presentationDetents([.medium, .large])
    }
}



struct BottomSheetShare: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            Text("Share")
                .font(.system(size: 16))
                .foregroundColor(Color.black)
                .padding(.top, 32)
                .padding(.bottom, 3)
            
            ScrollView(.vertical, showsIndicators: false){
                HStack(alignment: .center){
                    Image("whatsapp")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)

                    Text("Whatsapp")
                        .font(.system(size: 16))
                    
                    Spacer()
                }
                .padding(.bottom, 12)
                
                HStack(alignment: .center){
                    Image("telegram")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)

                    Text("Telegram")
                        .font(.system(size: 16))
                    
                    Spacer()
                }
                .padding(.bottom, 12)
                
                HStack(alignment: .center){
                    Image("twitter")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)

                    Text("Twitter")
                        .font(.system(size: 16))
                    
                    Spacer()
                }
                .padding(.bottom, 12)
                
                HStack(alignment: .center){
                    Image("signal")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)

                    Text("Signal")
                        .font(.system(size: 16))
                    
                    Spacer()
                }
                .padding(.bottom, 12)
                
                HStack(alignment: .center){
                    Image("medium")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)

                    Text("Medium")
                        .font(.system(size: 16))
                    
                    Spacer()
                }
                .padding(.bottom, 12)
                
                HStack(alignment: .center){
                    Image("twitch")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)

                    Text("Twitch")
                        .font(.system(size: 16))
                    
                    Spacer()
                }
                .padding(.bottom, 12)
                
            }
            .padding()
            Spacer()
        }
        .background(Color.white)
        .presentationDetents([.medium, .large])
    }
}



struct BottomSheetGallery: View {
    @Binding var isPresented: Bool
    let post: Post
    
    // Full image URLs based on the baseURL
    var fullImageURLs: [URL] {
        post.postimage.map { URL(string: baseURL + $0)! }
    }
    
    let baseURL = "http://127.0.0.1:3000/"
    
    var body: some View {
        VStack {
            Text("Galleries")
                .font(.system(size: 16))
                .foregroundColor(Color.black)
                .padding(.top, 32)
            
            Text(post.peoplename)
                .font(.system(size: 14))
                .foregroundColor(Color.black)
                .padding(.top, 0)
                .padding(.bottom, 24)
            
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(fullImageURLs, id: \.self) { imageUrl in
                        AsyncImage(url: imageUrl) { phase in
                            switch phase {
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(12)
                                
                            case .failure(_):
                                // Placeholder view in case of image loading failure
                                Color.gray
                            case .empty:
                                // Placeholder view while the image is being loaded
                                Color.gray
                            @unknown default:
                                // Placeholder view for unknown cases
                                Color.gray
                            }
                        }
                    }
                }
                .padding(.horizontal, 10)
            }
        }
        .background(Color.white)
        .presentationDetents([.medium, .large])
    }
}
