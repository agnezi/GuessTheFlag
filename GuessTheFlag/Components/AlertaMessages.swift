//
//  AlertaMessages.swift
//  GuessTheFlag
//
//  Created by itsjagnezi on 13/08/22.
//

import SwiftUI

struct AlertaMessages: View {
	@State private var showingAlert = false
	
	var body: some View {
		Button("Show Alert") {
			showingAlert = true
		}
		.alert("Important message", isPresented: $showingAlert) {
			// any button inside alert will dismiss the alert
			Button("Delete", role: .destructive) {}
			Button("Cancel", role: .cancel) {}
		} message: {
			Text("Please read this")
		}
	}
}

struct AlertaMessages_Previews: PreviewProvider {
	static var previews: some View {
		AlertaMessages()
	}
}
