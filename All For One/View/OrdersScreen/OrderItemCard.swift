//
//  ItemCard.swift
//  All For One
//
//  Created by Luiz Pedro Franciscatto Guerra on 17/10/20.
//

import SwiftUI

enum OrderStatus: String {
    case waitingPayment = "Waiting payment"
    case canceled = "Canceled"
    case waitingForShipment = "Waiting for shipment"
    case shipped = "Shipped"
    case packageLoss = "Package Loss"
    case delivered = "Delivered"
}

struct OrderItemCard: View {
    
    let order: Order
    
    var body: some View {
        
        return HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(order.name)
                    .font(.title)
                    .padding(.bottom, 8)
                Text("Quantity: \(order.amount)")
                Text("Value: \(order.value)")
            }
            Spacer()
        }.padding(4)
        .background(Color.white)
    }
}

struct OrderItemCard_Previews: PreviewProvider {
    static var previews: some View {
        OrderItemCard(order: Order(id: 1, name: "Shirt", value: 100.0, deliveryDate: Date(), completeDeadline: true, status: "delivery", amount: 1))
    }
}
