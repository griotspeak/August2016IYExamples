//
//  MadLibState.swift
//  MadLib
//
//  Created by TJ Usiyan on 2016/08/09.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

enum MadLibState {
    case noStrings
    case oneString(String)
    case twoStrings(String, String)

    func append(string: String) -> (succeeded: Bool, MadLibState) {
        switch self {
        case .noStrings:
            return (true, .oneString(string))
        case let .oneString(left):
            return (true, .twoStrings(left, string))
        case .twoStrings:
            return (false, self)
        }
    }
}
