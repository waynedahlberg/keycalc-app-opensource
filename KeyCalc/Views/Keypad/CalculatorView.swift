//
//  KeypadView.swift
//  KeyCalc
//
//  Created by Wayne Dahlberg on 10/14/24.
//

import SwiftUI

struct CalculatorView: View {
  @StateObject private var viewModel = CalculatorViewModel()
  
  let spacing: CGFloat = 8
  @State private var scale: CGFloat = 91.5
  
  let keyLayout: [[KeyChar]] = [
    [.clear, .negative, .percentage, .divide],
    [.seven, .eight, .nine, .multiply],
    [.four, .five, .six, .minus],
    [.one, .two, .three, .plus],
    [.undo, .zero, .decimal, .equal]
  ]
  
  var columns: [GridItem] {
    Array(repeating: .init(.flexible(), spacing: spacing), count: 4)
  }
  
  var body: some View {
    ZStack {
          BackgroundView()
          
          VStack {
            Spacer()
            
            ZStack {
              DisplayGallery(resultText: viewModel.displayValue, computeText: viewModel.computeText)
                .allowsHitTesting(true)
              
              RoundedRectangle(cornerRadius: 17, style: .continuous)
                .inset(by: 5)
                .foregroundStyle(
                  LinearGradient(stops: [
                    Gradient.Stop(color: .white.opacity(0.01), location: 0.0),
                    Gradient.Stop(color: .white.opacity(0.05), location: 0.495),
                    Gradient.Stop(color: .clear, location: 0.505),
                    Gradient.Stop(color: .clear, location: 1.0)
                  ], startPoint: UnitPoint(x: 0.45, y: -0.1), endPoint: UnitPoint(x: 0.5, y: 1))
                )
                .allowsHitTesting(false)
            }

        
        Spacer()
        
        LazyVGrid(columns: columns, spacing: spacing) {
          ForEach(keyLayout, id: \.self) { row in
            ForEach(row, id: \.self) { key in
              KeyView(scale: $scale, keyChar: key, action: { handleKeyPress(key) })
                .aspectRatio(1, contentMode: .fit)
                .compositingGroup()
            }
          }
        }
      }
      .padding(spacing)
    }
  }
  
  private func handleKeyPress(_ key: KeyChar) {
    let action = mapKeyCharToCalculatorAction(key)
    viewModel.performAction(action)
    Haptics.shared.play(.light)
  }
  
  private func mapKeyCharToCalculatorAction(_ key: KeyChar) -> CalculatorAction {
    switch key {
    case .clear: return .clear
    case .negative: return .toggleSign
    case .percentage: return .percentage
    case .divide: return .divide
    case .multiply: return .multiply
    case .minus: return .subtract
    case .plus: return .add
    case .equal: return .equals
    case .decimal: return .decimal
    case .undo: return .undo
    case .zero: return .number(0)
    case .one: return .number(1)
    case .two: return .number(2)
    case .three: return .number(3)
    case .four: return .number(4)
    case .five: return .number(5)
    case .six: return .number(6)
    case .seven: return .number(7)
    case .eight: return .number(8)
    case .nine: return .number(9)
    }
  }
}

#Preview {
  CalculatorView()
}
