//
//  ContentView.swift
//  swiftsoc
//
//  Created by una ivan on 27/07/23.
//

import SwiftUI

struct ContentView: View {
       
    @State private var selectedTab = 0
    var body: some View {
        NavigationView{
            TabView(selection: $selectedTab) {
                Home()
                    .tabItem {
                        Image(systemName: "rectangle.split.1x2.fill" )
                    }.tag(0)
                
                MapCurrent()
                    .tabItem {
                        Image(systemName: "map.fill")
                    }.tag(1)
                
                Create()
                    .tabItem {
                        Image(systemName: "plus")
                    }.tag(2)
                
                Likes()
                    .tabItem {
                        Image(systemName: "heart.fill")
                    }.tag(3)
                
                Profile()
                    .tabItem {
                        Image("me")
                            .resizable()
                            .frame(width: 30.0, height: 30.0)
                            .clipShape(Circle())
                    }.tag(4)
            }
            .accentColor(.black)
            .background(Color.white)
        }.background(Color.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct CustomTabItem: View {
    let systemName: String
    let width: CGFloat
    
    var body: some View {
        Image(systemName: systemName)
            .font(.system(size: width))
    }
}

