//
//  ContentView.swift
//  MangekyouSharinganAnimation
//
//  Created by Pavel on 9.10.22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ItachiUchiha()
    }
}

struct ItachiUchiha: View {
    @State private var sharingan = false
    var body: some View {
        ZStack {
            Color.red.opacity(1).edgesIgnoringSafeArea(.all)
            
            Image("MangekyouSharingan")
                .resizable()
                .frame(width: 360, height: 360)
                .rotationEffect(.degrees(sharingan ? 180 : -180))
                .offset(x: 0, y: -180)
                .opacity(0.6)
                .onAppear() {
                    withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: false)) {
                        sharingan.toggle()
                    }
                }
            
            Image("Itachi")
                .resizable()
                .offset(x: 0, y: 0)
            
            ParticleSystem()
        }
        .ignoresSafeArea(.all)
    }
}

struct ParticleSystem: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
        let size = CGSize(width: 0.05, height: 0.05)
        let host = UIView(frame: CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height))
        
        let particlesLayer = CAEmitterLayer()
        
        particlesLayer.frame = CGRect(x: 2, y: 2, width: size.width, height: size.height)
        
        host.layer.addSublayer(particlesLayer)
        host.layer.masksToBounds = true
        
        particlesLayer.backgroundColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        
        particlesLayer.emitterShape = .circle
        
        particlesLayer.emitterPosition = CGPoint(x: 509.4, y: 707.7)
        particlesLayer.emitterSize = CGSize(width: 1648.0, height: 1112.0)
        particlesLayer.emitterMode = .surface
        particlesLayer.renderMode = .oldestLast
        let imageParticle = UIImage(named: "Snowflake")?.cgImage
        let snowParticles = CAEmitterCell()
        snowParticles.contents = imageParticle
        snowParticles.name = "Snow"
        snowParticles.birthRate = 92.0
        snowParticles.lifetime = 30
        snowParticles.velocity = 59.0
        snowParticles.velocityRange = -15.0
        snowParticles.xAcceleration = 5.0
        snowParticles.yAcceleration = 40.0
        snowParticles.emissionRange = 180.0 * (.pi / 45)
        snowParticles.spin = -28.6 * (.pi / 180.0)
        snowParticles.spinRange = 57.2 * (.pi / 180.0)
        snowParticles.scale = 0.002
        snowParticles.scaleRange = 0.05
        snowParticles.color = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0).cgColor
        particlesLayer.emitterCells = [snowParticles]
        
        return host
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
