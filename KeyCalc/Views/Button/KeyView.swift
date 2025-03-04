//
//  KeyView.swift
//  KeyCalc
//
//  Created by Wayne Dahlberg on 10/14/24.
//

import SwiftUI

import SwiftUI

enum KeyChar: String, CaseIterable {
  case clear, negative, percentage, undo
  case divide, multiply, minus, plus, equal
  case decimal
  case zero, one, two, three, four, five, six, seven, eight, nine
  
  var character: String {
    rawValue
  }
  
  var color: KeyColor {
    switch self {
    case .clear:
      return .orange
    case .equal:
      return .blue
    case .undo:
      return .red
    case .divide, .multiply, .minus, .plus, .negative, .percentage:
      return .dark
    default:
      return .light
    }
  }
}

enum KeyColor {
  case dark, light, orange, blue, red
  
  var backgroundGradient: LinearGradient {
    switch self {
    case .orange:
      return LinearGradient(stops: [
        Gradient.Stop(color: Color(hex: "#973C00"), location: 0),
        Gradient.Stop(color: Color(hex: "#6D2C00"), location: 0.57),
        Gradient.Stop(color: Color(hex: "#642800"), location: 1),
      ], startPoint: .top, endPoint: .bottom)
    case .light:
      return LinearGradient(stops: [
        Gradient.Stop(color: Color(hex: "#4C4C4C"), location: 0),
        Gradient.Stop(color: Color(hex: "#373737"), location: 0.57),
        Gradient.Stop(color: Color(hex: "#323232"), location: 1),
      ], startPoint: .top, endPoint: .bottom)
    case .dark:
      return LinearGradient(stops: [
        Gradient.Stop(color: Color(hex: "#1A1A1A"), location: 0),
        Gradient.Stop(color: Color(hex: "#1C1C1C"), location: 0.57),
        Gradient.Stop(color: Color(hex: "#1A1A1A"), location: 1),
      ], startPoint: .top, endPoint: .bottom)
    case .blue:
      return LinearGradient(stops: [
        Gradient.Stop(color: Color(hex: "#004C97"), location: 0),
        Gradient.Stop(color: Color(hex: "#00376D"), location: 0.57),
        Gradient.Stop(color: Color(hex: "#003264"), location: 1),
      ], startPoint: .top, endPoint: .bottom)
    case .red:
      return LinearGradient(stops: [
        Gradient.Stop(color: Color(hex: "#970000"), location: 0),
        Gradient.Stop(color: Color(hex: "#6D0000"), location: 0.57),
        Gradient.Stop(color: Color(hex: "#640000"), location: 1),
      ], startPoint: .top, endPoint: .bottom)
    }
  }
  
  var foregroundGradient: LinearGradient {
    switch self {
    case .orange:
      return LinearGradient(stops: [
        Gradient.Stop(color: Color(hex: "#712D00"), location: 0.04),
        Gradient.Stop(color: Color(hex: "#9A3E00"), location: 0.47),
        Gradient.Stop(color: Color(hex: "#AD4500"), location: 1),
      ], startPoint: .top, endPoint: .bottom)
    case .light:
      return LinearGradient(stops: [
        Gradient.Stop(color: Color(hex: "#5E5E5E"), location: 0.04),
        Gradient.Stop(color: Color(hex: "#4D4D4D"), location: 0.47),
        Gradient.Stop(color: Color(hex: "#7D7D7D"), location: 1),
      ], startPoint: .top, endPoint: .bottom)
    case .dark:
      return LinearGradient(stops: [
        Gradient.Stop(color: Color(hex: "#2B2B2B"), location: 0.04),
        Gradient.Stop(color: Color(hex: "#1A1A1A"), location: 0.47),
        Gradient.Stop(color: Color(hex: "#2A2A2A"), location: 1),
      ], startPoint: .top, endPoint: .bottom)
    case .blue:
      return LinearGradient(stops: [
        Gradient.Stop(color: Color(hex: "#003971"), location: 0.04),
        Gradient.Stop(color: Color(hex: "#004D9A"), location: 0.47),
        Gradient.Stop(color: Color(hex: "#005FBE"), location: 1),
      ], startPoint: .top, endPoint: .bottom
      )
    case .red:
      return LinearGradient(stops: [
        Gradient.Stop(color: Color(hex: "#710000"), location: 0.04),
        Gradient.Stop(color: Color(hex: "#9A0000"), location: 0.47),
        Gradient.Stop(color: Color(hex: "#CF0000"), location: 1),
      ], startPoint: .top, endPoint: .bottom
      )
    }
  }
  
  var shadowColor: String {
    switch self {
    case .orange:
      return "#5D2500"
    case .light:
      return "#2A2A2A"
    case .dark:
      return "#1A1A1A"
    case .blue:
      return "#002E5D"
    case .red:
      return "#560000"
    }
  }
}

struct BackgroundView: View {
  var body: some View {
    ZStack {
      Color(hex: "#606269")
        .blendMode(.overlay)
        .opacity(0.74)
      
      LinearGradient(colors: [
        Color(hex: "#464646"),
        Color(hex: "#323232"),
        Color(hex: "#262626")
      ], startPoint: .top, endPoint: .bottom)
      
      Image("pattern")
        .resizable(resizingMode: .tile)
        .opacity(0.20)
      
      Color.white.opacity(0.13)
        .blendMode(.overlay)
    }.edgesIgnoringSafeArea(.all)
  }
}

struct KeyView: View {
  @State var isPressed: Bool = false
  @Binding var scale: CGFloat
  let keyChar: KeyChar
  let action: () -> Void
  
  var body: some View {
    ZStack {
      BackgroundInsetView(scale: $scale)
      
      Button {
        action()
      } label: {
        ZStack {
          KeycapBackground(scale: $scale, color: keyChar.color)
          KeycapForeground(scale: $scale, character: keyChar)
        }
      }
      .buttonStyle(KeyCapButtonStyle())
    }
  }
}

struct BackgroundInsetView: View {
  @Binding var scale: CGFloat
  
  var body: some View {
    RoundedRectangle(cornerRadius: 17.1, style: .continuous)
      .foregroundStyle(
        Color(hex: "#0D0D0D")
          .shadow(.drop(color: .white.opacity(0.2), radius: 1, x: 0, y: 0.5))
          .shadow(.drop(color: .black.opacity(0.5), radius: 0.5, x: 0, y: -1))
      )
      .frame(width: scale * 1.0, height: scale * 1.0)
  }
}

struct KeycapBackground: View {
  @Binding var scale: CGFloat
  let color: KeyColor
  
  let angularBgGradient = AngularGradient(stops: [
    Gradient.Stop(color: Color(hex: "#6E6E6E"), location: 0.0),
    Gradient.Stop(color: Color(hex: "#434343"), location: 0.13),
    Gradient.Stop(color: Color(hex: "#929292"), location: 0.17),
    Gradient.Stop(color: Color(hex: "#8C8C8C"), location: 0.33),
    Gradient.Stop(color: Color(hex: "#FFFFFF"), location: 0.37),
    Gradient.Stop(color: Color(hex: "#A9A9A9"), location: 0.40),
    Gradient.Stop(color: Color(hex: "#B1B1B1"), location: 0.59),
    Gradient.Stop(color: Color(hex: "#FFFFFF"), location: 0.63),
    Gradient.Stop(color: Color(hex: "#7E7E7E"), location: 0.67),
    Gradient.Stop(color: Color(hex: "#7D7D7D"), location: 0.82),
    Gradient.Stop(color: Color(hex: "#3F3F3F"), location: 0.87),
    Gradient.Stop(color: Color(hex: "#6E6E6E"), location: 0.91),
  ], center: .center, angle: Angle(degrees: 90.0))
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .foregroundStyle(color.backgroundGradient)
        .frame(width: scale * 0.9, height: scale * 0.9)
      
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .foregroundStyle(
          angularBgGradient
            .shadow(.drop(color: Color.white.opacity(0.15), radius: 0, x: 0, y: 1))
            .blendMode(.softLight)
        )
        .frame(width: scale * 0.9, height: scale * 0.9)
    }
  }
}

struct KeycapForeground: View {
  @Binding var scale: CGFloat
  var character: KeyChar
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .foregroundStyle(
          character.color.foregroundGradient
            .shadow(.inner(color: Color(hex: character.color.shadowColor), radius: 1, x: 0, y: -3))
            .shadow(.inner(color: Color(hex: "#FFFFFF").opacity(0.3), radius: 1, x: 0, y: 1))
            .shadow(
              .drop(color: .black.opacity(0.15), radius: 6, x: 0, y: 10)
            )
        )
        .frame(width: scale * 0.69, height: scale * 0.69)
      
      // Texture
      Image("pattern")
        .resizable(resizingMode: .tile)
        .blendMode(.overlay)
        .opacity(0.36)
        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
      
      // Glyph
      Image(character.rawValue)
        .resizable()
        .aspectRatio(contentMode: .fit)
      //                .glow(color: .white.opacity(0.25), radius: 5)
        .foregroundStyle(
          Color(hex: "#FFFFFF")
            .shadow(.inner(color: Color.black.opacity(0.75), radius: 0.5, x: 0, y: 1))
            .shadow(.drop(color: Color.white.opacity(0.15), radius: 0, x: 0, y: 1))
        )
        .frame(height: 32)
    }
  }
}

struct KeyCapButtonStyle: ButtonStyle {
  var pressedScale: CGFloat = 0.93
  var animationDuration: Double = 0.05
  
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .scaleEffect(configuration.isPressed ? pressedScale : 1.0)
      .animation(.easeInOut(duration: animationDuration), value: configuration.isPressed)
      .overlay {
        RoundedRectangle(cornerRadius: 14, style: .continuous)
          .fill(configuration.isPressed ? Color.black.opacity(0.25) : Color.clear)
      }
  }
}

#Preview {
  ZStack {
    BackgroundView().edgesIgnoringSafeArea(.all)
    
    KeyView(scale: .constant(158), keyChar: .clear) {
      // action
    }
  }
}
