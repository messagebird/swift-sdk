//
//  ContentView.swift
//  PushNotificationsExample
//
//  Created by Meena Alfons on 12/12/2023.
//

import SwiftUI
import BirdKit

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
            Text("Hello, world!")
            Button("Click Me") {
                AppDelegate.bird?.notifications.requestAuthorization()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
