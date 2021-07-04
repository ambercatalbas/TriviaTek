//
//  ViewController.swift
//  TriviaTek
//
//  Created by Amber ÇATALBAŞ on 29.06.2021.
//
import UIKit

class QuestionViewController: UIViewController {
  
  
  struct Constants {
    static let cornerRadius: CGFloat = 8.0
  }
  
  // add UI workers
  private let questionNumberNameLabel: UILabel = {
    
    let label = UILabel()
    label.lineBreakMode = .byWordWrapping
    label.textColor = UIColor.black
    label.textAlignment = .center
    label.numberOfLines = 1
    label.font = UIFont(name: "Helvetica-Bold", size: 20)
    label.text = "Question Num"
    
    return label
  } ()
  private let questionNumberLabel: UILabel = {
    
    let label = UILabel()
    label.lineBreakMode = .byWordWrapping
    label.textColor = UIColor.black
    label.textAlignment = .center
    label.numberOfLines = 1
    label.font = UIFont(name: "Helvetica-Bold", size: 22)
    label.text = "1/10"
    return label
  } ()
  private let wildCardNumberNameLabel: UILabel = {
    
    let label = UILabel()
    label.lineBreakMode = .byWordWrapping
    label.textColor = UIColor.black
    label.textAlignment = .center
    label.numberOfLines = 1
    label.font = UIFont(name: "Helvetica-Bold", size: 20)
    label.text = "Wild Card Num"
    return label
  } ()
  private let wildCardNumberLabel: UILabel = {
    
    let label = UILabel()
    label.lineBreakMode = .byWordWrapping
    label.textColor = UIColor.black
    label.textAlignment = .center
    label.numberOfLines = 1
    label.font = UIFont(name: "Helvetica-Bold", size: 22)
    return label
  } ()
  
  private let questionDescriptionNameLabel: UILabel = {
    
    let label = UILabel()
    label.lineBreakMode = .byWordWrapping
    label.textColor = UIColor.black
    label.textAlignment = .center
    label.numberOfLines = 1
    label.font = UIFont(name: "Helvetica-Bold", size: 20)
    label.text = "Question"
    return label
  } ()
  private var questionDescriptionLabel: UILabel = {
    
    let label = UILabel()
    label.lineBreakMode = .byWordWrapping
    label.textColor = UIColor.black
    label.textAlignment = .justified
    label.numberOfLines = 3
    label.font = UIFont(name: "Helvetica-Bold", size: 20)
    label.text = "question description question description question description question description?"
    label.layer.masksToBounds = true
    label.layer.cornerRadius = Constants.cornerRadius
    label.backgroundColor = .secondarySystemBackground
    label.layer.borderWidth = 1.0
    label.layer.borderColor  = UIColor.secondaryLabel.cgColor
    
    
    return label
  } ()
  
  private let answersNameLabel: UILabel = {
    
    let label = UILabel()
    label.lineBreakMode = .byWordWrapping
    label.textColor = UIColor.black
    label.textAlignment = .center
    label.numberOfLines = 1
    label.font = UIFont(name: "Helvetica-Bold", size: 20)
    label.text = "Answers"
    return label
  } ()
  private let optionAButton: UIButton = {
    
    let button = UIButton()
    button.setTitle("option", for: .normal)
    button.titleLabel?.numberOfLines = 1
    button.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 20)
    button.layer.masksToBounds = true
    button.layer.cornerRadius = Constants.cornerRadius
    button.backgroundColor = .secondarySystemBackground
    button.layer.borderWidth = 1.0
    button.layer.borderColor  = UIColor.secondaryLabel.cgColor
    button.setTitleColor(.black, for: .normal)
    return button
  } ()
  private let optionBButton: UIButton = {
    
    let button = UIButton()
    button.titleLabel?.numberOfLines = 1
    button.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 20)
    button.layer.masksToBounds = true
    button.layer.cornerRadius = Constants.cornerRadius
    button.backgroundColor = .secondarySystemBackground
    button.layer.borderWidth = 1.0
    button.layer.borderColor  = UIColor.secondaryLabel.cgColor
    button.setTitleColor(.black, for: .normal)
    
    return button
  } ()
  private let optionCButton: UIButton = {
    
    let button = UIButton()
    
    
    button.titleLabel?.textAlignment = .left
    button.titleLabel?.numberOfLines = 1
    button.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 20)
    button.layer.masksToBounds = true
    button.layer.cornerRadius = Constants.cornerRadius
    button.backgroundColor = .secondarySystemBackground
    button.layer.borderWidth = 1.0
    button.layer.borderColor  = UIColor.secondaryLabel.cgColor
    button.setTitleColor(.black, for: .normal)
    return button
  } ()
  private let optionDButton: UIButton = {
    
    let button = UIButton()
    
    
    button.titleLabel?.textAlignment = .left
    button.titleLabel?.numberOfLines = 1
    button.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 20)
    button.layer.masksToBounds = true
    button.layer.cornerRadius = Constants.cornerRadius
    button.backgroundColor = .secondarySystemBackground
    button.layer.borderWidth = 1.0
    button.layer.borderColor  = UIColor.secondaryLabel.cgColor
    button.setTitleColor(.black, for: .normal)
    return button
  } ()
  // variables
  var correctOption: String = ""
  var questionNum: Int = 0
  var score: Int = 0
  var wildCardNum : Int = 0
  
  private var questionListViewModel: QuestionListViewModel!
  private var triviaViewModel: TriviaViewModel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // main func
    getWildCard()
    getData()
    
    addSubviews()
    
    // bind func to options
    addTarget()
    
  }
  private func addTarget() {
    optionAButton.addTarget(self,
                            action: #selector(questioning(optionButtonName:)),
                            for: .touchUpInside)
    
    optionBButton.addTarget(self,
                            action: #selector(questioning(optionButtonName:)),
                            for: .touchUpInside)
    optionCButton.addTarget(self,
                            action: #selector(questioning(optionButtonName:)),
                            for: .touchUpInside)
    optionDButton.addTarget(self,
                            action: #selector(questioning(optionButtonName:)),
                            for: .touchUpInside)
    
  }
  // wild card
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(true)
    
  }
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    //assign frames
    questionNumberNameLabel.frame = CGRect(
      x: 10,
      y: view.safeAreaInsets.bottom+20,
      width: (view.width-30)/2,
      height: 40.0)
    questionNumberLabel.frame = CGRect(
      x: 10,
      y: questionNumberNameLabel.bottom + 5,
      width: (view.width-30)/2,
      height: 40.0)
    wildCardNumberNameLabel.frame = CGRect(
      x: (view.width-30)/2+20,
      y: view.safeAreaInsets.bottom+20,
      width: (view.width-30)/2,
      height: 40.0)
    wildCardNumberLabel.frame = CGRect(
      x: (view.width-30)/2+20,
      y: wildCardNumberNameLabel.bottom + 5,
      width: (view.width-30)/2,
      height: 40.0)
    questionDescriptionNameLabel.frame = CGRect(
      x: 20,
      y: wildCardNumberLabel.bottom + 10,
      width: view.width-40,
      height: 40.0)
    questionDescriptionLabel.frame = CGRect(
      x: 20,
      y: questionDescriptionNameLabel.bottom + 5,
      width: view.width-40,
      height: 104.0)
    answersNameLabel.frame = CGRect(
      x: 20,
      y: questionDescriptionLabel.bottom + 10,
      width: view.width-40,
      height: 40.0)
    
    optionAButton.frame = CGRect(
      x: 20,
      y: answersNameLabel.bottom + 5,
      width: view.width-40,
      height: 40.0)
    optionBButton.frame = CGRect(
      x: 20,
      y: optionAButton.bottom + 5,
      width: view.width-40,
      height: 40.0)
    optionCButton.frame = CGRect(
      x: 20,
      y: optionBButton.bottom + 5,
      width: view.width-40,
      height: 40.0)
    optionDButton.frame = CGRect(
      x: 20,
      y: optionCButton.bottom + 5,
      width: view.width-40,
      height: 40.0)
    
    
  }
  // add Subviews to view
  private func addSubviews() {
    view.addSubview(questionNumberLabel)
    view.addSubview(questionNumberNameLabel)
    view.addSubview(wildCardNumberLabel)
    view.addSubview(wildCardNumberNameLabel)
    view.addSubview(questionDescriptionNameLabel)
    view.addSubview(questionDescriptionLabel)
    view.addSubview(answersNameLabel)
    view.addSubview(optionAButton)
    view.addSubview(optionBButton)
    view.addSubview(optionCButton)
    view.addSubview(optionDButton)
  }
  
  // option functions
  
  @objc func questioning(optionButtonName: UIButton) {
    if optionButtonName.titleLabel?.text == correctOption {
      optionButtonName.backgroundColor = .green
      score += 1
      
      if questionNum < questionListViewModel.countQuestions()-1{
        questionNum += 1
        enabledOption(isenabled: false)
        // add deadline
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
          self.getData()
          self.secondarySystemBackground()
          self.enabledOption(isenabled: true)
        }
      } else {
        performSegue(withIdentifier: "toFinalVC", sender: nil)
      }
      
      
    } else {
      
      optionButtonName.backgroundColor = .red
      if wildCardNum > 0 {
        makeAlert(title: "Hurry!", message: "Time is running out, use a wild card!")
      } else {
        performSegue(withIdentifier: "toFinalVC", sender: nil)
      }
      
      
    }
  }
  
  
  // change to option background color
  private func secondarySystemBackground () {
    self.optionAButton.backgroundColor = .secondarySystemBackground
    self.optionBButton.backgroundColor = .secondarySystemBackground
    self.optionCButton.backgroundColor = .secondarySystemBackground
    self.optionDButton.backgroundColor = .secondarySystemBackground
  }
  // get data func
  
  private func getData() {
    
    guard let path = Bundle.main.path(forResource: "question", ofType: "json") else {return}
    
    let url = URL(fileURLWithPath: path)
    Webservice().downloadQuestions(url: url) { triviaData in
      
      if let triviaData =  triviaData {
        
        let questions = triviaData.questions
        self.questionListViewModel = QuestionListViewModel(questionlist: questions)
        
        DispatchQueue.main.async {
          // self.wildCardNumberLabel.text = String(self.triviaViewModel.wildCards)
          let questionListViewModell = self.questionListViewModel.questionAtIndex(self.questionNum)
          
          self.questionDescriptionLabel.text = questionListViewModell.questionDescription
          self.questionNumberLabel.text = questionListViewModell.questionNumber
          self.optionAButton.setTitle(questionListViewModell.optionA, for: .normal)
          self.optionBButton.setTitle(questionListViewModell.optionB, for: .normal)
          self.optionCButton.setTitle(questionListViewModell.optionC, for: .normal)
          self.optionDButton.setTitle(questionListViewModell.optionD, for: .normal)
          self.correctOption = questionListViewModell.correctOption
          
          
          
        }
      }
    }
    
    
  }
  
  func makeAlert(title: String, message: String) {
    
    // create the alert
    let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
    
    // add the actions (buttons)
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { action in
      if self.wildCardNum > 0 {
        self.wildCardNum -= 1
        self.wildCardNumberLabel.text = String(self.wildCardNum)
        
      } else {
        self.performSegue(withIdentifier: "toFinalVC", sender: nil)
      }
      
      
      
    }))
    alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.cancel, handler: { action in
      
      self.performSegue(withIdentifier: "toFinalVC", sender: nil)
      
    }))
    
    // show the alert
    self.present(alert, animated: true, completion: nil)
    
  }
  // carry the score to FinalViewController
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "toFinalVC" {
      let destinationVC = segue.destination as? FinalViewController
      destinationVC?.score = score
    }
  }
  private func enabledOption(isenabled: Bool) {
    optionAButton.isEnabled = isenabled
    optionBButton.isEnabled = isenabled
    optionCButton.isEnabled = isenabled
    optionDButton.isEnabled = isenabled
  }
  
  
  func getWildCard(){
    guard let path = Bundle.main.path(forResource: "question", ofType: "json") else {return}
    
    let url = URL(fileURLWithPath: path)
    Webservice().downloadQuestions(url: url) { triviaData in
      
      if let triviaData =  triviaData {
        DispatchQueue.main.async {
          self.wildCardNumberLabel.text = String(triviaData.wildCards)
          self.wildCardNum = triviaData.wildCards
          
        }
        
        
      }
    }
    
  }
}




