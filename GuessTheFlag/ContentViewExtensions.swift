////
// GuessTheFlag
// Created by: itsjagnezi on 09/01/23
// Copyright (c) today and beyond
//

import Foundation

extension ContentView {
	@MainActor class ViewModel: ObservableObject {
		
		@Published var scoreTitle = ""
		@Published var showingScore = false
		@Published var userScore = 0
		
		@Published var countries = [
			"Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
		
		@Published var correctAnswer = Int.random(in: 0...2)
		
		@Published var attempts = 0
		@Published var showLastAttemptAlert = false
		
		@Published private(set) var labels = [
			"Estonia": "Flag with three horizontal stripes of equal size. Top stripe blue, middle stripe black, bottom stripe white",
			"France": "Flag with three vertical stripes of equal size. Left stripe blue, middle stripe white, right stripe red",
			"Germany": "Flag with three horizontal stripes of equal size. Top stripe black, middle stripe red, bottom stripe gold",
			"Ireland": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe orange",
			"Italy": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe red",
			"Nigeria": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe green",
			"Poland": "Flag with two horizontal stripes of equal size. Top stripe white, bottom stripe red",
			"Russia": "Flag with three horizontal stripes of equal size. Top stripe white, middle stripe blue, bottom stripe red",
			"Spain": "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe gold with a crest on the left, bottom thin stripe red",
			"UK": "Flag with overlapping red and white crosses, both straight and diagonally, on a blue background",
			"US": "Flag with red and white stripes of equal size, with white stars on a blue background in the top-left corner"
		]
		
		
		
		
		//MARK: Animation state properties
		@Published var degrees = 0.0
		@Published var flagIndex = 0
		@Published var opacityAmount = 1.0
		@Published var scaleAmount = 1.0
		
		
		func flagTapped(_ number: Int) {
			flagIndex = number
			if number == correctAnswer {
				scoreTitle = "Correct"
				userScore += 10
			} else {
				scoreTitle = "Wrong! That's the flag of \(countries[number])"
				userScore -= 5
			}
			
			if attempts < 8 {
				attempts += 1
			} else if attempts == 8 {
				showLastAttemptAlert = true
			}
			showingScore = true
		}
		
		func resetAnimationState() {
			degrees = 0
			opacityAmount = 1
			scaleAmount = 1
		}
		
		func shuffle() {
			resetAnimationState()
			countries.shuffle()
			correctAnswer = Int.random(in: 0...2)
		}
		
		func askQuestion() {
			shuffle()
		}
		
		func resetGame() {
			shuffle()
			attempts = 0
			userScore = 0
		}
		
	}
}
