//
//  MotionIndicator.swift
//  LevelCoreMotion
//
//  Created by Валерий Игнатьев on 26.04.23.
//

import SwiftUI

//MARK: - MotionIndicator

struct MotionIndicator: View {
    
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
            .strokeBorder(.yellow, lineWidth: 2)
            .frame(width: 200, height: 200)
    }
}

//MARK: - PreviewProvider

struct MotionIndicator_Previews: PreviewProvider {
    static var previews: some View {
        MotionIndicator(xValue: 0, yValue: 0)
    }
}
