//
//  DynamicIslandWidgetLiveActivity.swift
//  DynamicIslandWidget
//
//  Created by Zeto on 2022/12/12.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct DynamicIslandWidgetAttributes: ActivityAttributes {
    
    public typealias OrderState = ContentState
    
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var nowState: String
        var stateImage: String
    }

    // Fixed non-changing properties about your activity go here!
    var title: String
}

struct DynamicIslandWidgetLiveActivity: Widget {
    
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: DynamicIslandWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack(alignment: .center) {
                Text(context.attributes.title)
                
                HStack(alignment: .center) {
                    Image(systemName: context.state.stateImage)
                    Text(context.state.nowState)
                }
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)
            
        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("🍽")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("🧑🏼‍🍳")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    VStack(alignment: .center) {
                        Text(context.attributes.title)
                        
                        HStack(alignment: .center) {
                            Image(systemName: context.state.stateImage)
                            Text(context.state.nowState)
                        }
                    }
                    .activityBackgroundTint(Color.cyan)
                    .activitySystemActionForegroundColor(Color.black)
                }
            } compactLeading: {
                Text(context.state.nowState)
                
            } compactTrailing: {
                Image(systemName: context.state.stateImage)
                
            } minimal: {
                Image(systemName: context.state.stateImage)
            }
            .widgetURL(URL(string: "com.practice.DynamicIsland-Test"))
            .keylineTint(Color.red)
        }
    }
}
