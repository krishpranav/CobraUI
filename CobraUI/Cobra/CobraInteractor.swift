//
//  CobraInteractor.swift
//  CobraUI
//
//  Created by Krisna Pranav on 09/03/23.
//

import Combine
import SwiftUI

// sourcery: AutoMockable
protocol CobraInteractable: AnyObject {
    var presenter: CobraPresenter { get }
    var shape: ShapeInteractable { get }
    var multiline: MultilineInteractable { get }
    var appearance: AppearanceInteractable { get }
    var animation: AnimationInteractable { get }
}

final class CobraInteractor: CobraInteractable {
    let presenter: CobraPresenter
    let shape: ShapeInteractable
    let multiline: MultilineInteractable
    let appearance: AppearanceInteractable
    let animation: AnimationInteractable

    init(_ loading: Bool, size: CGSize?, transition: AnyTransition?, animated: Animation?, shape: ShapeInteractable = ShapeInteractor(), multiline: MultilineInteractable = MultilineInteractor(), appearance: AppearanceInteractable = AppearanceInteractor(), animation: AnimationInteractable = AnimationInteractor()) {
        presenter = CobraPresenter(loading, size: size, transition: transition, animated: animated)
        self.shape = shape
        self.multiline = multiline
        self.appearance = appearance
        self.animation = animation
    }
}
