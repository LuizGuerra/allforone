//
//  ReportSheetView.swift
//  All For One
//
//  Created by Luiz Pedro Franciscatto Guerra on 22/10/20.
//

import SwiftUI

struct ReportSheetView: View {
    let orders: [Order]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Item")
                        .padding(.bottom, 0.5)
                    ForEach(orders, id: \.id) { order in
                        Text(order.name)
                            .fontWeight(.thin)
                    }
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Status")
                        .padding(.bottom, 0.5)
                    ForEach(orders, id: \.id) { order in
                        Text(String(order.status))
                            .fontWeight(.thin)
                    }
                }
                VStack(alignment: .trailing) {
                    Text("Price")
                        .padding(.bottom, 0.5)
                    ForEach(orders, id: \.id) { order in
                        Text(String(format: "%.2f", order.value))
                            .fontWeight(.thin)
                    }
                }
                VStack(alignment: .trailing) {
                    Text("Total")
                        .padding(.bottom, 0.5)
                    ForEach(orders, id: \.id) { order in
                        Text(String(order.amount))
                            .fontWeight(.thin)
                    }
                }
            }.padding()
            .font(Font.custom("Menlo", size: 16.0))
            Button(action: {
                
            }, label: {
                Text("Exit")
                    .padding(8)
                    .accentColor(.red)
            })
        }.navigationTitle("Report")
    }
    
}

struct ReportSheetView_Previews: PreviewProvider {
    @State private static var sheet = true
    static var previews: some View {
        ReportSheetView(orders: [
            Order(id: 0, name: "Camisa", value: 10, deliveryDate: Date(), completeDeadline: true, status: "Delivered", amount: 3),
            Order(id: 1, name: "Carta", value: 10, deliveryDate: Date(), completeDeadline: true, status: "Delivered", amount: 3),
            Order(id: 2, name: "Celular", value: 10, deliveryDate: Date(), completeDeadline: true, status: "Delivered", amount: 3),
            Order(id: 3, name: "Tablet", value: 10, deliveryDate: Date(), completeDeadline: true, status: "Delivered", amount: 3),
            Order(id: 4, name: "Notebook", value: 10, deliveryDate: Date(), completeDeadline: true, status: "Delivered", amount: 3)
        ])
    }
}
