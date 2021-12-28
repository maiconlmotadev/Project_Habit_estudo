//
//  SignUpViewModel.swift
//  Habit
//
//  Created by Tiago Aguiar on 07/05/21.
//

import SwiftUI
import Combine

class SignUpViewModel: ObservableObject {
  
  @Published var fullName = ""
  @Published var email = ""
  @Published var password = ""
  @Published var document = ""
  @Published var phone = ""
  @Published var birthday = ""
  @Published var gender = Gender.male
  
  var publisher: PassthroughSubject<Bool, Never>!
  
  @Published var uiState: SignUpUIState = .none
  
  func signUp() {
    self.uiState = .loading
    
    // Pegar a String -> dd/MM/yyyy -> Date
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.dateFormat = "dd/MM/yyyy"
    
    let dateFormatted = formatter.date(from: birthday)
    
    // Validar a Data
    guard let dateFormatted = dateFormatted else {
      self.uiState = .error("Data inválida \(birthday)")
      return
    }
    
    // Date -> yyyy-MM-dd -> String
    formatter.dateFormat = "yyyy-MM-dd"
    let birthday = formatter.string(from: dateFormatted)
    
    // Main Thread
    WebService.postUser(request: SignUpRequest(fullName: fullName,
                                               email: email,
                                               password: password,
                                               document: document,
                                               phone: phone,
                                               birthday: birthday,
                                               gender: gender.index)) { (successResponse, errorResponse) in
      // Non Main Thread
      if let error = errorResponse {
        DispatchQueue.main.async {
          // Main Thread
          self.uiState = .error(error.detail)
        }
      }
      
      if let success = successResponse {
        WebService.login(request: SignInRequest(email: self.email,
                                                password: self.password)) { (successResponse, errorResponse) in
          
          if let errorSignIn = errorResponse {
            DispatchQueue.main.async {
              // Main Thread
              self.uiState = .error(errorSignIn.detail.message)
            }
          }
          
          if let successSignIn = successResponse {
            DispatchQueue.main.async {
              print(successSignIn)
              self.publisher.send(success)
              self.uiState = .success
            }
          }
          
        }
        
      }
      
    }
    
  }
  
}

extension SignUpViewModel {
  func homeView() -> some View {
    return SignUpViewRouter.makeHomeView()
  }
}
