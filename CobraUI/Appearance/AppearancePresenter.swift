//
//  AppearancePresenter.swift
//  CobraUI
//
//  Created by Krisna Pranav on 09/03/23.
//

import Foundation
import SwiftUI

final class AppearancePresenter: ObservableObject {
    @Published var type: AppearanceType = .gradient()
}
