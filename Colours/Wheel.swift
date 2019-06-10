//
//  Wheel.swift
//  Colours
//
//  Created by Max Bucknell on 10/06/2019.
//  Copyright © 2019 Max Bucknell. All rights reserved.
//

import SwiftUI
import UIKit

class WheelView: UIView {
    override func draw(_ rect: CGRect) {
        Shapes.drawPalette(frame: rect)
    }
}

struct WheelViewWrapper : UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<WheelViewWrapper>) -> WheelView {
        WheelView(frame: .zero)
    }

    func updateUIView(_ uiView: WheelView, context: UIViewRepresentableContext<WheelViewWrapper>) {
        uiView.isOpaque = false
    }

    typealias UIViewType = WheelView
}

struct Wheel: View {
    var body: some View {
        WheelViewWrapper()
    }
}

#if DEBUG
struct Wheel_Previews : PreviewProvider {
    static var previews: some View {
        Wheel()
    }
}
#endif
