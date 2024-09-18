//
//  ContentView.swift
//  test2
//
//  Created by Aryan Sharma on 17/09/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var vm: ViewModel = ViewModel()
    @State private var currentTab: String = ""
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 5) {
                    ForEach(vm.data, id: \.type) { item in
                        blackButton(label: item.type) {
                            self.currentTab = item.type
                        }
                    }
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(height: 50)
        
            List(vm.getItems(for: self.currentTab), id: \.self) { item in
                Text(item)
            }
            
            blackButton(label: "+ Random tab") {
                vm.addRandomTab()
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            if let data = vm.data.first {
                self.currentTab = data.type
            }
        }
    }
}

private struct blackButton: View {
    var label: String
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            self.action()
        }, label: {
            Text(label)
                .padding(.horizontal)
        })
        .frame(height: 50)
        .frame(minWidth: 100)
        .foregroundStyle(.white)
        .background(.black)
        .clipShape(.rect(cornerRadius: 10))
    }
}

#Preview {
    ContentView()
}

