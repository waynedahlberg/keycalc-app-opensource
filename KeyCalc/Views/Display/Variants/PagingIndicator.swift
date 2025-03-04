//
//  PagingIndicator.swift
//  KeyCalc
//
//  Created by Wayne Dahlberg on 10/15/24.
//

import SwiftUI



struct RedIndicatorView: View {
  var body: some View {
    VStack(spacing: 0) {
      Image(systemName: "football.fill")
        .resizable()
        .frame(width: 12, height: 12)
        .foregroundStyle(.white.opacity(0.4))
        .padding(.bottom, 10)
        .offset(y: 8)

      ZStack {
        Circle()
          .foregroundStyle(
            Color(hex: "#171616")
          )
          .frame(width: 10, height: 10)
        
        Ellipse()
          .foregroundStyle(
            Color(hex: "#6A0329")
          )
          .blur(radius: 10)
          .frame(width: 20, height: 30)
        
        Circle()
          .foregroundStyle(
            Color(hex: "#FFFFFF")
          )
          .offset(y: -0.5)
          .blur(radius: 0.5)
          .frame(width: 3, height: 3)
      }
      .overlay {
        ZStack {
          Circle()
            .foregroundStyle(
              Color(hex: "#FF1B6F")
                .shadow(.drop(color: Color(hex: "#090B1B"), radius: 1, x: 0, y: 1))
                .shadow(.inner(color: Color(hex: "#FFFFFF"), radius: 4, x: 0, y: 1))
                .shadow(.drop(color: Color(hex: "#FA2372"), radius: 7, x: 0, y: 0))
                .shadow(.drop(color: Color(hex: "#FA2372"), radius: 3.5, x: 0, y: 0))
                .shadow(.drop(color: Color(hex: "#FA2372"), radius: 1.75, x: 0, y: 0))
                .shadow(.drop(color: Color(hex: "#FA2372"), radius: 0.75, x: 0, y: 0))
            )
            .frame(width: 4.8, height: 4.8)
          
          Circle()
            .foregroundStyle(
              Color(hex: "#FFFFFF")
            )
            .offset(y: -0.5)
            .blur(radius: 0.5)
            .frame(width: 4, height: 4)
        }
      }
    }
  }
}

struct GreenIndicatorView: View {
  var body: some View {
    VStack(spacing: 0) {
      Image(systemName: "storefront.fill")
        .resizable()
        .frame(width: 12, height: 12)
        .foregroundStyle(.white.opacity(0.4))
        .padding(.bottom, 10)
        .offset(y: 8)

      ZStack {
        Circle()
          .foregroundStyle(
            Color(hex: "#171616")
          )
          .frame(width: 10, height: 10)
        
        Ellipse()
          .foregroundStyle(
            Color(hex: "#039A4C")
          )
          .blur(radius: 10)
          .frame(width: 20, height: 30)
        
        Circle()
          .foregroundStyle(
            Color(hex: "#FFFFFF")
          )
          .offset(y: -0.5)
          .blur(radius: 0.5)
          .frame(width: 3, height: 3)
      }
      .overlay {
        ZStack {
          Circle()
            .foregroundStyle(
              Color(hex: "#1BFF89")
                .shadow(.drop(color: Color(hex: "#090B1B"), radius: 1, x: 0, y: 1))
                .shadow(.inner(color: Color(hex: "#FFFFFF"), radius: 4, x: 0, y: 1))
                .shadow(.drop(color: Color(hex: "#23FA8B"), radius: 7, x: 0, y: 0))
                .shadow(.drop(color: Color(hex: "#23FA8B"), radius: 3.5, x: 0, y: 0))
                .shadow(.drop(color: Color(hex: "#23FA8B"), radius: 1.75, x: 0, y: 0))
                .shadow(.drop(color: Color(hex: "#23FA8B"), radius: 0.75, x: 0, y: 0))
            )
            .frame(width: 4.8, height: 4.8)
          
          Circle()
            .foregroundStyle(
              Color(hex: "#FFFFFF")
            )
            .offset(y: -0.5)
            .blur(radius: 0.5)
            .frame(width: 4, height: 4)
        }
      }
    }
  }
}

struct BlueIndicatorView: View {
  var body: some View {
    VStack(spacing: 0) {
      Image(systemName: "building.columns.fill")
        .resizable()
        .frame(width: 12, height: 12)
        .foregroundStyle(.white.opacity(0.4))
        .padding(.bottom, 10)
        .offset(y: 8)
      
      ZStack {
        Circle()
          .foregroundStyle(
            Color(hex: "#171616")
          )
          .frame(width: 10, height: 10)
        
        Ellipse()
          .foregroundStyle(
            Color(hex: "#034F9A")
          )
          .blur(radius: 10)
          .frame(width: 20, height: 30)
      }
      .overlay {
        ZStack {
          Circle()
            .foregroundStyle(
              Color(hex: "#1B8DFF")
                .shadow(.drop(color: Color(hex: "#090B1B"), radius: 1, x: 0, y: 1))
                .shadow(.inner(color: Color(hex: "#FFFFFF"), radius: 4, x: 0, y: 1))
                .shadow(.drop(color: Color(hex: "#238EFA"), radius: 7, x: 0, y: 0))
                .shadow(.drop(color: Color(hex: "#238EFA"), radius: 3.5, x: 0, y: 0))
                .shadow(.drop(color: Color(hex: "#238EFA"), radius: 1.75, x: 0, y: 0))
                .shadow(.drop(color: Color(hex: "#238EFA"), radius: 0.75, x: 0, y: 0))
            )
            .frame(width: 4.8, height: 4.8)
          
          Circle()
            .foregroundStyle(
              Color(hex: "#FFFFFF")
            )
            .offset(y: -0.5)
            .blur(radius: 0.5)
            .frame(width: 4, height: 4)
        }
      }
    }
  }
}

struct UnselectedRedIndicatorView: View {
  var body: some View {
    VStack(spacing: 0) {
      Image(systemName: "football.fill")
        .resizable()
        .frame(width: 12, height: 12)
        .foregroundStyle(.white.opacity(0.2))
        .padding(.bottom, 10)
        .offset(y: 8)

      ZStack {
        Circle()
          .foregroundStyle(
            Color(hex: "#171616")
              .shadow(
                .drop(color: Color.white.opacity(0.25), radius: 0, x: 0, y: 0.5)
              )
          )
          .overlay {
            Circle()
              .foregroundStyle(Color(hex: "#313131"))
              .frame(width: 4.8, height: 4.8)
          }
          .frame(width: 10, height: 10)
      }
      .frame(width: 20, height: 30)
    }
  }
}

struct UnselectedGreenIndicatorView: View {
  var body: some View {
    VStack(spacing: 0) {
      Image(systemName: "storefront.fill")
        .resizable()
        .frame(width: 12, height: 12)
        .foregroundStyle(.white.opacity(0.2))
        .padding(.bottom, 10)
        .offset(y: 8)
      
      ZStack {
        Circle()
          .foregroundStyle(
            Color(hex: "#171616")
              .shadow(
                .drop(color: Color.white.opacity(0.25), radius: 0, x: 0, y: 0.5)
              )
          )
          .overlay {
            Circle()
              .foregroundStyle(Color(hex: "#313131"))
              .frame(width: 4.8, height: 4.8)
          }
          .frame(width: 10, height: 10)
      }
      .frame(width: 20, height: 30)
    }
  }
}

struct UnselectedBlueIndicatorView: View {
  var body: some View {
    VStack(spacing: 0) {
      Image(systemName: "building.columns.fill")
        .resizable()
        .frame(width: 12, height: 12)
        .foregroundStyle(.white.opacity(0.2))
        .padding(.bottom, 10)
        .offset(y: 8)

      ZStack {
        Circle()
          .foregroundStyle(
            Color(hex: "#171616")
              .shadow(
                .drop(color: Color.white.opacity(0.25), radius: 0, x: 0, y: 0.5)
              )
          )
          .overlay {
            Circle()
              .foregroundStyle(Color(hex: "#313131"))
              .frame(width: 4.8, height: 4.8)
          }
          .frame(width: 10, height: 10)
      }
      .frame(width: 20, height: 30)
      
    }
  }
}

struct PagingIndicator: View {
    @Binding var currentPage: Int
    
    private let spacing: CGFloat = 32
    
    var body: some View {
        HStack(spacing: spacing) {
            Group {
              Button {
                withAnimation(.easeInOut) {
                  currentPage = 0
                }
              } label: {
                if currentPage == 0 {
                    RedIndicatorView()
                } else {
                    UnselectedRedIndicatorView()
                }
              }
            }
            Group {
              Button {
                withAnimation(.easeInOut) {
                  currentPage = 1
                }
              } label: {
                if currentPage == 1 {
                    GreenIndicatorView()
                } else {
                    UnselectedGreenIndicatorView()
                }
              }
            }
            Group {
              Button {
                withAnimation(.easeInOut) {
                  currentPage = 2                  
                }
              } label: {
                if currentPage == 2 {
                    BlueIndicatorView()
                } else {
                    UnselectedBlueIndicatorView()
                }
              }
            }
        }
        .animation(.spring(.smooth), value: currentPage)
    }
}


#Preview {
  PagingIndicator(currentPage: .constant(1))
}
