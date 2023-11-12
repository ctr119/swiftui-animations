import SwiftUI

struct CornerRadiusModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(active: CornerRadiusModifier(amount: -90, anchor: .topLeading),
                  identity: CornerRadiusModifier(amount: 0, anchor: .topLeading))
    }
}
