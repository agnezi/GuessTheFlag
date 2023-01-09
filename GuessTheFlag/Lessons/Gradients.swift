//
//  Gradients.swift
//  GuessTheFlag
//
//  Created by Jonas Agnezi on 13/08/22.
//

import SwiftUI

struct Gradients: View {
	var body: some View {
		ZStack {
			Color.primary
			HStack {
				VStack{
					LinearGradient(colors: [.red,.blue], startPoint: .top, endPoint: .bottom)
					
					LinearGradient(stops: [
						.init(color: .red, location: 0.45),
						.init(color: .blue, location: 0.55)
					], startPoint: .top, endPoint: .bottom)
				}
				
				VStack {
					RadialGradient(colors: [.red, .blue], center: .center, startRadius: 20, endRadius: 200)
					
					RadialGradient(stops: [
						.init(color: .red, location: 0.45),
						.init(color: .blue, location: 0.55)
					], center: .center, startRadius: 20, endRadius: 200)
				}
				
				VStack {
					AngularGradient(gradient: Gradient(
						colors: [
							.red, .yellow, .green, .blue, .purple, .red
						]), center: .center)
				}
			}
		}
		.ignoresSafeArea()
	}
}

struct Gradients_Previews: PreviewProvider {
	static var previews: some View {
		Gradients()
	}
}
