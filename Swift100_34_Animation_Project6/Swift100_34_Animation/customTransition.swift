////
////  customTransition.swift
////  Swift100_34_Animation
////
////  Created by Zaiyuan Xiao on 2023/2/8.
////
//
//import SwiftUI
//
//struct CornerRotateModifier: ViewModifier {
//    let amount: Double
//    let anchor: UnitPoint
//    
//    func body(content: Content) -> some View {
//        content
//            .rotationEffect(.degrees(amount), anchor: anchor)
//            .clipped()
//    }
//}
//
//extension AnyTransition {
//    static var pivot: AnyTransition {
//        .modifier(
//            active: CornerRotateModifier(amount: -180, anchor: .topLeading),
//            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
//        )
//    }
//}
//
////
////struct TransitionsContentView: View {
////    @State private var isShowingRed = false
////
////    var body: some View {
////        VStack {
////            Button("Tap Me") {
////                withAnimation {
////                    self.isShowingRed.toggle()
////                }
////            }
////
////            if isShowingRed {
////                Rectangle()
////                    .fill(Color.red)
////                    .frame(width: 200, height: 200)
////                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
////            }
////        }
////    }
////}
//
////struct customTransition: View {
////    @State private var isShowingRed = false
////
////    var body: some View {
////
////        ZStack {
////            Rectangle()
////                .fill(.blue)
////                .frame(width: 200, height: 200)
////
////            if isShowingRed {
////                Rectangle()
////                    .fill(.red)
////                    .frame(width: 200, height: 200)
////                    .transition(.pivot)
////            }
////        }
////        .onTapGesture {
////            withAnimation {
////                isShowingRed.toggle()
////            }
////        }
////    }
////
////
////}
//
//struct customTransition_Previews: PreviewProvider {
////    static var previews: some View {
//        CornerRotateModifier()
//    }
//}
