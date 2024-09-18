//
//  ContentViewModel.swift
//  test2
//
//  Created by Aryan Sharma on 17/09/24.
//

import Foundation

extension ContentView {
    
    @Observable
    class ViewModel {
        
        private var datasource: [DataSourceItem] = [
            .init(type: "Prescription", items: ["Prescription1", "Prescription2", "Prescription3"]),
            .init(type: "Report", items: ["Report1", "Report2", "Report3", "Report4"]),
            .init(type: "Other", items: ["Other1", "Other2", "Other3"]),
            .init(type: "Other2", items: ["Other1", "Other2", "Other3"])
        ]
        
        var data: [DataSourceItem] {
            get {
                return datasource.sorted(by: {$0.type > $1.type})
            }
        }
        
        func getItems(for type: String) -> [String] {
            var items = [String]()
            items = datasource.first(where: { $0.type == type })?.items ?? []
            return items
        }
        
        func addRandomTab() {
            let ran = Int.random(in: 0...1000)
            var items = [String]()
            for _ in 0...Int.random(in: 0...10) {
                items.append("Random \(ran)")
            }
            let dataSourceItem = DataSourceItem(type: "Random \(ran)", items: items)
            datasource.insert(dataSourceItem, at: 0)
        }
    }
}

