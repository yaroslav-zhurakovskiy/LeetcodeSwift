//
//  ProblemsController.swift
//  LeetcodeSwiftExample
//
//  Created by Yaroslav Zhurakovskiy on 16.12.2019.
//  Copyright © 2019 yaroslavz. All rights reserved.
//

import UIKit
import Leetcode

class ProblemsController: UITableViewController {
    private let client = Leetcode()
    
    var category: String!
    private var problems: GetProblemsResponse?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.title = category.capitalized
        
        client.getProblems(forCategory: category) { [weak self] result in
            switch result {
            case .success(let value):
                DispatchQueue.main.async {
                    self?.problems = value
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let problems = problems {
            return problems.stat_status_pairs.count
        } else {
            return 0
        }
    }
    
    var sortedPairs: [GetProblemsResponse.StatStatusPair] {
        var pairs = problems!.stat_status_pairs
        pairs.sort(by: { $0.stat.question_id < $1.stat.question_id })
        return pairs
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
         
        let pair = sortedPairs[indexPath.row]
        let stat = pair.stat
        
        let text = "\(stat.question__title)[\(stat.question__title_slug)]"
        if pair.paid_only {
            cell.textLabel?.text = text + " 🔓"
        } else {
            cell.textLabel?.text = text
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let cell = sender as? UITableViewCell,
            let controller = segue.destination as? TestController,
            let index = tableView.indexPath(for: cell)?.row
            else {
                return
        }
        
        let stat = sortedPairs[index].stat
        
        controller.question = stat.question_id
        controller.problem = stat.question__title_slug
    }
}
