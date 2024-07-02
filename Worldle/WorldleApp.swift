//
//  WorldleApp.swift
//  Worldle

import SwiftUI
import WorldleSwiftUI

@main
struct WorldleApp: App {

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(DeveloperPreview.shared.appVM)
        }
    }
    
}
