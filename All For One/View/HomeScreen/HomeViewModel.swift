//
//  HomeViewModel.swift
//  All For One
//
//  Created by Vitor Demenighi on 20/10/20.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var ecommerceList: [Ecommerce] = []
    @Published var isErrorShown = false
    @Published var errorMessage = ""
    
    var saveEcommerces: [Int]
    let USER_DEFAULTS_ECOMMERCES_KEY = "saveEcommerces"
    
    init() {
        saveEcommerces = UserDefaults.standard.array(forKey: USER_DEFAULTS_ECOMMERCES_KEY) as? [Int] ?? []
    }
    
    
    func fetchEcommerces(){
        ecommerceList = ecommercesData.list.filter{ saveEcommerces.contains($0.id) }
    }
    
    func addEcommerce(name: String) {
        var newEcommerce: Ecommerce?
        
        for ecommerce in ecommercesData.list {
            if ecommerce.name == name {
                newEcommerce = ecommerce
            }
        }
        
        guard let currentEcommerce = newEcommerce else {
            errorMessage = "E-commerce não encontrado!"
            isErrorShown = true
            return
        }
        
        for ecommerce in ecommerceList {
            if ecommerce.id == currentEcommerce.id {
                errorMessage = "E-commerce já cadastrado!"
                isErrorShown = true
                return
            }
        }
        
        ecommerceList.append(currentEcommerce)
        saveEcommerces.append(currentEcommerce.id)
        UserDefaults.standard.set(saveEcommerces, forKey: USER_DEFAULTS_ECOMMERCES_KEY)
    }
    
    func deleteEcommerce(at indexSet: IndexSet) {
        ecommerceList.remove(atOffsets: indexSet)
        saveEcommerces = ecommerceList.map { $0.id }
        UserDefaults.standard.set(saveEcommerces, forKey: USER_DEFAULTS_ECOMMERCES_KEY)
    }
    
}

