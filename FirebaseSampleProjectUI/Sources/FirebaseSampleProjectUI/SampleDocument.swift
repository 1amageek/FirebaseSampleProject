//
//  SampleDocument.swift
//  SampleDocument
//
//  Created by nori on 2021/09/01.
//

import Foundation

public struct SampleDocument: Identifiable, Codable {

    public var id: String

    public var text: String

    public init(id: String, text: String) {
        self.id = id
        self.text = text
    }
}
