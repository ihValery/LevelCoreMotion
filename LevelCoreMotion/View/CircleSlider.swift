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
    
    @State private var rotationAngle: Angle = .degrees(0)
    
    @Binding var radius: Double
    
//    private let diametr: Double = 300.0
    
    private var anglesTriginometricCircle: Angle {
        .degrees(360) - rotationAngle
    }
    
    //MARK: Body

    var body: some View {
        ZStack {
            Circle()
                .stroke(.purple, lineWidth: 4)
                .overlay {
                    Text("\(anglesTriginometricCircle.degrees, specifier: "%.0F")˚")
                        .font(.system(size: 80, weight: .bold, design: .rounded))
                }
            
            Circle()
                .fill(.white)
                .shadow(radius: 3)
                .frame(width: 20, height: 20)
                .offset(y: -radius)
                .rotationEffect(rotationAngle)
                .gesture(
                    DragGesture(minimumDistance: 0.0)
                        .onChanged { value in
                            rotationAngle = changeAngle(location: value.location)
                        }
                )
                .rotationEffect(.degrees(90))
        }
        .frame(width: radius * 2, height: radius * 2)
    }
    
    //MARK: Private Methods

    private func changeAngle(location: CGPoint) -> Angle {
        // Create a Vector for the location (reversing the y-coordinate system on iOS)
        let vector = CGVector(dx: location.x, dy: -location.y)
        
        // Calculate the angle of the vector
        let angleRadians = atan2(vector.dx, vector.dy)
        
        // Convert the angle to a range from 0 to 360 (rather than having negative angles)
        let positiveAngle = angleRadians < 0 ? angleRadians + (.pi * 2) : angleRadians
        
        return Angle(radians: positiveAngle)
    }
}

//MARK: - PreviewProvider

struct CircleSlider_Previews: PreviewProvider {
    static var previews: some View {
        CircleSlider(radius: .constant(160))
    }
}
