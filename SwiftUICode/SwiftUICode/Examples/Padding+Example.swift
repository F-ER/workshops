//
//  Padding+Example.swift
//  SwiftUICode
//
//  Created by Abdullah Alhaider on 15/02/2020.
//  Copyright © 2020 Abdullah Alhaider. All rights reserved.
//

import SwiftUI

struct PaddingExample: View {
    @State private var opacity: Double = 1.0
    var opacityString: String { String(format: "%.1f", opacity) }
    
    var body: some View {
        VStack {
            Image(systemName: "star.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.yellow)
                // .padding(30)
                .opacity(opacity)
                .background(Color.black)
                // .padding(30)
            
            Stepper("Opacity \(opacityString)", value: $opacity, in: 0.0...1.0, step: 0.1)
                .padding()
        }
    }
}

struct PaddingExample_Previews: PreviewProvider {
    static var previews: some View {
        PaddingExample()
    }
}


