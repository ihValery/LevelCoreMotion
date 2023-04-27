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
    
    @StateObject private var motion = MotionManager()
    
//    private var xValue: CGFloat
//    private var yValue: CGFloat
    
    //MARK: Initializer
    
//    init(xValue: CGFloat, yValue: CGFloat) {
//        self.xValue = xValue
//        self.yValue = yValue
//    }
    
    //MARK: Body

    var body: some View {
        VStack {
            HStack(spacing: 30) {
                Text("x = \(motion.xValue)")
                Text("y = \(motion.xValue)")
            }
            .foregroundColor(.gray)
            .padding(.bottom, 50)
            
            ZStack {
                Circle()
                    .foregroundStyle(
                        .yellow.gradient.shadow(
                            .inner(color: .black, radius: 10, x: motion.xValue * 20, y: motion.yValue * 20)
                        )
                    )
                    .frame(width: 200, height: 200)
                
                
                Circle()
                    .foregroundStyle(
                        .yellow.gradient.shadow(
//                            .drop(color: .yellow, radius: 4, x: motion.xValue * 10, y: motion.yValue * 10)
                            .inner(color: .yellow, radius: 4, x: motion.xValue * 10, y: motion.yValue * 10)
                        )
                    )
                    .offset(x: motion.xValue * 100, y: motion.yValue * 100)
                    .frame(width: 20, height: 20)
                    .rotation3DEffect(.degrees(motion.xValue * 2), axis: (x: 0, y: 1, z: 0))
                    .rotation3DEffect(.degrees(motion.yValue * 2), axis: (x: -1, y: 0, z: 0))
            }
        }
    }
}

//MARK: - PreviewProvider

struct MotionIndicator_Previews: PreviewProvider {
    static var previews: some View {
        MotionIndicator()
    }
}
