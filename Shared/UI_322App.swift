//
//  UI_322App.swift
//  Shared
//
//  Created by nyannyan0328 on 2021/10/07.
//

import SwiftUI

@main
struct UI_322App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        #if os(macOS)
        .windowStyle(HiddenTitleBarWindowStyle())
        #endif
    }
}
