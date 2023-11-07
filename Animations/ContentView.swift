import SwiftUI

struct ContentView: View {
    @State private var bounceAmount = 1.0
    @State private var sonarAmount = 1.0
    @State private var rotationAmount = 0.0
    @State private var enableColor = false
    
    var body: some View {
        print(bounceAmount)
        
        return VStack(spacing: 100) {
            colorAnimation
            
//            explicitAnimation
            
//            stepperBindingAnimation
            
//            bouncingButton
//
//            sonarButton
        }
    }
    
    private var colorAnimation: some View {
        Button("Tap Me") {
            enableColor.toggle()
        }
        .padding(50)
        .background(enableColor ? .red : .blue)
        .foregroundStyle(.white)
        .clipShape(RoundedRectangle(cornerRadius: enableColor ? 60 : 0))
        .animation(.default, value: enableColor)
    }
    
    private var explicitAnimation: some View {
        Button("Tap Me") {
            withAnimation(
                .spring(response: 1, dampingFraction: 0.5, blendDuration: 0.5)
            ) {
                rotationAmount += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(rotationAmount), axis: (0, 1, 0))
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
