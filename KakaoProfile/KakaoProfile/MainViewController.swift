//
//  MainViewController.swift
//  KakaoProfile
//
//  Created by lauren.c on 2022/01/18.
//

import UIKit
import WebKit
class MainViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "뉴스"
        
        let url = URL(string: "https://page.kakao.com")
        let request = URLRequest(url: url!)
        webView.load(request)
    }

}
