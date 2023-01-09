//
//  FlagImage.swift
//  GuessTheFlag
//
//  Created by Jonas Agnezi on 18/08/22.
//

import SwiftUI

struct FlagImage: View {
	
	var country: String
	var label: String
	
	var body: some View {
		Image(country)
			.renderingMode(.original)
			.clipShape(Capsule())
			.shadow(radius: 5)
			.accessibilityLabel(label)
	}
}

struct FlagImage_Previews: PreviewProvider {
	static var previews: some View {
		FlagImage(country: "Germany")
	}
}
