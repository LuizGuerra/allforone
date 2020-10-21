//
//  ContentView.swift
//  All For One
//
//  Created by Luiz Pedro Franciscatto Guerra on 16/10/20.
//

import SwiftUI

enum SheetView {
    case addStore, refreshStores, orderReports, none
}

struct ContentView: View {
    let array = [
        OrderExample(name: "Gray Shirt", status: .shipped, quantity: 2, fromStore: "Amazon", productImageName: "shirt", storeImageName: "amazon"),
        OrderExample(name: "Gray Shirt", status: .shipped, quantity: 2, fromStore: "Amazon", productImageName: "shirt", storeImageName: "amazon"),
        OrderExample(name: "Gray Shirt", status: .shipped, quantity: 2, fromStore: "Amazon", productImageName: "shirt", storeImageName: "amazon"),
        OrderExample(name: "Gray Shirt", status: .shipped, quantity: 2, fromStore: "Amazon", productImageName: "shirt", storeImageName: "amazon"),
        OrderExample(name: "Gray Shirt", status: .shipped, quantity: 2, fromStore: "Amazon", productImageName: "shirt", storeImageName: "amazon")
    ]
    let connectedStores = ["aliexpress", "amazon", "nike"]
    
    @State private var sheetIsDisplayed = false
    @State private var sheetState = SheetView.none
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
                .navigationBarItems(
                    leading: Button(action: {
                        sheetState = .addStore
                        sheetIsDisplayed = true
                    }, label: {
                        Image(systemName: "plus")
                            .accentColor(.black)
                    }),
                    trailing:
                        HStack {
                            Button(action: {
                                sheetState = .orderReports
                                sheetIsDisplayed = true
                            }, label: {
                                Image("report")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20, alignment: .center)
                                    .padding(8)
                            })
                            Image("update-arrow")
                                .resizable()
                                .frame(width: 20, height: 20, alignment: .center)
                                .accentColor(.black)
                                .rotationEffect(Angle.degrees(refreshRotation ? 360 : .zero))
                                .animation(.easeOut)
                            .onTapGesture {
                                refreshRotation.toggle()
                            }
                            .onLongPressGesture(minimumDuration: 0.05) {
                                sheetState = .refreshStores
                                sheetIsDisplayed = true
                            }
                        }
                )
            }
        }.sheet(isPresented: $sheetIsDisplayed) {
            switch sheetState {
            case .addStore:
                AddStore(presentedSheet: $sheetIsDisplayed)
            case .refreshStores:
                UpdateStoreData(isSheetUp: $sheetIsDisplayed, connectedStores: connectedStores)
            case .orderReports:
                SelectReport()
            case .none:
                Text("Oops. You shouldn't be here!")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
