//
//  SoolSoolSoolApp.swift
//  SoolSoolSool
//
//  Created by krc on 2022/10/24.
//

import SwiftUI
import FirebaseCore

@main
struct SoolSoolSoolApp: App {

    init() {
        setupAuthentication()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
               ContentView()
            }
        }
    }
}

extension SoolSoolSoolApp {
    private func setupAuthentication() {
        FirebaseApp.configure()
    }
}
