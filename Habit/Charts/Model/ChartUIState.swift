//
//  ChartUIState.swift
//  Habit
//
//  Created by Tiago Aguiar on 15/07/21.
//

import Foundation

enum ChartUIState: Equatable {
  case loading
  case emptyChart
  case fullChart
  case error(String)
}
