//
//  FinalViewController.swift
//  TriviaTek
//
//  Created by Amber ÇATALBAŞ on 30.06.2021.
//

import UIKit

class FinalViewController: UIViewController {

    struct Constants {
        static let cornerRadius: CGFloat = 8.0
    }
    // add UI workers
    private let titleLabel: UILabel = {
        
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor.black
       
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont(name: "Helvetica-Bold", size: 32)
        label.text = "Winners get"
        return label
    } ()
    private let prizeLabel: UILabel = {
        
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont(name: "Helvetica-Bold", size: 32)
        label.text = "$ 15.00"
        return label
    } ()
    private let descriptionLabel: UILabel = {
        
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont(name: "Helvetica-Bold", size: 20)
        label.text = "5 players won this game"
        return label
    } ()
    private let winnersLabel: UILabel = {
        
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor.black
        label.backgroundColor = .secondarySystemBackground
        label.textAlignment = .center
        label.numberOfLines = 5
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 22)
        label.text = "I know that I know nothing"
        label.layer.masksToBounds = true
        label.layer.cornerRadius = Constants.cornerRadius
        label.layer.borderWidth = 1.0
        label.layer.borderColor  = UIColor.secondaryLabel.cgColor
        return label
    } ()
    private let againButton: UIButton = {
        
        let button = UIButton()
    
       
        button.titleLabel?.textAlignment = .left
        button.titleLabel?.numberOfLines = 1
        button.setTitle("Do you want to try again?", for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 20)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .green
        button.layer.borderWidth = 1.0
        button.layer.borderColor  = UIColor.secondaryLabel.cgColor
        button.setTitleColor(.black, for: .normal)
        return button
    } ()
    
    var score : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        descriptionLabel.text = "You answered \(score) questions correctly"
        againButton.addTarget(self, action: #selector(again), for: .touchUpInside)
    }
    
    // add Subviews to view
    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(prizeLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(winnersLabel)
        view.addSubview(againButton)

}
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //assign frames
        titleLabel.frame = CGRect(
            x: 10,
            y: view.safeAreaInsets.bottom+30,
            width: view.width-20,
            height: 50.0)
        prizeLabel.frame = CGRect(
            x: 10,
            y: titleLabel.bottom + 5,
            width: view.width-20,
            height: 40.0)
        descriptionLabel.frame = CGRect(
            x: 10,
            y: prizeLabel.bottom + 35,
            width: view.width-20,
            height: 40.0)
        winnersLabel.frame = CGRect(
            x: 10,
            y: descriptionLabel.bottom + 15,
            width: view.width-20,
            height: 160.0)
        againButton.frame = CGRect(
            x: 20,
            y: winnersLabel.bottom + 15,
            width: view.width-40,
            height: 40.0)
    }
    @objc func again() {
        performSegue(withIdentifier: "toQuestionVC", sender: nil)
        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toQuestionVC" {
                let destinationVC = segue.destination as? QuestionViewController
                destinationVC?.score = 0
                destinationVC?.questionNum = 0
            }
        }
    }
        
}

