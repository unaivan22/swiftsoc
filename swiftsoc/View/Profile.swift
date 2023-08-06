//
//  Profile.swift
//  swiftsoc
//
//  Created by una ivan on 27/07/23.
//

import SwiftUI

struct Profile: View {
    @State private var isShowingBottomSheetShare = false
    
    var body: some View {
        NavigationView{
            MainProfile()
                .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    VStack{
                        Text("Edit")
                            .font(.system(size: 16))
                            .foregroundColor(.blue)
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    VStack{
                        Text("Unaivan")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                        
//                        Text("Sukolilo, Madiun, East Java")
//                            .font(.system(size: 12))
//                            .foregroundColor(.gray)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 8){
                        Button(action: {
                            isShowingBottomSheetShare = true
                        }) {
                            Image(systemName: "square.and.arrow.up")
                                .foregroundColor(.blue)
                                .font(.system(size: 18))
                        }.buttonStyle(BorderlessButtonStyle())
                            .sheet(isPresented: $isShowingBottomSheetShare, content: {
                                BottomSheetShare(isPresented: $isShowingBottomSheetShare)
                            })
                        
                        Image(systemName: "gear")
                            .foregroundColor(.blue)
                            .font(.system(size: 18))
                    }
                }
            }
        }
        
    }
}

struct MainProfile : View {
    @State private var showSheet = false
    
    var body : some View {
        VStack(spacing: 32){
            HStack(alignment: .center, spacing: 32){
                VStack{
                    Text("367")
                        .font(.system(size: 24))
                        .foregroundColor(.black)
                    Text("Following")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                
                VStack{
                    AsyncImage(url: URL(string: "http://127.0.0.1:3000/media/swiftsoc/unabw.jpeg"))
                    { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                    } placeholder: {
                        Color.gray.opacity(0.1)
                    }
                    .frame(maxWidth: 100, maxHeight: 100)
                    .cornerRadius(312)
                    .overlay(RoundedRectangle(cornerRadius: 312)
                                .stroke(Color.blue, lineWidth: 4))
                }
                
                VStack{
                    Text("667")
                        .font(.system(size: 24))
                        .foregroundColor(.black)
                    Text("Follower")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
            }
            
            VStack(alignment: .leading, spacing: 8){
                Text("a prototyper")
                    .font(.system(size: 18))
                    .foregroundColor(.black)
                    .fontWeight(.medium)
                
                Text("🖥️ Tech Stack: Javascript, SwiftUI, ReactJS. \nLooking fulltime remote job \n. \n. \nlifetime loving halimah")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .fontWeight(.regular)
//                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(width: UIScreen.main.bounds.width - 40)
            
            Divider()
            
            Group{
                VStack(spacing: 4){
                    Image(systemName: "photo.on.rectangle.angled")
                        .foregroundColor(.gray)
                        .font(.system(size: 78))

                    Group{
                        Text("No post yet")
                            .font(.system(size: 24))
                            .foregroundColor(.gray)
                            .fontWeight(.medium)

                        Text("Capture your moment with all friends")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                            .fontWeight(.regular)
                        Text("Create your first post")
                            .font(.system(size: 14))
                            .foregroundColor(.black)
                            .fontWeight(.medium)
                    }
                }
            }
            .padding(.top, 18)
            .padding(.bottom, 128)
        }
    }
}
