//
//  CGPoint.swift
//  Colours
//
//  Created by Max Bucknell on 10/06/2019.
//  Copyright © 2019 Max Bucknell. All rights reserved.
//

import CoreGraphics

extension CGPoint {
    enum Quadrant {
        case TopLeft, TopRight, BottomRight, BottomLeft, Origin
    }

    var quadrant: Quadrant {
        get {
            if self.y > 0 && self.x <= 0 {
                return .TopLeft
            } else if self.x > 0 && self.y >= 0 {
                return .TopRight
            } else if self.y < 0 && self.x >= 0 {
                return .BottomRight
            } else if self.x < 0 && self.y <= 0 {
                return .BottomLeft
            }

            return .Origin
        }
    }

    var angle: CGFloat {
        get {
            if self.y == 0 {
                if self.x == 0 {
                    return 0
                } else if self.x < 0 {
                    return (3 / 2) * .pi
                } else {
                    return (1 / 2) * .pi
                }
            }

            if self.x == 0 {
                if self.y > 0 {
                    return 0
                } else {
                    return .pi
                }
            }

            let tan = self.x / self.y
            let naiveAngle = atan(tan)

            switch self.quadrant {
            case .TopLeft:
                return naiveAngle + (.pi * 2)
            case .TopRight:
                return naiveAngle
            case .BottomRight:
                return naiveAngle + .pi
            case .BottomLeft:
                return naiveAngle + .pi
            case .Origin:
                return 0
            }
        }
    }
}
