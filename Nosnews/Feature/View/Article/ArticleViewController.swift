//
//  ArticleViewController.swift
//  Nosnews
//
//  Created by Arif Luthfiansyah on 28/08/19.
//  Copyright © 2019 Ayo Development. All rights reserved.
//

import UIKit
import WebKit

class ArticleViewController: UIViewController {

    // MARK: - Component View
    @IBOutlet weak var mWebViewContainer: UIView!
    private let mWebView: WKWebView = {
        let webView = WKWebView()
        
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        return webView
    }()
    
    // MARK: - Dependency
    private let progressView = ALProgressIndicatorView(withMessage: nil)
    
    // MARK: - Variable
    var article: Article?
    
    // MARK: - UIViewController's Function
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupWebView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let article = article else { return }
        
        self.title = article.title ?? ""
        
        self.attemptWebContent(article: article)
    }
    
    // MARK: - Private's Function
    private func attemptWebContent(article item: Article) {
        guard
            let urlArtcile = item.url,
            let url = URL(string: urlArtcile)
            else { return }
        
        let urlRequest = URLRequest(url: url)
        
        self.mWebView.load(urlRequest)
    }
    
    private func setupWebView() {
        self.mWebView.uiDelegate = self
        self.mWebView.navigationDelegate = self
        self.mWebViewContainer.addSubview(self.mWebView)
        
        self.mWebView.topAnchor
            .constraint(equalTo: self.mWebViewContainer.topAnchor, constant: 0.0).isActive = true
        self.mWebView.rightAnchor
            .constraint(equalTo: self.mWebViewContainer.rightAnchor, constant: 0.0).isActive = true
        self.mWebView.leftAnchor
            .constraint(equalTo: self.mWebViewContainer.leftAnchor, constant: 0.0).isActive = true
        self.mWebView.bottomAnchor
            .constraint(equalTo: self.mWebViewContainer.bottomAnchor, constant: 0.0).isActive = true
    }
}

// MARK: - WKUIDelegate
extension ArticleViewController: WKUIDelegate {
    
}

// MARK: - WKNavigationDelegate
extension ArticleViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.progressView.show(superView: self.view)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.progressView.dismiss()
    }
    
    func webView(_ webView: WKWebView,
                 didFailProvisionalNavigation navigation: WKNavigation!,
                 withError error: Error) {
        self.progressView.dismiss()
        self.showAlert(title: "Error", message: "Fail to load the content", completion: nil)
    }
    
}
