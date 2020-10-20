//
//  HomeView.swift
//  All For One
//
//  Created by Luiz Pedro Franciscatto Guerra on 16/10/20.
//

import SwiftUI

struct HomeView: View {
   
    @State private var addEcommerce = false
    @State private var refreshRotation = false
    
    @ObservedObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.ecommerceList, id: \.id) { ecommerce in
                        EcommerceCard(ecommerce: ecommerce)
                            .clipped()
                            .cornerRadius(10)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 4)
                            .shadow(radius: 4)
                    }.onDelete{ (indexSet) in
                        viewModel.deleteEcommerce(at: indexSet)
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
                    }))
                .alert(isPresented: $viewModel.isErrorShown, content: { () -> Alert in
                    Alert(title: Text("Error"), message: Text(viewModel.errorMessage))
                })
                
                .onAppear {
                        self.viewModel.fetchEcommerces()
                }
            }
        }.sheet(isPresented: $addEcommerce, content: {
            AddEcommerce(sheetIsPresented: $addEcommerce, viewModel: self.viewModel)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
