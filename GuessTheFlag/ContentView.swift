//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Jonas Agnezi on 14/08/22.
//

import SwiftUI

struct ContentView: View {
	
	@StateObject var viewModel = ViewModel()
	
	var body: some View {
		ZStack {
			// MARK: Background
			RadialGradient(stops: [
				.init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
				.init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)], center: .top, startRadius: 200, endRadius: 700)
			.ignoresSafeArea()
			
			VStack {
				//MARK: Title
				Spacer()
				Text("Guess the Flag")
					.font(.largeTitle.bold())
					.foregroundColor(.white)
				
				//MARK: Square
				VStack(spacing: 15) {
					VStack {
						Text("Tap the flag of")
							.foregroundStyle(.secondary)
							.font(.subheadline.weight(.heavy))
						
						Text(viewModel.countries[viewModel.correctAnswer])
							.font(.largeTitle.weight(.semibold))
					}
					
					ForEach(0..<3) { number in
						Button(action: {
							viewModel.flagTapped(number)
							withAnimation {
								viewModel.degrees += 360
								viewModel.opacityAmount = 0.25
								viewModel.scaleAmount = 0.8
							}
						}) {
							FlagImage(country: viewModel.countries[number], label: viewModel.labels[viewModel.countries[number], default: "Unknown flag"])
						}
						.rotation3DEffect(.degrees(viewModel.flagIndex == number ? viewModel.degrees : 0.0), axis: (x:0, y:1, z:0))
						.opacity(viewModel.flagIndex == number ? 1 : viewModel.opacityAmount)
						.scaleEffect(viewModel.flagIndex == number ? 1 : viewModel.scaleAmount)
					}
				}
				.frame(maxWidth: .infinity)
				.padding(.vertical, 20)
				.background(.regularMaterial)
				.clipShape(RoundedRectangle(cornerRadius: 20))
				
				Spacer()
				Spacer()
				//MARK: Score text
				Text("Score: \(viewModel.userScore)")
					.foregroundColor(.white)
					.font(.title.bold())
				
				Spacer()
			}
			.padding()
		}
		.alert(viewModel.scoreTitle, isPresented: $viewModel.showingScore) {
			Button("Continue", action: viewModel.askQuestion)
		} message: {
			Text("Your score is \(viewModel.userScore)")
		}
		.alert("This was the last Attempet", isPresented: $viewModel.showLastAttemptAlert) {
			Button("Restart game", action: viewModel.resetGame)
		}
	}
}

struct StackingUpButtons_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
