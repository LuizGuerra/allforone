//
//  HomeView.swift
//  All For One
//
//  Created by Luiz Pedro Franciscatto Guerra on 16/10/20.
//

import SwiftUI

enum SheetView {
    case addEcommerce, orderReports, none
}

struct HomeView: View {
    
    @ObservedObject var viewModel = HomeViewModel()
    @State private var sheetState = SheetView.none
    @State private var sheetIsDisplayed = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.ecommerceList, id: \.id) { ecommerce in
                        NavigationLink(destination: OrdersView(viewModel: OrdersViewModel(orders: ecommerce.orders))) {
                            EcommerceCard(ecommerce: ecommerce)
                        }
                    }.onDelete{ (indexSet) in
                        viewModel.deleteEcommerce(at: indexSet)
                    }
                }
                .navigationTitle("All For One")
                .navigationViewStyle(StackNavigationViewStyle())
                .navigationBarItems(
                    leading: Button(action: {
                        sheetState = .addEcommerce
                        sheetIsDisplayed = true
                    }, label: {
                        Image(systemName: "plus")
                            .accentColor(.black)
                    }),
                    trailing: Button(action: {
                        sheetState = .orderReports
                        sheetIsDisplayed = true
                    }, label: {
                        Image("report")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20, alignment: .center)
                            .padding(8)
                    })
                )
                .alert(isPresented: $viewModel.isErrorShown, content: { () -> Alert in
                    Alert(title: Text("Error"), message: Text(viewModel.errorMessage))
                })
                .onAppear {
                    self.viewModel.fetchEcommerces()
                }
            }
        }.sheet(isPresented: $sheetIsDisplayed) {
            switch sheetState {
                case .addEcommerce:
                    AddEcommerce(sheetIsPresented: $sheetIsDisplayed, viewModel: self.viewModel)
                case .orderReports:
                    SelectReport(viewModel: self.viewModel)
                case .none:
                    Text("vamo")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
