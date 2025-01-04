//
//  StringExtensions.swift
//  Deadlock Heroes
//
//  Created by Andrii Pashuta on 04/01/2025.
//

import Foundation

extension String {
    var stripHTML: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression)
    }
}
