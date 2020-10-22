//
//  OrdersViewModel.swift
//  All For One
//
//  Created by Vitor Demenighi on 21/10/20.
//

import Foundation

class OrdersViewModel: ObservableObject {
    
    @Published var orders: [Order] = []
    
    init(orders: [Order]) {
        self.orders = orders
    }
    
    init() {}

}
