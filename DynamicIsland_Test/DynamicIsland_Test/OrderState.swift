//
//  OrderState.swift
//  DynamicIsland_Test
//
//  Created by Zeto on 2022/12/12.
//

import Foundation

enum OrderState {
    
    case ordered
    case making
    case delivering
    case delivered
}

extension OrderState {
    
    var orderString: String {
        switch self {
        case .ordered:
            return "주문을 확인 중입니다"
            
        case .making:
            return "조리 중이오니 잠시만 기다려주세요"
            
        case .delivering:
            return "배달원이 식지 않게 배달 중입니다"
            
        case .delivered:
            return "배달이 완료되었습니다"
        }
    }
    
    var orderImageString: String {
        switch self {
        case .ordered:
            return "phone.down.waves.left.and.right"
            
        case .making:
            return "cooktop"
            
        case .delivering:
            return "box.truck.badge.clock.fill"
            
        case .delivered:
            return "shippingbox.fill"
        }
    }
}
