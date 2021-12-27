//
//  SplashViewRouter.swift
//  Habit
//
//  Created by Tiago Aguiar on 03/05/21.
//

import SwiftUI

enum SplashViewRouter {
  
  static func makeSignInView() -> some View {
    let viewModel = SignInViewModel()
    return SignInView(viewModel: viewModel)
  }
  
}
