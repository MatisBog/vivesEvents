//
//  ContentView.swift
//  vivesEvents
//
//  Created by Matis Bogaert on 04/11/2025.
//

import SwiftUI

struct ContentView: View {
    @Environment(UurroosterDataStore.self) var uurroosterDataStore
    @State var selectedEvent : EventModel?
    @State var loading = true
    var body: some View {
        
        NavigationSplitView {
            if loading {
                ProgressView("Loading...")
            }else {
                Text("Uurrooster").font(.largeTitle)
                List(uurroosterDataStore.uurrooster, id:\.self, selection:$selectedEvent){eventmodel in
                    Text("\(eventmodel.startDateTime)")
                    Text("\(eventmodel.title)")
                }
            }
        } detail: {
            Text("Selecteer een evenement")
            if let selectedEvent = selectedEvent{
                DetailView(selectedEvent : selectedEvent)
            }.task{
                await uurroosterDataStore.loadData()
                loading = false
            }
        }

    }
}

