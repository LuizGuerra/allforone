//
//  SelectReport.swift
//  All For One
//
//  Created by Luiz Pedro Franciscatto Guerra on 19/10/20.
//

import SwiftUI

struct SelectReport: View {
    @State private var storeSelection = ""
    @State private var dateSelection = Date()
    @State private var statusSelection = "In time"
    @State private var reportSheet = false
    
    @ObservedObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("All orders")) {
                    NavigationLink(destination: ReportSheetView(orders: allOrders()), label: {
                            Text("Generate")
                        }
                    )
                }
                Section(header: Text("Filtered per ecommerce")) {
                    Picker("Select a store", selection: $storeSelection) {
                        List {
                            ForEach(viewModel.ecommerceList, id: \.id) { ecommerce in
                                Text(ecommerce.name)
                            }
                        }
                    }
                    if !storeSelection.isEmpty {
                        NavigationLink(destination: ReportSheetView(orders: ordersFrom(store: storeSelection)), label: {
                                Text("Select")
                            }
                        )
                    }
                }.disabled(viewModel.ecommerceList.count == 0)
                Section(header: Text("Filtered per date")) {
                    DatePicker("Select a date", selection: $dateSelection,
                               in: ...Date(), displayedComponents: .date)
                    NavigationLink(destination: ReportSheetView(orders: filterOrdersByDate()), label: {
                            Text("Generate")
                        }
                    )
                }
                Section(header: Text("Filtered per agility")) {
                    NavigationLink(destination: ReportSheetView(orders: orderByAgility()), label: {
                            Text("Generate")
                        }
                    )
                }
                Section(header: Text("Delivery status")) {
                    Picker("Select a store", selection: $statusSelection) {
                        List(["In time", "Late"], id: \.self) { status in
                            Text(status)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    NavigationLink(destination: ReportSheetView(orders: statusSelection == "In time" ? orderByAgility() : orderByAgility(inTime: false)), label: {
                            Text("Generate")
                        }
                    )
                }
            }.navigationTitle("Order report")
        }
    }
    
    fileprivate func allOrders() -> [Order] {
        var orders = [Order]()
        viewModel.ecommerceList.forEach { orders.append(contentsOf: $0.orders) }
        return orders
    }
    
    fileprivate func ordersFrom(store name: String) -> [Order] {
        return viewModel.ecommerceList.first(where: { $0.name == name })?.orders ?? []
    }
    
    fileprivate func filterOrdersByDate() -> [Order] {
        return allOrders().filter{ $0.deliveryDate > dateSelection }
    }
    
    fileprivate func orderByAgility(inTime: Bool = true) -> [Order] {
        return allOrders().filter { $0.completeDeadline && inTime }
    }
}

struct SelectReport_Previews: PreviewProvider {
    static var previews: some View {
        SelectReport()
    }
}
