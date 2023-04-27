//
//  MotionManager.swift
//  LevelCoreMotion
//
//  Created by Валерий Игнатьев on 26.04.23.
//

import SwiftUI
import CoreMotion

//MARK: - MotionManager

class MotionManager: ObservableObject {
    
    //MARK: Properties
    
    private let motionManager = CMMotionManager()
    
    @Published var xValue: CGFloat = 0.0
    @Published var yValue: CGFloat = 0.0
    
    //MARK: Initializer
    
    init() {
        //Я ограничиваю скорость до 40 кадров в секунду
        motionManager.deviceMotionUpdateInterval = 1/40
        
        motionManager.startDeviceMotionUpdates(to: .main) { [weak self] data, error in
            guard let motion = data?.attitude else { return }
                self?.xValue = motion.roll
                self?.yValue = motion.pitch
        }
    }
}
