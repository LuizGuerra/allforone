//
//  EcommerceCard.swift
//  All For One
//
//  Created by Vitor Demenighi on 20/10/20.
//

import SwiftUI

struct EcommerceCard: View {
    let ecommerce: Ecommerce
    
    var body: some View {
        let width = UIScreen.main.bounds.width*0.25
        return HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(ecommerce.name)
                    .font(.title)
                    .padding(.bottom, 8)
                Text("Pedidos: \(ecommerce.orders.count)")
            }
            Spacer()
            Image(ecommerce.imageURL)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: width*0.5, alignment: .center)
                .padding()
        }.padding(4)
        .background(Color.white)
    }
}

struct EcommerceCard_Previews: PreviewProvider {
    static var previews: some View {
        EcommerceCard(ecommerce: Ecommerce(id: 0, name: "Amazon", imageURL: "shirt", orders: []))
    }
}

