//
//  ButtonsAndImages.swift
//  GuessTheFlag
//
//  Created by Jonas Agnezi on 13/08/22.
//

import SwiftUI

struct ButtonsAndImages: View {
	var body: some View {
		VStack {
			HStack {
				Button("Button 1") { }
					.buttonStyle(.bordered)
				Button("Button 2", role: .destructive) { }
					.buttonStyle(.bordered)
				Button("Button 3") { }
					.buttonStyle(.borderedProminent)
				Button("Button 4", role: .destructive) { }
					.buttonStyle(.borderedProminent)
			}
			
			HStack {
				Button("Test", action: actionTest)
			}
			
			HStack {
				Button {
					print("Button was tapped!")
				} label: {
					Text("Tap me!")
						.padding()
						.foregroundColor(.white)
						.background(.red)
				}
			}
			
			HStack {
				Image(systemName: "pencil")
				//		.renderingMode(.original) forces swiftUI to show the original color of image
				Button{
					print("Edit button was tapped!")
				} label: {
					Label("Edit", systemImage: "pencil")
				}
			}
		}
	}
	
	func actionTest() -> Void {
		print("Test action")
	}
}

struct ButtonsAndImages_Previews: PreviewProvider {
	static var previews: some View {
		ButtonsAndImages()
	}
}
