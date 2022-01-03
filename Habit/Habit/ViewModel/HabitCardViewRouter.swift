//
//  HabitCardViewRouter.swift
//  Habit
//
//  Created by Tiago Aguiar on 21/06/21.
//

import Foundation
import SwiftUI
import Combine

enum HabitCardViewRouter {
  static func makeHabitDetailView(id: Int, name: String, label: String, habitPublisher: PassthroughSubject<Bool, Never>) -> some View {
    let viewModel = HabitDetailViewModel(id: id, name: name, label: label, interactor: HabitDetailInteractor())
    viewModel.habitPublisher = habitPublisher
    return HabitDetailView(viewModel: viewModel)
  }
  
}
