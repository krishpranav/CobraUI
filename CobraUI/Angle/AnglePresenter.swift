//
//  AnglePresenter.swift
//  CobraUI
//
//  Created by Krisna Pranav on 09/03/23.
//

import SwiftUI

final class AnglePresenter: ObservableObject {
    @Published var animation: Animation?
    @Published var value: Double = .zero
    @Published var range: ClosedRange<Double> = .zero ... 360
}
