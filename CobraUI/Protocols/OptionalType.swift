//
//  OptionalType.swift
//  CobraUI
//
//  Created by Krisna Pranav on 09/03/23.
//

import Foundation

public protocol OptionalType {
    associatedtype Wrapped
    var wrapped: Wrapped? { get }
}
