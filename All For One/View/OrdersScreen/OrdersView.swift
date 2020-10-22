//
//  OrdersView.swift
//  All For One
//
//  Created by Vitor Demenighi on 21/10/20.
//

import SwiftUI

struct OrdersView: View {
    @ObservedObject var viewModel: OrdersViewModel
    
    var body: some View {
        return VStack {
            List {
                ForEach(viewModel.orders, id: \.id) { order in
                    OrderItemCard(order: order)
                }
            }.navigationTitle("Orders")
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct HomeView_Previews2: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

//struct OrdersView_Previews: PreviewProvider {
//    static var previews: some View {
//        OrdersView
//    }
//}
