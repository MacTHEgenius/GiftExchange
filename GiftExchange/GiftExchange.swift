//
//  GiftExchange.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2016-07-27.
//  Copyright © 2016 Benoît Lévesque. All rights reserved.
//

import Foundation

class Exchange {
	
	var participants: [Participant] = []
	
	func roll() -> [Participant: Participant] {
		var dispatch = [Participant: Participant]()
		
		for participant in self.participants {
			if !participant.chosen {
				var randomIndex = Int(arc4random_uniform(UInt32(self.participants.count)))
				var participantPicked = self.participants[randomIndex]
				if participantPicked == participant {
					print("Same ! (\(participant.description))")
					print(self.participants)
					print(randomIndex)
					if self.participants.count == 1 {
						print("Count to 1!")
						break
					}
					var newIndex: Int
					repeat {
						newIndex = Int(arc4random_uniform(UInt32(self.participants.count)))
						participantPicked = self.participants[newIndex]
						print(participantPicked)
						print(newIndex)
						print("\n")
					} while randomIndex == newIndex
					randomIndex = newIndex
				}
				dispatch[participant] = participantPicked
				self.participants.removeAtIndex(randomIndex)
			}
		}
		
		if self.participants.isEmpty {
			print("All good !")
		} else {
			print("Bad news...")
		}
		
		return dispatch
	}
	
}

class Participant: NSObject {
	
	var firstName: String
	var lastName: String?
	var chosen: Bool
	
	override var description: String {
		var lname: String = ""
		if let lastName = self.lastName {
			lname = lastName
		}
		return self.firstName + " " + lname
	}
	
	override var hashValue: Int {
		var hashValue: Int = "\(self.firstName), \(chosen)".hashValue
		if let lname = self.lastName {
			hashValue = "\(self.firstName) \(lname), \(chosen)".hashValue
		}
		return hashValue
	}
	
	init(withFirstName fname: String, lastName: String = "") {
		self.firstName = fname
		self.lastName = lastName
		self.chosen = false
		if lastName.isEmpty {
			self.lastName = nil
		}
	}
	
}

func ==(lhs: Participant, rhs: Participant) -> Bool {
	return lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName
}
