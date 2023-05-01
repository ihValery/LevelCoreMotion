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
    
    private var x: CGFloat {
        motion.xValue
    }
    private var y: CGFloat {
        motion.yValue
    }
            
    //MARK: Body
    
    var body: some View {
        VStack(spacing: 0) {
            motionValueText(xValue: x, yValue: y)
            
            Text("Множитель 100")
                .padding(.bottom)
            
            motionValueText(xValue: x * 100, yValue: y * 100)
            
            ZStack {
                BigCircleView(xValue: x, yValue: y)
                
                SmallCircleView(xValue: x, yValue: y)
                
                speckOfLight()
            }
        }
    }

    //MARK: Functions

    private func motionValueText(xValue: CGFloat, yValue: CGFloat) -> some View {
        return HStack(spacing: 20) {
            Text("x = \( String(format: "%.3f", xValue) )")
                .frame(width: 85, alignment: .leading)
            Text("y = \( String(format: "%.3f", yValue) )")
                .frame(width: 85, alignment: .leading)
        }
        .foregroundColor(.gray)
        .padding(.bottom, 50)
    }
    
    private func speckOfLight() -> some View {
        Circle()
            .frame(width: 70, height: 70)
            .foregroundColor(.white.opacity(0.2))
            .blur(radius: 10)
    }
}

//MARK: - PreviewProvider

struct MotionIndicator_Previews: PreviewProvider {
    static var previews: some View {
        MotionIndicator()
    }
}
