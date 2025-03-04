//
//  Extension+Double.swift
//  neumorphic-playground
//
//  Created by Wayne Dahlberg on 10/11/24.
//

import Foundation

/// Reference: https://freedium.cfd/https://betterprogramming.pub/reusable-components-in-swiftui-custom-sliders-8c115914b856

extension Double {
  func convert(fromRange: (Double, Double), toRange: (Double, Double)) -> Double {
    // Example: if self = 1, fromRange = (0,2), toRange = (10, 12) -> solution = 11
    var value = self
    value -= fromRange.0
    value /= Double(fromRange.1 - fromRange.0)
    value *= toRange.1 - toRange.0
    value += toRange.0
    return value
  }
}
