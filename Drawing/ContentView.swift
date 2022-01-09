//
//  ContentView.swift
//  Drawing
//
//  Created by Goyo Vargas on 1/8/22.
//

import SwiftUI

// Creating custom paths
struct ContentView: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))

//            // not needed if you use StrokeStyle API
//            path.closeSubpath()
        }
        .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
