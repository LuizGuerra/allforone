//
//  OrdersView.swift
//  All For One
//
//  Created by Vitor Demenighi on 21/10/20.
//

import SwiftUI

struct OrdersView: View {
    
    @ObservedObject var viewModel = OrdersViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.orders, id: \.id) { order in
                    OrderItemCard(order: order)
                        .clipped()
                        .cornerRadius(10)
                        .padding(.vertical, 4)
                        .shadow(radius: 4)
                }
            }.navigationTitle("Orders")
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct OrdersView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersView()
    }
}
