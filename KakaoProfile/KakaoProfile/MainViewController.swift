//
//  MainViewController.swift
//  KakaoProfile
//
//  Created by lauren.c on 2022/01/18.
//

import UIKit
import WebKit
class MainViewController: UIViewController {
    
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "뉴스"
        
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: view.frame, configuration: webConfiguration)
        
        view.addSubview(webView)
        
        let url = URL(string: "https://page.kakao.com")
        let request = URLRequest(url: url!)
        webView.load(request)
    }
    
}
