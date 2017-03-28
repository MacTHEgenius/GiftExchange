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
			var randomIndex = Int(arc4random_uniform(UInt32(self.participants.count)))
			var participantPicked = self.participants[randomIndex]
			print("\(participant) picked \(participantPicked)")
			print("Can't pick \(participantPicked) : \(participant.cantPicked(participantPicked)) - \(participant.cantPicked.contains(participantPicked.fullname))")
			print(participant.cantPicked)
			
			while participant.cantPicked(participantPicked) {
				if self.participants.count > 1 {
					var newIndex: Int
					repeat {
						newIndex = Int(arc4random_uniform(UInt32(self.participants.count)))
					} while newIndex == randomIndex
					participantPicked = self.participants[newIndex]
					randomIndex = newIndex
				} else {
					print("count to 1")
					let dispatchAsArray = Array(dispatch)
					var (alreadyDispatch, alreadyPicked): (Participant, Participant)
					var index = 0
					repeat {
						(alreadyDispatch, alreadyPicked) = dispatchAsArray[index]
						index += 1
					} while participant.cantPicked(alreadyPicked) && index < dispatchAsArray.count
					dispatch[alreadyDispatch] = participantPicked
					dispatch[participant] = alreadyPicked
//					self.participants.removeLast()
					print(dispatch)
					randomIndex = index
					break
				}
			}
			
			
			///*
//			if participant.cantPicked(participantPicked) {
//				print("wrong !")
//				if self.participants.count == 1 {
//				}
//				var newIndex: Int
//				repeat {
//					newIndex = Int(arc4random_uniform(UInt32(self.participants.count)))
//					print("Can't pick \(self.participants[newIndex]) : \(participant.cantPicked(self.participants[newIndex]))")
//					if participant.cantPicked(self.participants[newIndex]) {
//						print("nope !")
//						newIndex = randomIndex
//					} else {
//						participantPicked = self.participants[newIndex]
//						print("yes !")
//					}
//				} while randomIndex == newIndex
//				randomIndex = newIndex
//			}
			//*/
			
			
			dispatch[participant] = participantPicked
			participantPicked.chosen = true
			print("\(participant) picked \(participantPicked)")
			self.participants.remove(at: randomIndex)
		}
		
		return dispatch
	}
	
}

class Participant: NSObject {
	
	var firstName: String
	var lastName: String?
	var nip: String?
	var chosen: Bool
	var cantPicked: [String] = []
	
	var fullname: String {
		if let lastName = self.lastName {
			return "\(self.firstName) \(lastName)"
		} else {
			return self.firstName
		}
	}
	
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
	
	init(withFirstName fname: String, lastName: String = "", NIP: String?) {
		self.firstName = fname
		self.lastName = lastName
		self.nip = NIP
		self.chosen = false
		if lastName.isEmpty {
			self.lastName = nil
		}
	}
	
	required init(coder aDecoder: NSCoder) {
		self.firstName = ""
		self.lastName = nil
		self.nip = ""
		self.chosen = false
		
		if let fname = aDecoder.decodeObject(forKey: "firstName") as? String {
			self.firstName = fname
		}
		
		if let lname = aDecoder.decodeObject(forKey: "lastName") as? String? {
			self.lastName = lname
		}
		
		if let nip = aDecoder.decodeObject(forKey: "nip") as? String {
			self.nip = nip
		}
		
		if let cantPicked = aDecoder.decodeObject(forKey: "cantPicked") as? [String] {
			self.cantPicked = cantPicked
		}
		
		self.chosen = aDecoder.decodeBool(forKey: "chosen")
	}
	
	func encodeWithCoder(_ aCoder: NSCoder) {
		aCoder.encode(self.firstName, forKey: "firstName")
		aCoder.encode(self.lastName, forKey: "lastName")
		aCoder.encode(self.nip, forKey: "nip")
		aCoder.encode(self.cantPicked, forKey: "cantPicked")
		aCoder.encode(self.chosen, forKey: "chosen")
	}
	
	func cantPicked(_ participant: Participant) -> Bool {
		return self.cantPicked.contains(participant.fullname)
	}
	
}

func ==(lhs: Participant, rhs: Participant) -> Bool {
	return lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName
}
