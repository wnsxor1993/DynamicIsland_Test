//
//  ContentView.swift
//  DynamicIsland_Test
//
//  Created by Zeto on 2022/12/12.
//

import SwiftUI
import ActivityKit

struct ContentView: View {
    
    @State var orderState: OrderState = .ordered
    @State var timer: Timer? = nil
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Button("Start DynamicIsland") {
                startDynamicIsland()
                
                self.timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true, block: { _ in
                    updateDynamicIsland()
                })
            }
        }
        .padding()
    }
    
    func startDynamicIsland() {
        let widgetAttributes = DynamicIslandWidgetAttributes(title: "집밥 스위프트 선생")
        
        let orderStateAttributes = DynamicIslandWidgetAttributes.OrderState(nowState: orderState.orderString, stateImage: orderState.orderImageString)
        
        do {
            let orderActivity = try Activity<DynamicIslandWidgetAttributes>.request(attributes: widgetAttributes, contentState: orderStateAttributes, pushType: nil)
            
            print("Requested ordering Live Activity \(orderActivity.id)")
            
        } catch(let error) {
            print("Error requesting pizza delivery Live Activity \(error.localizedDescription)")
        }
    }
    
    func updateDynamicIsland() {
        switch orderState {
        case .ordered:
            self.orderState = .making
            
        case .making:
            self.orderState = .delivering
            
        case .delivering:
            self.orderState = .delivered
            
        case .delivered:
            self.timer?.invalidate()
            self.timer = nil
        }
        
        Task {
            let newOrderStateAttributes = DynamicIslandWidgetAttributes.OrderState(nowState: orderState.orderString, stateImage: orderState.orderImageString)
            
            for activity in Activity<DynamicIslandWidgetAttributes>.activities {
                await activity.update(using: newOrderStateAttributes)
                
                print("Requested a pizza delivery Live Activity \(orderState.orderString)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
