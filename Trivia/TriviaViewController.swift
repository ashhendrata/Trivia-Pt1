//
//  TriviaViewController.swift
//  Trivia
//
//  Created by Ashley Hendrata on 3/12/24.
//

import UIKit

class TriviaViewController: UIViewController {
    
    private var selectedQuestionIndex = 0
    private var questions = [Question]()
    private var score = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        questions = createQuestionLineUp()
        updateUIWithCurrentQuestion()
    }
    
    private func createQuestionLineUp() -> [Question] {
        return [.firstMessageSentByMorseCode, .texasStateFlower, .taylorSwiftFirstChartingSong]
    }
    
    
    @IBOutlet weak var QuestionCount: UILabel!
    @IBOutlet weak var Theme: UILabel!
    @IBOutlet weak var TriviaQuestion: UILabel!
    
    @IBAction func Option1(_ sender: UIButton) {
        let currentQuestion = questions[selectedQuestionIndex]
        checkAnswerAndUpdateScore(selectedOption: currentQuestion.options[0])
    }
    
    @IBOutlet weak var Option1Label: UIButton!
    
    @IBAction func Option2(_ sender: UIButton) {
        let currentQuestion = questions[selectedQuestionIndex]
        checkAnswerAndUpdateScore(selectedOption: currentQuestion.options[1])
    }
    
    @IBOutlet weak var Option2Label: UIButton!
    
    @IBAction func Option3(_ sender: UIButton) {
        let currentQuestion = questions[selectedQuestionIndex]
        checkAnswerAndUpdateScore(selectedOption: currentQuestion.options[2])
    }
    
    @IBOutlet weak var Option3Label: UIButton!
    
    @IBAction func Option4(_ sender: UIButton) {
        let currentQuestion = questions[selectedQuestionIndex]
        checkAnswerAndUpdateScore(selectedOption: currentQuestion.options[3])
    }
    
    @IBOutlet weak var Option4Label: UIButton!
    private func updateUIWithCurrentQuestion() {
        let currentQuestion = questions[selectedQuestionIndex]
        QuestionCount.text = "Question: \(selectedQuestionIndex + 1)/\(questions.count)"
        Theme.text = "Theme: \(currentQuestion.theme)"
        TriviaQuestion.text = currentQuestion.description
        
        
        Option1Label.setTitle(currentQuestion.options[0], for: .normal)
        Option2Label.setTitle(currentQuestion.options[1], for: .normal)
        Option3Label.setTitle(currentQuestion.options[2], for: .normal)
        Option4Label.setTitle(currentQuestion.options[3], for: .normal)
    }
    
    private func checkAnswerAndUpdateScore(selectedOption: String) {
        let currentQuestion = questions[selectedQuestionIndex]
        if selectedOption == currentQuestion.answer {
            score += 1
        }
        selectedQuestionIndex += 1
        if selectedQuestionIndex < questions.count {
            updateUIWithCurrentQuestion()
        } else {
            showScore()
        }
    }

    private func showScore() {
        let alertController = UIAlertController(title: "Game Over", message: "Your final score is \(score)/3", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Restart", style: .default) { _ in
            // Reset the game or perform any other actions if needed
            self.resetGame()
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    private func resetGame() {
        selectedQuestionIndex = 0
        score = 0
        updateUIWithCurrentQuestion()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
