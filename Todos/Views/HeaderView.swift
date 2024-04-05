//
//  HeaderView.swift
//  Todos
//
//  Created by Akhil Gautam on 01/04/24.
//

import SwiftUI

struct HeaderView: View {
    let title : String
    let subtitle: String
    let angle: Double
    let bgColor:Color
    var body: some View {
       
        
            ZStack{
                RoundedRectangle(cornerRadius: 0)
                    .foregroundColor(bgColor)
                    .rotationEffect(Angle(degrees: angle))
                VStack{
                    Text(title)
                        .font(.system(size: 50))
                        .foregroundColor(Color.white)
                        .bold()
                    Text(subtitle)
                        .font(.system(size: 30))
                        .foregroundColor(Color.white)

                }
                .padding(.top, 80)
            }
            .frame(width:UIScreen.main.bounds.width * 3, height: 350)
        
            .offset(y:-150)
    }
}

#Preview {
    HeaderView( title: "Title", subtitle: "subtitle", angle: 15, bgColor: .blue)
}
