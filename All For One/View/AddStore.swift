//
//  AddStore.swift
//  All For One
//
//  Created by Luiz Pedro Franciscatto Guerra on 17/10/20.
//

import SwiftUI

struct AddStore: View {
    @Binding var presentedSheet: Bool
    @State private var storeName: String = ""
    @State private var login: String = ""
    @State private var password: String = ""
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Store Name")) {
                    VStack {
                        TextField("e.g. Amazon", text: $storeName)
                    }
                }
                Section(header: Text("Login Information")) {
                    TextField("Login", text: $login)
                    SecureField("Password", text: $password)
                }
                Section {
                    Button(action: {
                        performLogin()
                        presentedSheet.toggle()
                    }, label: {
                        HStack {
                            Spacer()
                            Text("Login")
                            Spacer()
                        }
                    })
                    Button(action: {
                        presentedSheet.toggle()
                    }, label: {
                        HStack {
                            Spacer()
                            Text("Cancel")
                                .accentColor(.red)
                            Spacer()
                        }
                    })
                }
            }.navigationTitle("Add a new store")
        }
    }
    
    func performLogin() {
        
    }
}

struct AddStore_Previews: PreviewProvider {
    @State private static var sheetStatus = true
    static var previews: some View {
        AddStore(presentedSheet: $sheetStatus)
    }
}
