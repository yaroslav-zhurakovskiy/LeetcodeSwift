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

@available(iOS 11.0, *)
public class LeetcodeLoginConroller: UINavigationController {
    public var didLogin: (() -> Void)?
    
    public convenience init() {
        self.init(rootViewController: LeetcodeLoginConrollerImpl())
    }
}

@available(iOS 11.0, *)
class LeetcodeLoginConrollerImpl: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var titleView: UIView!
    
    override func loadView() {
        self.view = {
            guard let data = Data(base64Encoded: Self.nibBase64String, options: .ignoreUnknownCharacters) else {
                return UIView()
            }
            
            let nib = UINib(data: data, bundle: nil)
            
            guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
                return UIView()
            }
            
            return view
        }()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        
        navigationItem.titleView = titleView
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .cancel,
            target: self,
            action: #selector(cancel)
        )
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        activityIndicator.startAnimating()
        
        webView.configuration.websiteDataStore.httpCookieStore.getAllCookies { [weak self] cookies in
            for cookie in cookies {
                self?.webView.configuration.websiteDataStore.httpCookieStore.delete(cookie, completionHandler: nil)
            }
            self?.webView.load(URLRequest(url: URL(leetcodePath: "accounts/login")))
        }
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webView.configuration.websiteDataStore.httpCookieStore.getAllCookies { [weak self] cookies in
            if let url = webView.url {
                let storage = HTTPCookieStorage.shared
                storage.setCookies(cookies, for: url, mainDocumentURL: nil)
                if cookies.contains(where: { $0.name == LeetcodeConstants.sessionCookieName }) {
                    self?.dismiss(animated: true, completion: { [weak self] in
                        (self?.navigationController as? LeetcodeLoginConroller)?.didLogin?()
                    })
                }
            }
        }
        activityIndicator.stopAnimating()
    }
    
    @objc private func cancel() {
        dismiss(animated: true)
    }
}
