//
//  HomeViewRouter.swift
//  Habit
//
//  Created by Tiago Aguiar on 09/06/21.
//

import Foundation
import SwiftUI

enum HomeViewRouter {
  
  static func makeHabitView() -> some View {
    let viewModel = HabitViewModel(interactor: HabitInteractor())
    return HabitView(viewModel: viewModel)
  }
  
}
