//
//  String+Extension.swift
//  Habit
//
//  Created by Tiago Aguiar on 11/05/21.
//

import Foundation

extension String {
  func isEmail() -> Bool {
    let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    
    return NSPredicate(format:"SELF MATCHES %@", regEx).evaluate(with: self)
  }
  
  func toDate(sourcePattern source: String, destPattern dest: String) -> String? {
    // Pegar a String -> dd/MM/yyyy -> Date
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.dateFormat = source
    
    let dateFormatted = formatter.date(from: self)
    
    // Validar a Data
    guard let dateFormatted = dateFormatted else {
      return nil
    }
    
    // Date -> yyyy-MM-dd -> String
    formatter.dateFormat = dest
    return formatter.string(from: dateFormatted)
  }
  
  func toDate(sourcePattern source: String) -> Date? {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.dateFormat = source
    
    return formatter.date(from: self)
  }
}
