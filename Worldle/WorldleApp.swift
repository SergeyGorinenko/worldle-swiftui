//
//  WorldleApp.swift
//  Worldle

import SwiftUI
import WorldleSwiftUI

@main
struct WorldleApp: App {

    var body: some Scene {
        WindowGroup {
            WorldleGameView()
                .environmentObject(DeveloperPreview.shared.appViewModel)
        }
    }
    
}
