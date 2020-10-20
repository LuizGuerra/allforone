//
//  AddEcommerce.swift
//  All For One
//
//  Created by Luiz Pedro Franciscatto Guerra on 17/10/20.
//

import SwiftUI

struct AddEcommerce: View {
    @Binding var sheetIsPresented: Bool
    @State private var ecommerceName: String = ""
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("E-commerce Name")) {
                    VStack {
                        TextField("e.g. Amazon", text: $ecommerceName)
                    }
                }
                Section {
                    Button(action: {
                        addEcommerce()
                        sheetIsPresented.toggle()
                    }, label: {
                        HStack {
                            Spacer()
                            Text("Add")
                            Spacer()
                        }
                    })
                    Button(action: {
                        sheetIsPresented.toggle()
                    }, label: {
                        HStack {
                            Spacer()
                            Text("Cancel")
                                .accentColor(.red)
                            Spacer()
                        }
                    })
                }
            }.navigationTitle("Add a new E-commerce")
        }
    }
    
    func addEcommerce() {
        viewModel.addEcommerce(name: ecommerceName)
    }
}

struct AddStore_Previews: PreviewProvider {
    @State private static var sheetStatus = true
    static var previews: some View {
        AddEcommerce(sheetIsPresented: $sheetStatus, viewModel: HomeViewModel())
    }
}
