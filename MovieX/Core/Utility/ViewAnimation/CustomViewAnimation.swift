//
//  CustomViewAnimation.swift
//  MovieX
//
//  Created by Raden Dimas on 26/12/22.
//

import SwiftUI
import Lottie

struct CustomViewAnimation: UIViewRepresentable {
    typealias UIViewType = UIView
    let jsonFile: String
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        let animationView = LottieAnimationView(name: jsonFile)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.backgroundBehavior = .pauseAndRestore
        animationView.play()
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.widthAnchor)
        ])
        return view
    }
    func updateUIView(_ uiView: UIView, context: Context) {}
}
