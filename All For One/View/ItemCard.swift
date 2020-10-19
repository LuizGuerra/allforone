//
//  ItemCard.swift
//  All For One
//
//  Created by Luiz Pedro Franciscatto Guerra on 17/10/20.
//

import SwiftUI

struct OrderExample {
    var id = UUID()
    
    var name: String
    var status: OrderStatus
    var quantity: Int
    var fromStore: String
    
    var productImageName: String
    var storeImageName: String
}

enum OrderStatus: String {
    case waitingPayment = "Waiting payment"
    case canceled = "Canceled"
    case waitingForShipment = "Waiting for shipment"
    case shipped = "Shipped"
    case packageLoss = "Package Loss"
    case delivered = "Delivered"
}

struct ItemCard: View {
    let order: OrderExample
    var body: some View {
        let width = UIScreen.main.bounds.width*0.25
        return HStack(alignment: .top) {
            Image(order.productImageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: width, alignment: .center)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text(order.name)
                    .font(.title)
                    .padding(.bottom, 8)
                Text("Quantity: \(order.quantity)")
                Text("Status: \(order.status.rawValue)")
            }
            Spacer()
            Image(order.storeImageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width*0.5, height: width*0.5, alignment: .center)
                .rotationEffect(.degrees(30))
                .padding()
        }.padding(4)
        .background(Color.white)
    }
}

struct ItemCard_Previews: PreviewProvider {
    static var previews: some View {
        ItemCard(order: OrderExample(name: "Gray Shirt", status: .shipped, quantity: 2, fromStore: "Amazon", productImageName: "shirt", storeImageName: "amazon"))
    }
}
