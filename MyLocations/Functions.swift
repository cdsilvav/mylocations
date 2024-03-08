//
//  Functions.swift
//  MyLocations
//
//  Created by Claudia Dalila Silva Valencia on 7/03/24.
//

import Foundation

func afterDelay(_ seconds: Double, run: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(
        deadline: .now() + seconds, execute: run)
}
