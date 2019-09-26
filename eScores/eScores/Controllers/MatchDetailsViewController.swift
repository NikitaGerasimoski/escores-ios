//
//  MatchDetailsViewController.swift
//  eScores
//
//  Created by Nikita Gerasimoski on 9/25/19.
//  Copyright © 2019 Nikita Gerasimoski. All rights reserved.
//

import UIKit

class MatchDetailsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var headerModel = DetailsHeaderModel()
    var firstTeamPlayers = [Player]()
    var secondTeamPlayer = [Player]()
    var presenter = MatchDetailsPresenter()
    var seriesType: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpTableView()
        self.presenter.viewController = self
        self.presenter.getFirstTeamPlayers(id: headerModel.firstTeamId)
        self.presenter.getSecondTeamPlayers(id: headerModel.secondTeamId)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter.viewController = self
    }
    func setUpTableView(){
        self.tableView.register(UINib(nibName: Cells.matchDetailsHeader, bundle: nil), forCellReuseIdentifier: Cells.matchDetailsHeader)
        self.tableView.register(UINib(nibName: Cells.twoPlayersTableViewCell, bundle: nil), forCellReuseIdentifier: Cells.twoPlayersTableViewCell)
        self.tableView.register(UINib(nibName: Cells.gameTableViewCell, bundle: nil), forCellReuseIdentifier: Cells.gameTableViewCell)
        self.tableView.tableFooterView = UIView()
        self.tableView.separatorInset = UIEdgeInsets.zero
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.presenter.viewController = nil
        super.viewWillDisappear(animated)
    }

    func updateUI() {
        self.firstTeamPlayers = self.presenter.firstTeamPlayers
        self.secondTeamPlayer = self.presenter.secondTeamPlayer
        self.tableView.reloadData()
    }

}

extension MatchDetailsViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if firstTeamPlayers.count == 0 || secondTeamPlayer.count == 0 {
            return 0;
        }
        var numberOfPlayers = firstTeamPlayers.count < secondTeamPlayer.count ? secondTeamPlayer.count : firstTeamPlayers.count
        if numberOfPlayers > 7 {
            numberOfPlayers = 7
        }
        return 1 + numberOfPlayers + headerModel.games.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var numberOfPlayers = firstTeamPlayers.count < secondTeamPlayer.count ? secondTeamPlayer.count : firstTeamPlayers.count
        if numberOfPlayers > 7 {
            numberOfPlayers = 7
        }
        switch indexPath.row {
        case 0:
            let cell =  tableView.dequeueReusableCell(withIdentifier: Cells.matchDetailsHeader, for: indexPath) as! MatchDetailsTableViewCell
            cell.setUp(with: headerModel)
            cell.seriesTypeLabel.text = self.seriesType
            return cell
        case 1...numberOfPlayers:
            let cell = tableView.dequeueReusableCell(withIdentifier: Cells.twoPlayersTableViewCell, for: indexPath) as! TwoPlayersTableViewCell
            var firstPlayer: Player?
            var secondPlayer: Player?
            if indexPath.row > firstTeamPlayers.count {
                firstPlayer = nil
            } else {
                firstPlayer = firstTeamPlayers[indexPath.row-1]
            }
            if indexPath.row > secondTeamPlayer.count {
                secondPlayer = nil
            } else {
                secondPlayer = secondTeamPlayer[indexPath.row-1]
            }
            cell.setUpWith(firstPlayer: firstPlayer
               , secondPlayer: secondPlayer)
            return cell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: Cells.gameTableViewCell, for: indexPath) as! GameTableViewCell
            cell.firstTeamImg.image = headerModel.firstTeamLogoImage
            cell.secondTeamImg.image = headerModel.secondTeamLogoImage
            if headerModel.games[indexPath.row - 1 - numberOfPlayers].finished == false {
                cell.firstTeamImg.isHidden = true
                cell.secondTeamImg.isHidden = true
                cell.gameLabel.isHidden = true
                cell.scoreLabel.text = "Game has not started yet"
            } else {
                cell.scoreLabel.text = "15:12"
                cell.gameLabel.text = "Game \(headerModel.games[indexPath.row-1 - numberOfPlayers].position ?? 1)"
                if headerModel.games[indexPath.row - 1 - numberOfPlayers].winner?.id == headerModel.firstTeamId {
                    cell.secondTeamImg.alpha = 0.3
                    cell.firstTeamWIn.isHidden = false
                    cell.secondTeamWin.isHidden = true
                    
                } else {
                    cell.firstTeamImg.alpha = 0.3
                    cell.firstTeamWIn.isHidden = true
                    cell.secondTeamWin.isHidden = false
                }
                
            }
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let numberOfPlayers = firstTeamPlayers.count < secondTeamPlayer.count ? secondTeamPlayer.count : firstTeamPlayers.count
        switch indexPath.row {
        case 0:
            return 200
        case 1...numberOfPlayers:
            return 50
        default:
            return 80
        }
    }
    
    
}
