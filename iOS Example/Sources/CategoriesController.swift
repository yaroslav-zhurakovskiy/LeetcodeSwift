//
//  Created by Yaroslav Zhurakovskiy
//  Copyright © 2019-2020 Yaroslav Zhurakovskiy. All rights reserved.
//

import UIKit
import Leetcode

class CategoriesController: UITableViewController {
    private let leetcode = Leetcode()
    
    @IBOutlet weak var loginLogoutButton: UIBarButtonItem!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let cell = sender as? UITableViewCell,
            let controller = segue.destination as? ProblemsController
            else {
                return
        }
          
        controller.category = cell.detailTextLabel?.text
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        updateUI()
    }
    
    @IBAction func logInLogOut() {
        if leetcode.isLoggedIn {
            leetcode.logout()
            updateUI()
        } else {
            let controller = LeetcodeLoginConroller()
            controller.didLogin = { [weak self] in
                self?.updateUI()
            }
            present(controller, animated: true, completion: { [weak self] in
                self?.updateUI()
            })
        }
    }
    
    private func updateUI() {
        loginLogoutButton.title = leetcode.isLoggedIn ? "Log Out" : "Log In"
    }
}
