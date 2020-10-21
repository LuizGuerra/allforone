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
    
    @ObservedObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("All orders")) {
                    HStack {
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Text("Generate")
                        })
                        Spacer()
                    }
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
                        HStack {
                            Spacer()
                            Button(action: {
                                
                            }, label: {
                                Text("Select")
                            })
                            Spacer()
                        }
                    }
                }
                Section(header: Text("Filtered per date")) {
                    DatePicker("Select a date", selection: $dateSelection,
                               in: ...Date(), displayedComponents: .date)
                    HStack {
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Text("Select")
                        })
                        Spacer()
                    }
                }
                Section(header: Text("Filtered per agility")) {
                    HStack {
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Text("Generate")
                        })
                        Spacer()
                    }
                }
                Section(header: Text("Delivery status")) {
                    Picker("Select a store", selection: $statusSelection) {
                        List(["In time", "Late"], id: \.self) { status in
                            Text(status)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    HStack {
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Text("Generate")
                        })
                        Spacer()
                    }
                }
            }.navigationTitle("Order report")
        }
    }
}

struct SelectReport_Previews: PreviewProvider {
    static var previews: some View {
        SelectReport()
    }
}
