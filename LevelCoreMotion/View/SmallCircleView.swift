//
//  SmallCircleView.swift
//  LevelCoreMotion
//
//  Created by Валерий Игнатьев on 27.04.23.
//

import SwiftUI

//MARK: - SmallCircleView

struct SmallCircleView: View {
    
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
                    .inner(color: .black.opacity(0.4), radius: 0.8, x: xValue * 4, y: yValue * 4)
                )
                .shadow(
                    .inner(color: .white.opacity(0.3), radius: 4, x: xValue * -10, y: yValue * -10)
                )
                .shadow(
                    .drop(color: .black.opacity(0.05), radius: 2, x: xValue * 4, y: yValue * 4)
                )
            )
            .offset(x: xValue * 100, y: yValue * 100)
            .frame(width: 20, height: 20)
            .rotation3DEffect(.degrees(xValue * 2), axis: (x: 0, y: 1, z: 0))
            .rotation3DEffect(.degrees(yValue * 2), axis: (x: -1, y: 0, z: 0))
    }
}


//MARK: - PreviewProvider

struct SmallCircleView_Previews: PreviewProvider {
    static var previews: some View {
        SmallCircleView(xValue: 0, yValue: 0)
    }
}
