//
//  Map.swift
//  swiftsoc
//
//  Created by una ivan on 27/07/23.
//

import SwiftUI
import MapKit

struct Map : View {
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.3361, longitude: -121.8907), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
//                Map(coordinateRegion: $region)
//                    .edgesIgnoringSafeArea(.all)
            }
            .frame(height: geometry.size.height * 0.97)
        }
        
        VStack{
            
            HStack{
                Image("meHD")
                    .resizable()
                    .frame(width: 60.0, height: 60.0)
                    .clipShape(Circle())
                
                VStack(alignment:.leading, spacing: 4){
                    HStack{
                        Text("Unaivan")
                            .font(.system(size: 20))
                        
                        Text("Edit")
                            .font(.system(size: 14))
                            .foregroundColor(Color.pink)
                    }
                    Text("unaivan@gmail.com")
                        .font(.system(size: 14))
                        .foregroundColor(Color.black)
                    Text("210 Phelan Ave, San Jose, CA 95112, USA")
                        .font(.system(size: 12))
                }
            }
        }
        
    }
}

