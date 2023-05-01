//
//  BigCircleView.swift
//  LevelCoreMotion
//
//  Created by Валерий Игнатьев on 27.04.23.
//

import SwiftUI

//MARK: - BigCircleView

struct BigCircleView: View {
    
    //MARK: Properties
    
    private var xValue: CGFloat
    private var yValue: CGFloat
    private var radius: CGFloat
    
    //MARK: Initializer
    
    init(xValue: CGFloat, yValue: CGFloat, radius: CGFloat) {
        self.xValue = xValue
        self.yValue = yValue
        self.radius = radius
    }
    
    //MARK: Body

    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(
                    .yellow.gradient.shadow(
                        .inner(color: .black.opacity(0.8), radius: 10, x: xValue * 20, y: yValue * 20)
                    )
                )
                .frame(width: radius * 2, height: radius * 2)

            speckOfLight()
        }
    }
    
    //MARK: Functions
    
    private func speckOfLight() -> some View {
        Circle()
            .frame(width: 70, height: 70)
            .foregroundColor(.white.opacity(0.2))
            .blur(radius: 10)
    }
}

//MARK: - PreviewProvider

struct BigCircleView_Previews: PreviewProvider {
    static var previews: some View {
        BigCircleView(xValue: 0, yValue: 0, radius: 100)
    }
}
