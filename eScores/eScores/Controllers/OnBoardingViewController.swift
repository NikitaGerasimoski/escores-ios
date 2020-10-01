//
//  OnBoardingViewController.swift
//  eScores
//
//  Created by Nikita Gerasimoski on 9/26/19.
//  Copyright © 2019 Nikita Gerasimoski. All rights reserved.
//

import UIKit

class OnBoardingViewController: UIViewController {

    @IBOutlet weak var onBoardingImageVIew: UIImageView!
    var counter = 1
    
    @IBOutlet weak var leftChevronBtn: UIButton!
    
    @IBOutlet weak var rightChevronBtn: UIButton!
    
    @IBOutlet weak var gotItButton: UIButton!
    
    @IBOutlet weak var welcomeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        leftChevronBtn.layer.cornerRadius = 20
        rightChevronBtn.layer.cornerRadius = 20
        gotItButton.layer.cornerRadius = 5;
        self.checkDisAbled()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func leftChevronTapped(_ sender: Any) {
        counter -= 1;
        self.checkDisAbled()
        onBoardingImageVIew.image = UIImage(named: "OnBoarding\(counter)")
        
    }
    @IBAction func rightChevronTapped(_ sender: Any) {
        counter += 1;
        
        self.checkDisAbled()
        onBoardingImageVIew.image = UIImage(named: "OnBoarding\(counter)")
    }
    
    @IBAction func gotItTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    func checkDisAbled() {
        if counter == 3 {
            rightChevronBtn.alpha = 0.3
            rightChevronBtn.isUserInteractionEnabled = false
            gotItButton.isHidden = false
        } else {
            gotItButton.isHidden = true
            rightChevronBtn.alpha = 1
                       rightChevronBtn.isUserInteractionEnabled = true
        }
        if counter == 1 {
            leftChevronBtn.alpha = 0.3
            leftChevronBtn.isUserInteractionEnabled = false
            welcomeLabel.isHidden = false
        } else {
            leftChevronBtn.alpha = 1
            leftChevronBtn.isUserInteractionEnabled = true
            welcomeLabel.isHidden = true
        }
    }
}
