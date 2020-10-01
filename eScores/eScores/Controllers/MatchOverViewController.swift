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
        let vc = UIStoryboard(name: "Onboarding", bundle: nil).instantiateInitialViewController() as! OnBoardingViewController
        vc.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width*0.8, height: self.view.frame.size.height*0.8)
        self.present(vc, animated: true, completion: nil)
        self.navigationItem.title = date.formatDateForTitle()
        self.presenter.viewController = self
        self.setUpTableView()
    }
    
    func setUpTableView() {
        self.tableView.register(UINib(nibName: Cells.matchTableViewCell, bundle: nil), forCellReuseIdentifier: Cells.matchTableViewCell)
        let footerView = UIView()
        self.tableView.tableFooterView = footerView
        self.tableView.tableFooterView?.backgroundColor = UIColor.darkGray
        tableView.separatorColor = .black
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.separatorInset = UIEdgeInsets.zero
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter.viewController = self
        self.presenter.provideMatchesForGivenDate(date: date)
        }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.presenter.viewController = nil
        super.viewWillDisappear(animated)
    }
    
    @IBAction func datePickerValueChanged(_ sender: Any) {
        navigationItem.title = datePicker.date.formatDateForTitle()
        self.date = datePicker.date
    }
    
    func updateUI() {
        self.matches = presenter.matches
        self.navigationItem.title = date.formatDateForTitle()
        self.datePicker.date = date
        self.tableView.reloadData()
        if self.matches.count == 0 {
            let label = UILabel()
            label.textAlignment = NSTextAlignment.center
            label.text = "No matches for the selected date"
            self.tableView.backgroundView = label
        } else {
            let label = UILabel()
            label.text = ""
            self.tableView.backgroundView = label
        }
    }
    
    @IBAction func editTapped(_ sender: Any) {
        if self.editButton.title == "Edit" {
            if #available(iOS 13.0, *) {
                self.editButton.image = UIImage.init(systemName: "checkmark")
            }
            self.tableViewTop.constant = 150
            self.updateViewConstraints()
            self.datePicker.isHidden = false
            self.editButton.title = "Done"
            self.tableView.isUserInteractionEnabled = false
        } else {
            if #available(iOS 13.0, *) {
                self.editButton.image = UIImage.init(systemName: "calendar")
            }
            self.tableViewTop.constant = 0
            self.updateViewConstraints()
            self.datePicker.isHidden = true
            self.editButton.title = "Edit"
            self.tableView.isUserInteractionEnabled = true
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
        return 205
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if matches[indexPath.row].opponents?.count != 2 {
            let alertController = UIAlertController(title: "No Info Available", message: "We do not have information about this match because one or both of the teams have not been announced.", preferredStyle: .alert)
            let action1 = UIAlertAction(title: "Ok", style: .default) { (action:UIAlertAction) in
                self.dismiss(animated: true, completion: nil)
            }
            alertController.addAction(action1)
            self.present(alertController, animated: true, completion: nil)
            return
        }
        let nextVC = UIStoryboard(name:"Main", bundle: nil).instantiateViewController(withIdentifier: "MatchDetailsViewController") as! MatchDetailsViewController
        nextVC.seriesType =   "Best of \(matches[indexPath.row].number_of_games ?? 1)"
        if let cell = tableView.cellForRow(at: indexPath) as? MatchTableViewCell {
            nextVC.headerModel = cell.headerModel
            nextVC.navigationItem.title = matches[indexPath.row].name!
        
       }
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}
