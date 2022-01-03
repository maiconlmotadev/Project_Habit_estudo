//
//  HomeViewModel.swift
//  Habit
//
//  Created by Tiago Aguiar on 06/05/21.
//

import SwiftUI

class HomeViewModel: ObservableObject {
  let viewModel = HabitViewModel(interactor: HabitInteractor())
}


extension HomeViewModel {
  func habitView() -> some View {
    return HomeViewRouter.makeHabitView(viewModel: viewModel)
  }
}
