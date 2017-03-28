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
