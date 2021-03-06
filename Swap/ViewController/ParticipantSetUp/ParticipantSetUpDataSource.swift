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
    var nipConfirmationCell: InfoCell?
    
    init(_ tableView: UITableView, controller: ParticipantController) {
        self.controller = controller
        self.participant = controller.participant
        super.init()
        tableView.dataSource = self
    }
    
}

extension ParticipantSetUpDataSource: UITableViewDataSource {
    
    struct Const {
        static let numberOfRowsInNameSection = 4
        static let section = 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "infos".localized
        }
        return "cant_pick".localized
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
            return self.configureCantPickCell(tableView, for: indexPath)
        } else {
            return self.configureCell(tableView, for: indexPath)
        }
    }
    
    private func configureCell(_ tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InfoCell.id, for: indexPath) as! InfoCell
        let director = CellDirector()
        var builder: CellBuildable?
        
        switch indexPath.row {
        case 0:
            builder = FirstnameBuilder(with: cell, and: self.participant?.firstName)
            self.firstnameCell = cell
        case 1:
            builder = LastnameBuilder(with: cell, and: self.participant?.lastName)
            self.lastnameCell = cell
        case 2:
            builder = NipBuilder(with: cell, and: self.participant?.nip)
            self.nipCell = cell
        case 3:
            builder = NipBuilder(with: cell, and: self.participant?.nip, confirmation: true)
            self.nipConfirmationCell = cell
        default: break
        }
        
        return director.build(builder: builder!)
    }
    
    private func configureCantPickCell(_ tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ParticipantCantPickCell.id, for: indexPath) as! ParticipantCantPickCell
        
        let otherParticipant = self.controller.parent.participants[indexPath.row]
        cell.name = otherParticipant.fullname
        if let currentParticipant = self.controller.participant {
            cell.check = !currentParticipant.canPick(otherParticipant)
            if currentParticipant.id == otherParticipant.id {
                cell.selectionStyle = .none
            }
        }
        
        return cell
    }
    
}
