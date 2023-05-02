//
//  CircleSlider.swift
//  LevelCoreMotion
//
//  Created by Валерий Игнатьев on 2.05.23.
//

import SwiftUI

//MARK: - CircleSlider

struct CircleSlider: View {
    
    //MARK: Properties
    
    @State private var progress: Double = 0.33
    
    @State private var rotationAngle: Angle = .degrees(120)
    
    private let diametr: Double = 300.0
        
    //MARK: Body

    var body: some View {
        ZStack {
            Circle()
                .stroke(.gray.opacity(0.3), lineWidth: 20)
                .overlay {
                    Text("\(progress, specifier: "%.2F")")
                        .font(.system(size: 80, weight: .bold, design: .rounded))
                }
            
            Circle()
                .trim(from: 0, to: progress)
                .stroke(.purple, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                .rotationEffect(.degrees(-90))
            
            Circle()
                .fill(.white)
                .shadow(radius: 3)
                .frame(width: 21, height: 21)
                .offset(y: -diametr / 2)
                .rotationEffect(rotationAngle)
                .gesture(
                    DragGesture(minimumDistance: 0.0)
                        .onChanged { value in
                            rotationAngle = changeAngle(location: value.location)
                        }
                )
            
        }
        .frame(width: diametr, height: diametr)
    }
    
    //MARK: Private Methods

    private func changeAngle(location: CGPoint) -> Angle {
        // Create a Vector for the location (reversing the y-coordinate system on iOS)
        let vector = CGVector(dx: location.x, dy: -location.y)
        
        // Calculate the angle of the vector
        let angleRadians = atan2(vector.dx, vector.dy)
        
        // Convert the angle to a range from 0 to 360 (rather than having negative angles)
        let positiveAngle = angleRadians < 0 ? angleRadians + (.pi * 2) : angleRadians
        
        // Update slider progress value based on angle
        progress = positiveAngle / (2.0 * .pi)
        
        return Angle(radians: positiveAngle)
    }
}

//MARK: - PreviewProvider

struct CircleSlider_Previews: PreviewProvider {
    static var previews: some View {
        CircleSlider()
    }
}
