//
//  HabitCreateInteractor.swift
//  Habit
//
//  Created by Tiago Aguiar on 26/07/21.
//

import Foundation
import Combine

class HabitCreateInteractor {
  
  private let remote: HabitCreateRemoteDataSource = .shared
  
}

extension HabitCreateInteractor {
  
  func save(habitCreateRequest request: HabitCreateRequest) -> Future<Void, AppError> {
    return remote.save(request: request)
  }
}
