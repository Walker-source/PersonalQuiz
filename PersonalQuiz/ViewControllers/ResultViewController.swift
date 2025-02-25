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
    @IBOutlet private var definitionLabel: UILabel!
    
// MARK: - Public Properties
    var answers: [Answer]!
    
// MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        countAnimals()
        
        navigationItem.hidesBackButton = true
    }
    
// MARK: - IB Actions
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}

// MARK: - Private Methods
private  extension ResultViewController {
    func countAnimals() {
        var frequencyOfAnimals: [Animal: Int] = [:]
        var animals: [Animal] = []
        
        answers.forEach { element in
            animals.append(element.animal)
        }
        
        for animal in animals {
            if let animalTypeCount = frequencyOfAnimals[animal] {
                frequencyOfAnimals
                    .updateValue(animalTypeCount + 1, forKey: animal)
            } else {
                frequencyOfAnimals[animal] = 1
            }
        }
        
        let animalSorted = frequencyOfAnimals.sorted { $0.value > $1.value }
        guard let animal = animalSorted.first?.key else {return}
        
        emojiAnswerLabel.text = String(animal.rawValue)
        definitionLabel.text = animal.definition
    }
}



