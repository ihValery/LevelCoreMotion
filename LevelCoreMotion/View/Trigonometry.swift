//
//  Trigonometry.swift
//  LevelCoreMotion
//
//  Created by Валерий Игнатьев on 1.05.23.
//

import SwiftUI

//MARK: - Trigonometry

struct Trigonometry: View {
    
    //MARK: Properties
    
    @State private var radius: Double = 160
    
    @State private var angle: Angle = .degrees(0)
    
//    private var anglesTriginometricCircle: Angle {
////        .degrees(360) -
//        angle
//    }

    //MARK: Body

    var body: some View {
        GeometryReader { gReader in
            let rect = gReader.frame(in: .local)
            let center = CGPoint(x: rect.width / 2, y: rect.height / 2)

            coordinateAxis(rect: rect, center: center)
  
            CircleSlider(angle: $angle, radius: $radius)
                .position(center)
            
            createTriangle(center: center, radius: radius, angle: angle)
        }
        .overlay(alignment: .bottom) {
            radiusSlider()
        }
    }
    
    //MARK: Functions
    
    //Build Triangle
    
    @ViewBuilder
    private func createTriangle(center: CGPoint, radius: Double, angle: Angle) -> some View {
        createHypotenuse(center: center, radius: radius, angle: angle)
        
        createAdjoiningCathetus(center: center, radius: radius, angle: angle)
        
        createOppositeCathetus(center: center, radius: radius, angle: angle)
    }
    
    private func createHypotenuse(center: CGPoint, radius: Double, angle: Angle) -> some View {
        Path { path in
            path.move(to: center)
            path.addLine(to: CGPoint(x: center.x, y: center.y - radius))
        }
        .strokedPath(StrokeStyle(lineWidth: 2))
        .foregroundColor(.red)
        .rotationEffect(angle + .degrees(90))
    }
    
    private func createAdjoiningCathetus(center: CGPoint, radius: Double, angle: Angle) -> some View {
        Path { path in
            path.move(to: center)
            path.addLine(to: CGPoint(x: center.x + (cos(angle.radians) * radius), y: center.y))
        }
        .strokedPath(StrokeStyle(lineWidth: 2))
        .foregroundColor(.red)
    }
    
    private func createOppositeCathetus(center: CGPoint, radius: Double, angle: Angle) -> some View {
        Path { path in
            path.move(to: CGPoint(x: center.x + (cos(angle.radians) * radius), y: center.y))
            path.addLine(to: CGPoint(x: center.x + (cos((.degrees(360) - angle).radians) * radius),
                                     y: center.y - sin((.degrees(360) - angle).radians) * radius))
        }
        .strokedPath(StrokeStyle(lineWidth: 2))
        .foregroundColor(.red)
    }
        
    @ViewBuilder
    private func coordinateAxis(rect: CGRect, center: CGPoint) -> some View {
        Path { path in
            path.move(to: center)
            path.addLine(to: CGPoint(x: rect.midX, y: center.y - rect.width / 2))
            
            path.move(to: center)
            path.addLine(to: CGPoint(x: rect.midX, y: center.y + rect.width / 2))
            
            path.move(to: center)
            path.addLine(to: CGPoint(x: rect.width, y: rect.midY))
            
            path.move(to: center)
            path.addLine(to: CGPoint(x: .zero, y: rect.midY))
        }
        .strokedPath(StrokeStyle(lineWidth: 1, dash: [5]))
        .foregroundColor(.gray)
        
        VStack(alignment: .leading) {
            HStack {
                Text("Width = \(rect.width, specifier: "%.0F")")
                Text("Height = \(rect.height, specifier: "%.0F")")
            }
            
            Text("Radius = \(radius, specifier: "%.0F")")
            
            HStack {
                Text("Real Angles = \((angle).degrees, specifier: "%.0F")˚")
                Text("Fake Angles = \((Angle.degrees(360) - angle).degrees, specifier: "%.0F")˚")
            }
        }
        .padding(.leading)
        .font(.caption)
        .foregroundColor(.gray)
    }
    
    private func radiusSlider() -> some View {
        Slider(value: $radius, in: 100...500)
            .padding(.horizontal)
            .tint(.purple)
    }
}

//MARK: - PreviewProvider

struct Trigonometry_Previews: PreviewProvider {
    static var previews: some View {
        Trigonometry()
    }
}
