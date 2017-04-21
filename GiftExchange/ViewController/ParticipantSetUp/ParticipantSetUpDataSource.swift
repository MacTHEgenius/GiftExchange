//
//  ParticipantSetUpDataSource.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2017-04-15.
//  Copyright © 2017 Benoît Lévesque. All rights reserved.
//

import Foundation
import UIKit

class ParticipantSetUpDataSource: NSObject {
    
    let controller: ParticipantController
    let participant: Participant?
    
    var firstnameCell: InfoCell?
    var lastnameCell: InfoCell?
    var nipCell: InfoCell?
    
    init(_ tableView: UITableView, controller: ParticipantController) {
        self.controller = controller
        self.participant = controller.participant
        super.init()
        tableView.dataSource = self
    }
    
}

extension ParticipantSetUpDataSource: UITableViewDataSource {
    
    struct Const {
        static let numberOfRowsInNameSection = 3
        static let section = 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Participant infos"
        }
        return "Can pick..."
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Const.section
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == Const.section - 1 {
            return self.controller.parent.participants.count
        }
        return Const.numberOfRowsInNameSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == Const.section - 1 {
            return self.configureCanPickCell(tableView, for: indexPath)
        } else {
            return self.configureCell(tableView, for: indexPath)
        }
    }
    
    private func configureCell(_ tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InfoCell.id, for: indexPath) as! InfoCell
        let director = CellDirector()
        var builder: CellBuildable?
        
        if indexPath.row == 0 {
            builder = FirstnameBuilder(with: cell, and: self.participant?.firstName)
            self.firstnameCell = cell
        } else if indexPath.row == 1 {
            builder = LastnameBuilder(with: cell, and: self.participant?.lastName)
            self.lastnameCell = cell
        } else if indexPath.row == 2 {
            builder = NipBuilder(with: cell, and: self.participant?.nip)
            self.nipCell = cell
        }
        
        return director.build(builder: builder!)
    }
    
    private func configureCanPickCell(_ tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ParticipantCanPickCell.id, for: indexPath) as! ParticipantCanPickCell
        
        let otherParticipant = self.controller.parent.participants[indexPath.row]
        cell.name = otherParticipant.fullname
        if let currentParticipant = self.controller.participant {
            cell.check = currentParticipant.canPick(otherParticipant)
        }
        
        return cell
    }
    
}
