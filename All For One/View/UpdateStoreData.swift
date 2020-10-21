//
//  UpdateStoreData.swift
//  All For One
//
//  Created by Luiz Pedro Franciscatto Guerra on 19/10/20.
//

import SwiftUI

struct RefreshButton: View {
    @State private var refreshRotation = false
    var body: some View {
        Button(action: {
            refreshRotation.toggle()
        }, label: {
            VStack {
                Image("update-arrow")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20, alignment: .center)
                    .rotationEffect(Angle.degrees(refreshRotation ? 360 : .zero))
                    .animation(.easeOut)
                Text("Refresh")
                    .accentColor(.black)
            }
        })
    }
}

struct UpdateStoreData: View {
    @Binding var isSheetUp: Bool
    let connectedStores: [String]
    var body: some View {
        NavigationView {
            Form {
                Section {
                    List(connectedStores, id: \.self) { imageName in
                        HStack {
                            Image(imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100, alignment: .center)
                            Spacer()
                            RefreshButton()
                        }
                    }
                }
            }.navigationTitle("Find updates")
        }
    }
}

struct UpdateStoreData_Previews: PreviewProvider {
    @State private static var isUp = true
    static var previews: some View {
        UpdateStoreData(isSheetUp: $isUp, connectedStores: ["aliexpress", "amazon", "nike"])
    }
}
