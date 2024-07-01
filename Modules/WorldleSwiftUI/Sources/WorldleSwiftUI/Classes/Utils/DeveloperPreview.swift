//
//  DeveloperPreview.swift
//
//
//  Created by Serhii Horinenko on 30.06.2024.
//

import Foundation
import WorldleAPI

public class DeveloperPreview {
    
    public static let shared = DeveloperPreview()
    private init() {}
    
    public let appViewModel: WorldleAppViewModel = {
        let baseURL = Bundle.module.url(forResource: "countries", withExtension: "json")!.deletingLastPathComponent().absoluteString
        return WorldleAppViewModel(baseURL: baseURL)
    }()
    
}
