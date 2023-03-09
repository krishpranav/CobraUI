//
//  AngleInteractor.swift
//  CobraUI
//
//  Created by Krisna Pranav on 09/03/23.
//

import Combine
import SwiftUI

// sourcery: AutoMockable
protocol AngleInteractable: AnyObject {
    var presenter: AnglePresenter { get }
    var animation: CurrentValueSubject<Animation?, Never> { get }
    var value: CurrentValueSubject<Double, Never> { get }
    var range: CurrentValueSubject<ClosedRange<Double>, Never> { get }
}
