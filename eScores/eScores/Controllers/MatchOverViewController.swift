//
//  MatchOverViewController.swift
//  eScores
//
//  Created by Nikita Gerasimoski on 9/18/19.
//  Copyright © 2019 Nikita Gerasimoski. All rights reserved.
//

import UIKit
import PromiseKit


class MatchOverViewController: UIViewController {
    var matches = [Match]()
    let presenter = MatchOverViewPresenter()
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    var date = Date()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = Date().formatDateForTitle()
        self.presenter.viewController = self
        self.tableView.register(UINib(nibName: Cells.matchTableViewCell, bundle: nil), forCellReuseIdentifier: Cells.matchTableViewCell)
        let footerView = UIView()
        self.tableView.tableFooterView = footerView
        self.tableView.tableFooterView?.backgroundColor = UIColor.darkGray
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter.provideMatchesForGivenDate(date: date)
        
      
    }
    @IBAction func datePickerValueChanged(_ sender: Any) {
        navigationItem.title = datePicker.date.formatDateForTitle()
        self.date = datePicker.date
    }
    func updateUI() {
        self.matches = presenter.matches
        self.tableView.reloadData()
    }
    
    @IBAction func editTapped(_ sender: Any) {
        if self.editButton.title == "Edit" {
            self.tableViewTop.constant = 150
            self.updateViewConstraints()
            self.datePicker.isHidden = false
            self.editButton.title = "Done"
        } else {
            self.tableViewTop.constant = 0
            self.updateViewConstraints()
            self.datePicker.isHidden = true
            self.editButton.title = "Edit"
            self.presenter.provideMatchesForGivenDate(date: date)
        }
    }
    
    @IBOutlet weak var tableViewTop: NSLayoutConstraint!
}

extension MatchOverViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : MatchTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: Cells.matchTableViewCell, for: indexPath) as! MatchTableViewCell
        cell.setUpCellForMatch(match: matches[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
