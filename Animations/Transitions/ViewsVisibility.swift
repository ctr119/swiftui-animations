import SwiftUI

/// This example is about showing and hiding views with transitions
///
/// transition()

struct ViewsVisibility: View {
    @State private var isShowingRed = false
    
    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                    isShowingRed.toggle()
                }
            }
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
    }
}

struct ViewsVisibility_Previews: PreviewProvider {
    static var previews: some View {
        ViewsVisibility()
    }
}
