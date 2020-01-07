//
//  ViewController.swift
//  GoongExample
//
//  Created by iBinh on 1/6/20.
//  Copyright © 2020 Goong. All rights reserved.
//

import UIKit
import GoongSDK
import GoongGeocoder

class ViewController: UIViewController, MGLMapViewDelegate, GoongAutocompleteDelegate {
    var mapView: MGLMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView = MGLMapView(frame: view.bounds)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.delegate = self
        // View more style at MGLStyle.h
        mapView.styleURL = URL(string: "https://tiles.goong.io/assets/goong_map_web.json")
        // Optionally set a starting point.
        mapView.setCenter(CLLocationCoordinate2DMake(21.028511, 105.804817), zoomLevel: 12, animated: false)
        // Show user location dot
        mapView.myLocationEnabled = true
        view.addSubview(mapView)
        
        let searchButton = UIButton(frame: CGRect(x: view.frame.size.width - 100 , y: 50, width: 80, height: 30))
        searchButton.setTitle("Search", for: .normal)
        searchButton.backgroundColor = .darkGray
        searchButton.setTitleColor(.white, for: .normal)
        searchButton.addTarget(self, action: #selector(self.search), for: .touchUpInside)
        view.addSubview(searchButton)
    }
    
    @objc func search() {
        let vc = GoongAutocompleteViewController(accessToken: "YOUR_ACCESS_TOKEN")
        let nav = UINavigationController(rootViewController: vc)
        vc.delegate = self
        self.present(nav, animated: true, completion: nil)
    }
    func viewController(_ viewController: GoongAutocompleteViewController, didAutocompleteWith place: Placemark?) {
        guard let place = place else {return}
        let marker = MGLMarker()
        marker.coordinate = place.location!.coordinate
        marker.title = place.name
        marker.reuseIdentifier = "markerIdentifier"
        marker.icon = UIImage(named: "pin")!
        marker.map = self.mapView
        
        self.mapView.setCenter(marker.coordinate, animated: true)
    }
    func viewController(_ viewController: GoongAutocompleteViewController, didFailAutocompleteWithError error: Error?) {
        print(error)
    }
}

