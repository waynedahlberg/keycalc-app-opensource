//
//  RedLEDDisplay.swift
//  KeyCalc
//
//  Created by Wayne Dahlberg on 10/15/24.
//

import SwiftUI

struct RedLEDDisplay: View {
  // Font size values
  var largeFontSize: CGFloat = 44
  var smallFontSize: CGFloat = 16
  
  var resultText: String
  var computeText: String
  
  let baseResultText: String = "888888888."
  let baseComputeText: String = "8888888888888888888"
  
  let screenGradient2 = LinearGradient(stops: [
    Gradient.Stop(color: Color.black.opacity(0.3), location: 0.0),
    Gradient.Stop(color: Color(hex: "#8295EF").opacity(0.10), location: 0.4),
    Gradient.Stop(color: Color(hex: "#949FD2").opacity(0.10), location: 0.859),
    Gradient.Stop(color: .clear, location: 0.89),
    Gradient.Stop(color: .clear, location: 1.0)
  ], startPoint: .top, endPoint: .bottom)
  
  let screenGradient1 = LinearGradient(colors: [
    Color(.black),
    Color(.red.opacity(0.15))
  ], startPoint: .top, endPoint: .bottom)
  
  var body: some View {
    ZStack {
      Color.black
      
      VStack(alignment: .trailing, spacing: 16) {
        ZStack(alignment: .trailing) {
          Text(baseResultText.appending(" "))
            .foregroundStyle(.red.opacity(0.1))
            .font(.custom("DSEG7Classic-LightItalic", size: largeFontSize))
          Text(resultText.appending(" "))
            .foregroundStyle(.white)
            .font(.custom("DSEG7Classic-LightItalic", size: largeFontSize))
            .glow(color: .ledred, radius: 5, opacity: 0.8)
        }
        
        ZStack(alignment: .trailing) {
          Text("\u{007E}\u{007E}\u{007E}\u{007E}\u{007E}\u{007E}\u{007E}\u{007E}\u{007E}\u{007E}\u{007E}\u{007E}\u{007E}\u{007E}\u{007E}\u{007E}\u{007E}\u{007E}\u{007E}\u{007E}\u{007E}\u{007E}\u{007E}\u{007E}".appending(" "))
            .foregroundStyle(.red.opacity(0.1))
            .font(.custom("DSEG14Classic-Regular", size: smallFontSize))
          
          Text(computeText.appending(" "))
            .foregroundStyle(.white)
            .font(.custom("DSEG14Classic-Regular", size: smallFontSize))
            .glow(color: .ledred, radius: 6, opacity: 0.7)
        }
        .padding(.trailing, 8)
      }
    }
    .overlay {
      Image("hex-grid-1290")
        .resizable(resizingMode: .tile)
        .aspectRatio(contentMode: .fill)
        .blendMode(.sourceAtop)
        .scaleEffect(0.35)
        .opacity(0.5)
        .border(Color.init(white: 0.1), width: 3, edges: .bottom)
    }
  }
}

#Preview {
  RedLEDDisplay(largeFontSize: 44, smallFontSize: 16, resultText: "0.0", computeText: "123456789")
}
