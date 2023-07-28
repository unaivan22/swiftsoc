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
            
//            HStack{
//                Button(action: {
//                    isPresented = false
//                }) {
//                    Text("Cancel")
//                        .padding()
//                        .background(Color.white)
//                        .foregroundColor(.pink)
//                        .cornerRadius(10)
//                }
//
//                Button {
//                } label: {
//                    Text("Pair")
//                        .frame(maxWidth: 46)
//                        .font(.system(size: 16))
//                        .padding(.bottom, 2)
//                        .padding(.top, 2)
//                        .bold()
//                }
//                .buttonStyle(.borderedProminent)
//            }
            Spacer()
        }
        .background(Color.white)
        .presentationDetents([.medium, .large])
    }
}
