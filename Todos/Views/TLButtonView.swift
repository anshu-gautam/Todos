//
//  TLButton.swift
//  Todos
//
//  Created by Akhil Gautam on 01/04/24.
//

import SwiftUI

struct TLButton: View {
    let title :String
    let bgColor : Color
    let action:()->Void
    
    var body: some View {
        Button{
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(bgColor)
                Text(title)
                    .foregroundStyle(Color .white)
                
                    .bold()
            }
        }
        
    }
}

#Preview {
    TLButton(title: "Vlaue", bgColor: .red) {
        //actions
    }
}
