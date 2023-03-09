//
//  CobraModifiers.swift
//  CobraUI
//
//  Created by eCOM-Elango.a on 09/03/23.
//

import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct CobraModifier: ViewModifier {
    let cobra: CobraInteractable
    @State var animation: Bool = false

    public func body(content: Content) -> some View {
        ZStack {
            if cobra.presenter.loading {
                VStack(spacing: cobra.multiline.presenter.spacing) {
                    ForEach(0 ..< cobra.multiline.presenter.lines, id: \.self) { line in
                        GeometryReader { geometry in
                            CobraView(cobra: cobra, line: line)
                                .frame(width: cobra.multiline.presenter.scale * geometry.size.width, height: geometry.size.height)
                                .onReceive([animation].publisher.filter { $0 }.removeDuplicates().first()) { _ in
                                    withAnimation(cobra.animation.position.presenter.animation) {
                                        cobra.animation.position.value.send(cobra.animation.position.presenter.range.upperBound)
                                    }
                                    withAnimation(cobra.animation.opacity.presenter.animation) {
                                        cobra.animation.opacity.value.send(cobra.animation.opacity.presenter.range.upperBound)
                                    }
                                    withAnimation(cobra.animation.radius.presenter.animation) {
                                        cobra.animation.radius.value.send(cobra.animation.radius.presenter.range.upperBound)
                                    }
                                    withAnimation(cobra.animation.angle.presenter.animation) {
                                        cobra.animation.angle.value.send(cobra.animation.angle.presenter.range.upperBound)
                                    }
                                }
                                .onAppear {
                                    DispatchQueue.main.async {
                                        animation = true
                                    }
                                }
                                .onDisappear {
                                    DispatchQueue.main.async {
                                        animation = false
                                    }
                                }
                        }
                    }
                }
                .frame(width: cobra.presenter.size?.width, height: cobra.presenter.size?.height)
                .transition(cobra.presenter.transition)
            } else {
                content
                    .transition(cobra.presenter.transition)
            }
        }
        .animation(cobra.presenter.animated, value: cobra.presenter.loading)
    }
}
