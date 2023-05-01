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
    
    @State private var radius: CGFloat = 100
    
    private var x: CGFloat {
        motion.xValue
    }
    private var y: CGFloat {
        motion.yValue
    }
            
    //MARK: Body
    
    var body: some View {
        VStack(spacing: 20) {
            motionValueText(xValue: x, yValue: y)
                        
            ZStack {
                BigCircleView(xValue: x, yValue: y, radius: radius)
                
                SmallCircleView(xValue: outsideRadius(x: x, y: y).0,
                                yValue: outsideRadius(x: x, y: y).1, radius: radius)
            }
            
            Text("Множитель 100")
            
            motionValueText(xValue: x * radius, yValue: y * radius)
            
            Text("Формула")
            
            motionValueText(xValue: newPointXY(x1: x, y1: y).0,
                            yValue: newPointXY(x1: x, y1: y).1)
        }
    }

    //MARK: Functions
    
    private func outsideRadius(x: CGFloat, y: CGFloat) -> (CGFloat, CGFloat) {
        // (x - a)^2 + (y - b)^ > r^2
        if pow(x * radius, 2) + pow(y * radius, 2) > pow(radius, 2) {
            return newPointXY(x1: x, y1: y)
        } else {
            return (x, y)
        }
    }

    private func motionValueText(xValue: CGFloat, yValue: CGFloat) -> some View {
        return HStack {
            Text("x = \( String(format: "%.3f", xValue) )")
                .frame(width: 135, alignment: .center)
            Text("y = \( String(format: "%.3f", yValue) )")
                .frame(width: 135, alignment: .center)
        }
        .foregroundColor(.gray)
    }
    
    private func newPointXY(x1: CGFloat, y1: CGFloat) -> (CGFloat, CGFloat) {
        let radius1 = sqrt(Double( pow(x1, 2) + pow(y1, 2) ))
        let sinA = sin(y1 / radius1)
        let y = sinA * radius
        let x = sqrt(Double( pow(radius, 2) - pow(CGFloat(y), 2) ))
        
        return (x / radius, y / radius)
    }
}

//MARK: - PreviewProvider

struct MotionIndicator_Previews: PreviewProvider {
    static var previews: some View {
        MotionIndicator()
    }
}
