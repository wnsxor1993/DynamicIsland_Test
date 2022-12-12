//
//  DynamicIslandWidgetBundle.swift
//  DynamicIslandWidget
//
//  Created by Zeto on 2022/12/12.
//

import WidgetKit
import SwiftUI

@main
struct DynamicIslandWidgetBundle: WidgetBundle {
    var body: some Widget {
        DynamicIslandWidget()
        DynamicIslandWidgetLiveActivity()
    }
}
