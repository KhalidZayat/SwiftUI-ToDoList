//
//  SplashView.swift
//  ToDoList
//
//  Created by Khalid Mahmoud on 31/07/2023.
//

import SwiftUI

struct SplashView: View {
    
    @StateObject var viewModel = SplashViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUSerID.isEmpty {
            HomeView()
        } else {
            LoginView()
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
