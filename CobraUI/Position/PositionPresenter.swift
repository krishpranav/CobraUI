//
//  PositionPresenter.swift
//  CobraUI
//
//  Created by Krisna Pranav on 09/03/23.
//

import SwiftUI

final class PositionPresenter: ObservableObject {
    @Published var animation: Animation?
    @Published var value: CGFloat = .zero
    @Published var range: ClosedRange<CGFloat> = .zero ... 1
}
