//
//  AngleInteractor.swift
//  CobraUI
//
//  Created by Krisna Pranav on 09/03/23.
//

import Combine
import SwiftUI

protocol AngleInteractable: AnyObject {
    var presenter: AnglePresenter { get }
    var animation: CurrentValueSubject<Animation?, Never> { get }
    var value: CurrentValueSubject<Double, Never> { get }
    var range: CurrentValueSubject<ClosedRange<Double>, Never> { get }
}

final class AngleInteractor: AngleInteractable {
    let presenter = AnglePresenter()
    let animation: CurrentValueSubject<Animation?, Never>
    let value: CurrentValueSubject<Double, Never>
    let range: CurrentValueSubject<ClosedRange<Double>, Never>

    private var cancellables = Set<AnyCancellable>()

    init() {
        value = CurrentValueSubject<Double, Never>(presenter.value)
        animation = CurrentValueSubject<Animation?, Never>(presenter.animation)
        range = CurrentValueSubject<ClosedRange<Double>, Never>(presenter.range)
        range.assign(to: \.range, on: presenter).store(in: &cancellables)
        value.assign(to: \.value, on: presenter).store(in: &cancellables)
        animation.assign(to: \.animation, on: presenter).store(in: &cancellables)
        range.map { $0.lowerBound }.assign(to: \.value, on: presenter).store(in: &cancellables)
    }
}
