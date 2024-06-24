//
//  ContentView.swift
//  PushNotificationsExample
//
//  Created by Meena Alfons on 12/12/2023.
//

import SwiftUI
import BirdKit

struct ContentView: View {
    @State var sourceUrl = ""

    var body: some View {
        VStack(spacing: 20) {
            if sourceUrl != "" {
                Text("Opened from \(sourceUrl)")
            }
            
            let signedIdentity = "change-me-with-sample-signed-identity"
            Text("Push notifications")
            Button("Ask for notifications permission") {
                AppDelegate.requestNotificationsPermission()
            }
            Text("Login")
            Button("Set External Identifier") {
                AppDelegate.bird?.contact.identify(
                    externalid: "987654321"
                )
            }
            Button("Set Signed Identity") {
                let signedIdentity = "change-me-with-sample-signed-identity"
                AppDelegate.bird?.contact.identify(
                    signedIdentity: signedIdentity
                )
            }
            Text("Logout")
            Button("reset") {
                AppDelegate.bird?.contact.reset()
            }
            Text("Contact")
            Button("Put Attributes") {
                let attributes = BirdKit.Attributes().put("displayName", "Name from iOS")
                AppDelegate.bird?.contact.putAttributes(attributes: attributes )
            }
            
        }
        .padding()
        .onOpenURL(perform: { url in
            sourceUrl = url.absoluteString
        })
    }
}
#Preview {
    ContentView()
}
