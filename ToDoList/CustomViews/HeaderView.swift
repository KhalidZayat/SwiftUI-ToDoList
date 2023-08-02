//
//  HeaderView.swift
//  ToDoList
//
//  Created by Khalid Mahmoud on 30/07/2023.
//

import SwiftUI

struct HeaderView: View {
    
    let title: String
    let subTitle: String
    let angle: Double
    let backgroungColor: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(backgroungColor)
                .rotationEffect(Angle(degrees: angle))
            
            VStack{
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .bold()
                
                Text(subTitle)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
            }
            .padding(.top, 80)
        }
        .frame(width: UIScreen.main.bounds.width * 3,
               height: 350)
        .offset(y: -150)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title",
                   subTitle: "Subtitle",
                   angle: 15,
                   backgroungColor: .pink)
    }
}
