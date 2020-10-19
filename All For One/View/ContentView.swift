//
//  ContentView.swift
//  All For One
//
//  Created by Luiz Pedro Franciscatto Guerra on 16/10/20.
//

import SwiftUI

struct ContentView: View {
    let array = [
        OrderExample(name: "Gray Shirt", status: .shipped, quantity: 2, fromStore: "Amazon", productImageName: "shirt", storeImageName: "amazon"),
        OrderExample(name: "Gray Shirt", status: .shipped, quantity: 2, fromStore: "Amazon", productImageName: "shirt", storeImageName: "amazon"),
        OrderExample(name: "Gray Shirt", status: .shipped, quantity: 2, fromStore: "Amazon", productImageName: "shirt", storeImageName: "amazon"),
        OrderExample(name: "Gray Shirt", status: .shipped, quantity: 2, fromStore: "Amazon", productImageName: "shirt", storeImageName: "amazon"),
        OrderExample(name: "Gray Shirt", status: .shipped, quantity: 2, fromStore: "Amazon", productImageName: "shirt", storeImageName: "amazon")
    ]
    @State private var addEcommerce = false
    @State private var refreshRotation = false
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(array, id: \.id) { order in
                        ItemCard(order: order)
                            .clipped()
                            .cornerRadius(10)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 4)
                            .shadow(radius: 4)
                    }
                }
                .navigationTitle("All For One")
                .navigationViewStyle(StackNavigationViewStyle())
                .navigationBarItems(
                    leading: Button(action: {
                        addEcommerce.toggle()
                    }, label: {
                        Image(systemName: "plus")
                            .accentColor(.black)
                    }),
                    trailing: Button(action: {
                        withAnimation(.easeOut) {
                            refreshRotation.toggle()
                        }
                    }, label: {
                        Image("update-arrow")
                            .resizable()
                            .frame(width: 20, height: 20, alignment: .center)
                            .accentColor(.black)
                            .rotationEffect(Angle.degrees(refreshRotation ? 360 : .zero))
                            .animation(.easeOut)
                        
                    }))
            }
        }.sheet(isPresented: $addEcommerce, content: {
            AddStore(sheetIsPresented: $addEcommerce)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
