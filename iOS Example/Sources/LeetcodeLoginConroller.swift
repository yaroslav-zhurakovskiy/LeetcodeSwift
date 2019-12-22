//
//  LeetcodeLoginConroller.swift
//  LeetcodeSwiftExample
//
//  Created by Yaroslav Zhurakovskiy on 16.12.2019.
//  Copyright © 2019 yaroslavz. All rights reserved.
//

import UIKit
import WebKit
import Leetcode

class LeetcodeLoginConroller: UINavigationController {
    var didLogin: (() -> Void)?
 
    convenience init() {
        self.init(rootViewController: LeetcodeLoginConrollerImpl())
    }
}

class LeetcodeLoginConrollerImpl: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var titleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        
        navigationItem.titleView = titleView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        activityIndicator.startAnimating()
        
        webView.configuration.websiteDataStore.httpCookieStore.getAllCookies { [weak self] cookies in
            for cookie in cookies {
                self?.webView.configuration.websiteDataStore.httpCookieStore.delete(cookie, completionHandler: nil)
            }
            self?.webView.load(URLRequest(url: URL(string: "https://leetcode.com/accounts/login")!))
        }
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webView.configuration.websiteDataStore.httpCookieStore.getAllCookies { [weak self] cookies in
            if let url = webView.url {
                let storage = HTTPCookieStorageFactoryHolder.current.create()
                storage.setCookies(cookies, for: url, mainDocumentURL: nil)
                if cookies.contains(where: { $0.name == "LEETCODE_SESSION" }) {
                    self?.dismiss(animated: true, completion: { [weak self] in
                        (self?.navigationController as? LeetcodeLoginConroller)?.didLogin?()
                    })
                }
            }
        }
        activityIndicator.stopAnimating()
    }
}
