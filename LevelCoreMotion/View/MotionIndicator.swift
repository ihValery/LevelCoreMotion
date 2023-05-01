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
                        
            ZStack {
                BigCircleView(xValue: x, yValue: y)
                
                SmallCircleView(xValue: outsideRadius(x: x, y: y).0,
                                yValue: outsideRadius(x: x, y: y).1)
                
                speckOfLight()
            }
            
            Text("Множитель 100")
                .padding([.top, .bottom], 40)
            
            motionValueText(xValue: x * 100, yValue: y * 100)
            
            Text("Формула")
                .padding([.top, .bottom], 40)
            
            motionValueText(xValue: outsideRadius(x: x, y: y).0,
                            yValue: outsideRadius(x: x, y: y).1)
        }
    }

    //MARK: Functions
    
    private func outsideRadius(x: CGFloat, y: CGFloat) -> (CGFloat, CGFloat) {
        if pow(x * 100, 2) + pow(y * 100, 2) > CGFloat(10000) {
            return (1, 1)
        } else {
            return (x, y)
        }
    }

    private func motionValueText(xValue: CGFloat, yValue: CGFloat) -> some View {
        return HStack(spacing: 20) {
            Text("x = \( String(format: "%.3f", xValue) )")
                .frame(width: 135, alignment: .center)
            Text("y = \( String(format: "%.3f", yValue) )")
                .frame(width: 135, alignment: .center)
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
