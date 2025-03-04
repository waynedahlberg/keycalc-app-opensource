//
//  DisplayGallery.swift
//  KeyCalc
//
//  Created by Wayne Dahlberg on 10/15/24.
//

import SwiftUI

struct DisplayGallery: View {
    @State private var currentPage = 2
    private let colors: [Color] = [.red, .green, .blue]
  
    var resultText: String
    var computeText: String
    
    var body: some View {
        ZStack {
            Color.black
                .clipShape(RoundedRectangle(cornerRadius: 17, style: .continuous))
            
            TabView(selection: $currentPage) {
                RedLEDDisplay(resultText: resultText, computeText: computeText)
                    .tag(0)
                
                GreendLEDDisplay(resultText: resultText, computeText: computeText)
                    .tag(1)
                
                BlueLEDDisplay(resultText: resultText, computeText: computeText)
                    .tag(2)
            }
            .frame(height: 250)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .overlay(alignment: .bottom) {
                PagingIndicator(currentPage: $currentPage)
                    .padding(.bottom, 20)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}

#Preview {
  DisplayGallery(resultText: "1234", computeText: "5678")
}


