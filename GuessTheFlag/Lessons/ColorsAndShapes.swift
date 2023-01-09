//
//  Testando.swift
//  GuessTheFlag
//
//  Created by Jonas Agnezi on 13/08/22.
//

import SwiftUI

struct ColorsAndShapes: View {
    var body: some View {
			ZStack {
				VStack(spacing: 0) {
					Color.red
					Color.blue
				}
				
				Text("Your content")
					.foregroundStyle(.secondary)
					.padding(50)
					.background(.ultraThinMaterial)
			}
			.ignoresSafeArea()
    }
}

struct Testando_Previews: PreviewProvider {
    static var previews: some View {
        ColorsAndShapes()
    }
}
