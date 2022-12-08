//
//  LoginView.swift
//  SoolSoolSool
//
//  Created by tae on 2022/12/08.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct LoginView: View {
    // 1
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    var body: some View {
        VStack {
            
            Spacer()
            // 3
            GoogleSignInButton(action: {
                viewModel.signIn()
            })
            .padding()
            Spacer()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
