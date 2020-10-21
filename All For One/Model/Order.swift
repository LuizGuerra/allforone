//
//  Order.swift
//  All For One
//
//  Created by Vitor Demenighi on 19/10/20.
//

import Foundation

struct Order: Codable {
    
    let id: Int
    let name: String
    let value: Double
    let deliveryDate: Date
    let completeDeadline: Bool
    let status: String
    let amount: Int
}
