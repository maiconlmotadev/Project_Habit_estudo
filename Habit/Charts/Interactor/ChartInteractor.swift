//
//  ChartInteractor.swift
//  Habit
//
//  Created by Tiago Aguiar on 15/07/21.
//

import Foundation
import Combine

class ChartInteractor {
  
  private let remote: ChartRemoteDataSource = .shared
  
}

extension ChartInteractor {
  
  func fetchHabitValues(habitId: Int) -> Future<[HabitValueResponse], AppError> {
    return remote.fetchHabitValues(habitId: habitId)
  }
  
}
