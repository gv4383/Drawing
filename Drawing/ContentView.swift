//
//  ContentView.swift
//  Drawing
//
//  Created by Goyo Vargas on 1/8/22.
//

import SwiftUI

// Part 1 - Creating custom paths
//struct ContentView: View {
//    var body: some View {
//        Path { path in
//            path.move(to: CGPoint(x: 200, y: 100))
//            path.addLine(to: CGPoint(x: 100, y: 300))
//            path.addLine(to: CGPoint(x: 300, y: 300))
//            path.addLine(to: CGPoint(x: 200, y: 100))
//
////            // not needed if you use StrokeStyle API
////            path.closeSubpath()
//        }
//        .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
//    }
//}

// Part 2 - Paths vs shapes
//struct Triangle: Shape {
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//
//        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
//        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
//        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
//        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
//
//        return path
//    }
//}
//
//struct Arc: Shape {
//    let startAngle: Angle
//    let endAngle: Angle
//    let clockwise: Bool
//
//    func path(in rect: CGRect) -> Path {
//        let rotationAdjustment = Angle.degrees(90)
//        let modifiedStart = startAngle - rotationAdjustment
//        let modifiedEnd = endAngle - rotationAdjustment
//
//        var path = Path()
//
//        path.addArc(
//            center: CGPoint(x: rect.midX, y: rect.midY),
//            radius: rect.width / 2,
//            startAngle: modifiedStart,
//            endAngle: modifiedEnd,
//            clockwise: !clockwise
//        )
//
//        return path
//    }
//}
//
//struct ContentView: View {
//    var body: some View {
////        Triangle()
////            .stroke(.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
////            .frame(width: 300, height: 300)
//        Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
//            .stroke(.blue, lineWidth: 10)
//            .frame(width: 300, height: 300)
//    }
//}

// Part 3 - Adding strokeBorder() support with InsettableShape
//struct Arc: InsettableShape {
//    let startAngle: Angle
//    let endAngle: Angle
//    let clockwise: Bool
//    var insetAmount = 0.0
//
//    func path(in rect: CGRect) -> Path {
//        let rotationAdjustment = Angle.degrees(90)
//        let modifiedStart = startAngle - rotationAdjustment
//        let modifiedEnd = endAngle - rotationAdjustment
//
//        var path = Path()
//
//        path.addArc(
//            center: CGPoint(x: rect.midX, y: rect.midY),
//            radius: rect.width / 2 - insetAmount,
//            startAngle: modifiedStart,
//            endAngle: modifiedEnd,
//            clockwise: !clockwise
//        )
//
//        return path
//    }
//
//    func inset(by amount: CGFloat) -> some InsettableShape {
//        var arc = self
//        arc.insetAmount += amount
//        return arc
//    }
//}
//
//struct ContentView: View {
//    var body: some View {
////        Circle()
////            .stroke(.blue, lineWidth: 40)
////            .strokeBorder(.blue, lineWidth: 40)
//        Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
//            .strokeBorder(.blue, lineWidth: 40)
//    }
//}

// Part 4 - Transforming shapes using CGAffineTransform and even-odd fills
//struct Flower: Shape {
//    var petalOffset = -20.0
//    var petalWidth = 100.0
//
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//
//        for number in stride(from: 0, to: Double.pi * 2, by: Double.pi / 8) {
//            let rotation = CGAffineTransform(rotationAngle: number)
//            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
//            let originalPetal = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: rect.width / 2))
//            let rotatedPetal = originalPetal.applying(position)
//
//            path.addPath(rotatedPetal)
//        }
//
//        return path
//    }
//}
//
//struct ContentView: View {
//    @State private var petalOffset = -20.0
//    @State private var petalWidth = 100.0
//
//    var body: some View {
//        VStack {
//            Flower(petalOffset: petalOffset, petalWidth: petalWidth)
////                .stroke(.red, lineWidth: 1)
//                .fill(.red, style: FillStyle(eoFill: true))
//
//            Text("Offset")
//            Slider(value: $petalOffset, in: -40...40)
//                .padding([.horizontal, .bottom])
//
//            Text("Width")
//            Slider(value: $petalWidth, in: 0...100)
//                .padding(.horizontal)
//        }
//    }
//}

// Part 5 - Creative borders and fills using ImagePaint
//struct ContentView: View {
//    var body: some View {
////        Text("Hello, world!")
////            .frame(width: 300, height: 300)
////            .border(ImagePaint(image: Image("Example"), sourceRect: CGRect(x: 0, y: 0.4, width: 1, height: 0.5), scale: 0.1), width: 50)
//        Capsule()
//            .strokeBorder(ImagePaint(image: Image("Example"), sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5), scale: 0.3), lineWidth: 20)
//            .frame(width: 300, height: 200)
//    }
//}

// Part 6 - Enabling high-performance Metal rendering with drawingGroup()
//struct ColorCyclingCircle: View {
//    var amount = 0.0
//    var steps = 100
//
//    var body: some View {
//        ZStack {
//            ForEach(0..<steps) { value in
////                Circle()
////                    .inset(by: Double(value))
////                    .strokeBorder(color(for: value, brightness: 1), lineWidth: 2)
//                Circle()
//                    .inset(by: Double(value))
//                    .strokeBorder(
//                        LinearGradient(
//                            gradient: Gradient(colors: [
//                                color(for: value, brightness: 1),
//                                color(for: value, brightness: 0.5)
//                            ]),
//                            startPoint: .top,
//                            endPoint: .bottom
//                        ),
//                        lineWidth: 2
//                    )
//            }
//        }
//        // Needed for second Circle view above ^
//        // (use ONLY when you have performance problems)
//        .drawingGroup()
//    }
//
//    func color(for value: Int, brightness: Double) -> Color {
//        var targetHue = Double(value) / Double(steps) + amount
//
//        if targetHue > 1 {
//            targetHue -= 1
//        }
//
//        return Color(hue: targetHue, saturation: 1, brightness: brightness)
//    }
//}
//
//struct ContentView: View {
//    @State private var colorCycle = 0.0
//
//    var body: some View {
//        VStack {
//            ColorCyclingCircle(amount: colorCycle)
//                .frame(width: 300, height: 300)
//
//            Slider(value: $colorCycle)
//        }
//    }
//}


// Part 7 - Special effects in SwiftUI: blurs, blending, and more
struct ContentView: View {
//    var body: some View {
//        ZStack {
//            Image("Example")
//                .colorMultiply(.red)
//        }
//    }
    
//    @State private var amount = 0.0
//
//    var body: some View {
//        VStack {
//            ZStack {
//                Circle()
//                    .fill(.red)
//                    .frame(width: 200 * amount)
//                    .offset(x: -50, y: -80)
//                    .blendMode(.screen)
//                Circle()
//                    .fill(.green)
//                    .frame(width: 200 * amount)
//                    .offset(x: 50, y: -80)
//                    .blendMode(.screen)
//                Circle()
//                    .fill(.blue)
//                    .frame(width: 200 * amount)
//                    .blendMode(.screen)
//            }
//            .frame(width: 300, height: 300)
//
//            Slider(value: $amount)
//                .padding()
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(.black)
//        .ignoresSafeArea()
//    }
    
    @State private var amount = 0.0
    
    var body: some View {
        VStack {
            Image("Example")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .saturation(amount)
                .blur(radius: (1 - amount) * 20)
            
            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
