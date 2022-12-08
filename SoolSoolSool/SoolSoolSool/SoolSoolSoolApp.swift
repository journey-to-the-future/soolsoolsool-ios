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
    @StateObject var viewModel = AuthenticationViewModel()

    init() {
        setupAuthentication()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView().environmentObject(viewModel)
            }
        }
    }
}

extension SoolSoolSoolApp {
    private func setupAuthentication() {
        FirebaseApp.configure()
    }
}
