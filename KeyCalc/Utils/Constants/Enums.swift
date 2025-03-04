//
//  Enums.swift
//  LEDCalculator
//
//  Created by Wayne Dahlberg on 10/7/24.
//

import Foundation

enum Operation {
  case add, subtract, multiply, divide, equal, percent, none
}

enum CalcButton: String {
  // numerals
  case zero =       "0"
  case one =        "1"
  case two =        "2"
  case three =      "3"
  case four =       "4"
  case five =       "5"
  case six =        "6"
  case seven =      "7"
  case eight =      "8"
  case nine =       "9"
  
  // operators etc.
  case add =        "+"
  case subtract =   "-"
  case multiply =   "×"
  case divide =     "÷"
  case equal =      "="
  case clear =      "AC"
  case decimal =    "."
  case percentage = "%"
  case negative =   "negative"
  case undo =       "undo"
  
  var displayValue: String {
    switch self {
      
    case .zero:         return "number-0"
    case .one:          return "number-1"
    case .two:          return "number-2"
    case .three:        return "number-3"
    case .four:         return "number-4"
    case .five:         return "number-5"
    case .six:          return "number-6"
    case .seven:        return "number-7"
    case .eight:        return "number-8"
    case .nine:         return "number-9"
    case .decimal:      return "decimal"
    case .add:          return "plus"
    case .subtract:     return "minus"
    case .multiply:     return "multiply"
    case .divide:       return "divide"
    case .equal:        return "equal"
    case .undo:         return "undo"
    case .clear:        return "clear"
    case .negative:     return "negative"
    case .percentage:   return "percentage"
    }
  }
}

let enumOperators: [CalcButton] = [.subtract, .add, .multiply, .divide]

let multiplySymbol: String = CalcButton.multiply.rawValue
let divisionSymbol: String = CalcButton.divide.rawValue
let additionSymbol: String = CalcButton.add.rawValue
let subtractionSymbol: String = CalcButton.subtract.rawValue

let operators: String = "\(additionSymbol)\(subtractionSymbol)\(multiplySymbol)\(divisionSymbol)"


