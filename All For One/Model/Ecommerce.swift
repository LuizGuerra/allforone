//
//  Ecommerce.swift
//  All For One
//
//  Created by Vitor Demenighi on 19/10/20.
//

import Foundation

struct Ecommerce: Codable {
    
    let id: Int
    let name: String
    let imageURL: String
    let orders: [Order]
}

struct EcommerceList: Codable {
    
    let list: [Ecommerce]
}
