//
//  HomeView.swift
//  Habit
//
//  Created by Tiago Aguiar on 06/05/21.
//

import SwiftUI

struct HomeView: View {
  
  @ObservedObject var viewModel: HomeViewModel
  
  var body: some View {
    Text("Ola Home Page")
  }
  
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView(viewModel: HomeViewModel())
  }
}
