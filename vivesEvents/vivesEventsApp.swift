//
//  vivesEventsApp.swift
//  vivesEvents
//
//  Created by Matis Bogaert on 04/11/2025.
//

import SwiftUI

@main
struct vivesEventsApp: App {
    @State var uurroosterDataStore = UurroosterDataStore()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(uurroosterDataStore)
        }
    }
}
