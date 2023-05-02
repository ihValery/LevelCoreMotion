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

    //MARK: Body

    var body: some View {
        GeometryReader { gReader in
            let rect = gReader.frame(in: .local)
            let center = CGPoint(x: rect.width / 2, y: rect.height / 2)

            coordinateAxis(rect: rect, center: center)
            
            mainCircle(center: center)
            
            Path { path in
                path.move(to: center)
                path.addLine(to: CGPoint(x: center.x, y: center.y - radius))
            }
            .strokedPath(StrokeStyle(lineWidth: 2))
            .foregroundColor(.red)
            .rotationEffect(.degrees(45))
            
            Path { path in
                path.move(to: center)
                path.addLine(to: CGPoint(x: center.x + (cos(.pi / 4) * radius), y: center.y))
            }
            .strokedPath(StrokeStyle(lineWidth: 2))
            .foregroundColor(.red)
            
            Path { path in
                path.move(to: CGPoint(x: center.x + (cos(.pi / 4) * radius), y: center.y))
                path.addLine(to: CGPoint(x: center.x + (cos(.pi / 4) * radius),
                                         y: center.y - sin(.pi / 4) * radius))
            }
            .strokedPath(StrokeStyle(lineWidth: 2))
            .foregroundColor(.red)

        }
        .overlay(alignment: .bottom) {
            radiusSlider()
        }
    }
    
    //MARK: Functions
    
    @ViewBuilder
    private func mainCircle(center: CGPoint) -> some View {
        Circle()
            .stroke(lineWidth: 3)
            .frame(width: radius * 2, height: radius * 2)
            .position(center)
            .foregroundColor(.purple)
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
            Text("Width = \(rect.width)")
            Text("Height = \(rect.height)")
            Text("Radius = \(radius)")
        }
        .padding(.leading)
        .font(.caption)
        .foregroundColor(.gray)
    }
    
    private func radiusSlider() -> some View {
        Slider(value: $radius, in: 0...165)
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
