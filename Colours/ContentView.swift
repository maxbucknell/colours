//
//  ContentView.swift
//  Colours
//
//  Created by Max Bucknell on 10/06/2019.
//  Copyright © 2019 Max Bucknell. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @State var hue: Double = 0

    var body: some View {
        let size = UIScreen.main.bounds.size

        let drag = DragGesture()
            .onChanged { value in
                let delta = CGPoint(
                    x: value.location.x - (size.width / 2),
                    y: -value.location.y - (-size.height / 2)
                )

                let angle = delta.angle

                self.hue = Double(angle / (2 * .pi))
            }

        return ZStack {
            Color(hue: self.hue, saturation: 0.75, brightness: 0.69)

            Wheel()
                .padding(30)
                .opacity(0.6)
                .rotationEffect(Angle(radians: self.hue * .pi * 2))
                .gesture(drag)
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
