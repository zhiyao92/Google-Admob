//
//  ViewController.swift
//  Google Admob
//
//  Created by Kelvin Tan on 1/8/18.
//  Copyright © 2018 Kelvin Tan. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController, GADBannerViewDelegate, GADInterstitialDelegate {
    
    @IBOutlet weak var bannerView: GADBannerView!
    var interstitial: GADInterstitial!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bannerView.delegate = self
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
        interstitial = createAndLoad()
    }
    
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        print(#function)
    }
    
    @IBAction func show(_ sender: Any) {
        if interstitial.isReady{
            interstitial.present(fromRootViewController: self)
        } else {
            print("Ad isn't ready")
        }
    }
    
    func createAndLoad() -> GADInterstitial {
        var interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        interstitial.delegate = self
        interstitial.load(GADRequest())
        return interstitial
    }
    
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        interstitial = createAndLoad()
    }
    
    func interstitialDidReceiveAd(_ ad: GADInterstitial) {
        print("interstitialDidReceiveAd")
    }
    
}

