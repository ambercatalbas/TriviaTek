//
//  FinalViewController.swift
//  TriviaTek
//
//  Created by Amber ÇATALBAŞ on 30.06.2021.
//

import UIKit

class FinalViewController: UIViewController {

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
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont(name: "Helvetica-Bold", size: 32)
        label.text = "& 15.00"
        return label
    } ()
    private let descriptionLabel: UILabel = {
        
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont(name: "Helvetica-Bold", size: 22)
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
        label.font = UIFont(name: "Helvetica-Bold", size: 22)
        label.text = "Mustafa Kemal Atatürk, Mustafa Kemal Atatürk, Mustafa Kemal Atatürk, Mustafa Kemal Atatürk, Mustafa Kemal Atatürk"
        label.backgroundColor = .secondarySystemBackground
        label.layer.borderWidth = 1.0
        label.layer.borderColor  = UIColor.secondaryLabel.cgColor
        return label
    } ()
    var score : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        descriptionLabel.text = "\(score) soruyu doğru cevapladınız"
    }
    

    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(prizeLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(winnersLabel)

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
        
}
}
