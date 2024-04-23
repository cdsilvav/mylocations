//
//  String+AddText.swift
//  MyLocations
//
//  Created by Claudia Dalila Silva Valencia on 19/04/24.
//

import Foundation

extension String {
    mutating func add(
        text: String?, 
        separatedBy separator: String = "") {
            if let text = text {
                if !isEmpty {
                    self += separator
                }
                self += text
            }
        }
}
