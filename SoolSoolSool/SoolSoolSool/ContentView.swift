//
//  ContentView.swift
//  SoolSoolSool
//
//  Created by krc on 2022/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isAnimating = false
    @State private var showProgress = false
    var foreverAnimation: Animation {
        Animation.linear(duration:0.3)
            .repeatForever(autoreverses: false)
    }
    
    var body: some View {
        Button(action: { self.showProgress.toggle() }, label: {
                    if showProgress {
                        Image("soolsoolsool")
                            .rotationEffect(Angle(degrees: self.isAnimating ? 360 : 0.0))
                            .animation(self.isAnimating ? foreverAnimation : .default)
                            .onAppear { self.isAnimating = true }
                            .onDisappear { self.isAnimating = false }
                    } else {
                        Image("soolsoolsool")
                    }
                })
                .onAppear { self.showProgress = true }
            }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
