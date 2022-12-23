//
//  Codable+Extension.swift
//  SavyStoryBoard
//
//  Created by ghezal0n on 23/12/2022.
//

import Foundation

extension Encodable {
    func getDictionary() -> [String : Any] {
        if let data = try? JSONEncoder().encode(self) {
            if let dictionary = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any] {
                return dictionary
            }
        }
        return [:]
    }
}
