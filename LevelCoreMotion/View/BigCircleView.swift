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
    
    //MARK: Initializer
    
    init(xValue: CGFloat, yValue: CGFloat) {
        self.xValue = xValue
        self.yValue = yValue
    }
    
    //MARK: Body

    var body: some View {
        Circle()
            .foregroundStyle(
                .yellow.gradient.shadow(
                    .inner(color: .black.opacity(0.8), radius: 10, x: xValue * 20, y: yValue * 20)
                )
            )
            .frame(width: 200, height: 200)
    }
}

//MARK: - PreviewProvider

struct BigCircleView_Previews: PreviewProvider {
    static var previews: some View {
        BigCircleView(xValue: 0, yValue: 0)
    }
}
