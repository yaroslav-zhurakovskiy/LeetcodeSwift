//
//  TestController.swift
//  LeetcodeSwiftExample
//
//  Created by Yaroslav Zhurakovskiy on 15.12.2019.
//  Copyright © 2019 yaroslavz. All rights reserved.
//

import UIKit
import Leetcode

class TestController: UIViewController {
    @IBOutlet weak var codeInput: UITextView!
    @IBOutlet weak var consoleLabel: UILabel!
    
    var problem: String!
    var question: Int!
    
    private let client = Leetcode()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationItem.title = "\(problem!) #\(question!)"
    }
    
    @IBAction func run() {
        consoleLabel.text = "Submiting..."
        let solution = Solution(
            forProblemWithID: ProblemID(questionID: question, slug: problem),
            code: Code(text: codeInput.text ?? "", lang: .cpp),
            input: .empty,
            judge: .small
        )
        client.testSolution(solution, completion: { [weak self] result in
            switch result {
            case .success(let info):
                DispatchQueue.main.async {
                    if let error = info.compile_error {
                        self?.consoleLabel.text = error
                    } else {
                        self?.consoleLabel.text = "\(info)"
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.consoleLabel.text = "Failed: \(error)"
                }
            }
        })
    }
}
