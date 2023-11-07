import SwiftUI

struct ContentView: View {
    @State private var bounceAmount = 1.0
    @State private var sonarAmount = 1.0
    
    var body: some View {
        print(bounceAmount)
        
        return VStack(spacing: 100) {
            stepperBindingAnimation
            
//            bouncingButton
//
//            sonarButton
        }
    }
    
    private var stepperBindingAnimation: some View {
        VStack {
            Stepper("Scale amount",
                    value: $bounceAmount.animation(
                        .easeInOut(duration: 1)
                                .repeatCount(3, autoreverses: true)
                    ),
                    in: 1...10)
            
            Spacer()
            
            mainButton
                .scaleEffect(bounceAmount)
        }
    }
    
    private var bouncingButton: some View {
        mainButton
            .scaleEffect(bounceAmount)
            .animation(.spring(response: 0.33, dampingFraction: 0.33, blendDuration: 0.5),
                       value: bounceAmount)
    }
    
    private var sonarButton: some View {
        mainButton
            .overlay {
                Circle()
                    .stroke(.red)
                    .scaleEffect(sonarAmount)
                    .opacity(2 - sonarAmount)
                    .animation(.easeInOut(duration: 1).repeatForever(autoreverses: false),
                               value: sonarAmount)
            }
            .onAppear {
                sonarAmount = 2
            }
    }
    
    private var mainButton: some View {
        Button("Tap Me") {
            bounceAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(Circle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
