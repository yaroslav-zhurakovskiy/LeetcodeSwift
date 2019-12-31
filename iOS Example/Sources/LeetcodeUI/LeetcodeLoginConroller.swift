//
//  Created by Yaroslav Zhurakovskiy
//  Copyright © 2019-2020 Yaroslav Zhurakovskiy. All rights reserved.
//

import UIKit

@available(iOS 11.0, *)
public class LeetcodeLoginConroller: UINavigationController {
    public var didLogin: (() -> Void)?
    
    public convenience init() {
        self.init(rootViewController: LeetcodeLoginConrollerImpl())
    }
}
