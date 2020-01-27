//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    private var storyBrain: StoryBrain!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        start()
    }
    
    @IBAction func choice1Pressed(_ sender: UIButton) {
        nextQuestion(choice: storyBrain.currentStoryStep.choice1)
    }
    
    @IBAction func choice2Pressed(_ sender: UIButton) {
        nextQuestion(choice: storyBrain.currentStoryStep.choice2)
    }
    
    private func start() {
        storyBrain = StoryBrain()
        display(storyStep: storyBrain.currentStoryStep)
    }
    
    private func nextQuestion(choice: Choice) {
        if let nextStoryStep = storyBrain.nextStoryStep(choice: choice) {
            display(storyStep: nextStoryStep)
        } else {
            start()
        }
    }
    
    private func display(storyStep: Story) {
        storyLabel.text = storyStep.title
        choice1Button.setTitle(storyStep.choice1.title, for: .normal)
        choice2Button.setTitle(storyStep.choice2.title, for: .normal)
    }
    
}

