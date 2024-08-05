//
//  ContentView.swift
//  PushNotificationsExample
//
//  Created by Meena Alfons on 12/12/2023.
//

import BirdKit
import SwiftUI

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
                let signedIdentity =
                    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Im1ybjp2MTphcHBsaWNhdGlvbjppZGVudGl0eS1jbGFpbXMtaXNzdWVyOjAxZWNlODAxLWVmNTctNGQwNC1hZGFlLWJjN2U0YWQwOGFmZS8yZmQ5NTdlOS1jNTQwLTRhM2UtYjA5My0wZWE5NmU3NDY1ZjY6MSJ9.eyJpZGVudGlmaWVycyI6W3sia2V5IjoiZW1haWxhZGRyZXNzIiwidmFsdWUiOiJtZWVuYS50ZXN0MkBlbWFpbC5jb20ifV19.in94rLJe1X_7MejgnmV8f284Z8YPxRZcJV8LG5cTbVk"
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
                let attributes = BirdKit.Attributes()
                    .put("displayName", "iOS: push notifications example")
                    .put("subscribedPush", true)
                AppDelegate.bird?.contact.putAttributes(attributes: attributes)
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
