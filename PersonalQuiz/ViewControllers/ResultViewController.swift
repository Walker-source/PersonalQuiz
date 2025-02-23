//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 10.02.2025.
//

import UIKit

final class ResultViewController: UIViewController {
// MARK: - IB Outlets
    @IBOutlet private var emojiAnswerLabel: UILabel!
    @IBOutlet private var textAnimalLabel: UILabel!
// MARK: - Public Properties
    var answers: [Answer]!
    
// MARK: - Private Properties
    private var answerEmoji = ""
    private var answerText: String {
        switch animalAnswer {
        case .dog:
            "Вы собака"
        case .cat:
            "Вы кот"
        case .turtle:
            "Вы черепаха"
        case .rabbit:
            "Вы кролик"
        case .none:
            ""
        }
    }
    private var animals: [Animal] = []
    private var animalAnswer: Animal!
    
// MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        animals = getAnimals(From: answers)
        animalAnswer = countAnimals(In: animals)
        
        emojiAnswerLabel.text = "Вы - \(animalAnswer.rawValue)"
        textAnimalLabel.text = answerText
        
        navigationItem.hidesBackButton = true
    }
    
// MARK: - IB Actions
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}

// MARK: - Private Methods
private func getAnimals(From answers: [Answer]) -> [Animal] {
    var animals: [Animal] = []
    
    answers.forEach { element in
        animals.append(element.animal)
    }
    return animals
}

private func countAnimals(In animals: [Animal]) -> Animal {
    var dog = 0
    var cat = 0
    var turtle = 0
    var rabbit = 0
    var animal = Animal.dog
    
    animals.forEach { element in
        switch element {
        case .dog:
            dog += 1
        case .cat:
            cat += 1
        case .turtle:
            turtle += 1
        default:
            rabbit += 1
        }
    }
    
    if dog >= 2 {
        animal = Animal.dog
    } else if cat >= 2 {
        animal = Animal.cat
    } else if turtle >= 2 {
        animal = Animal.turtle
    } else if rabbit >= 2 {
        animal = Animal.rabbit
    }
    return animal
}


