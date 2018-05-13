//
//  MapDetailViewController.swift
//  Lionel_Maes_S2T1_werkstuk1
//
//  Created by MAES Lionel (s) on 27/04/2018.
//  Copyright © 2018 MAES Lionel (s). All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapDetailViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var imgPersonDetail: UIImageView!
    @IBOutlet weak var lblNameDetail: UILabel!
    @IBOutlet weak var lblTelefoonDetail: UILabel!
    @IBOutlet weak var mapDetail: MKMapView!
    
    var person:Person?
    let manager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        
        let myLocation = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        
        self.mapDetail.showsUserLocation = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()

        lblNameDetail.text = person?.name
        lblTelefoonDetail.text = String(person!.telefoon)
        imgPersonDetail.image = person?.image
        
        let lat = person?.lat
        let lon = person?.lon
        
        let span = MKCoordinateSpanMake(0.5, 0.5)
        let location = CLLocationCoordinate2D(latitude: lat!, longitude: lon!)
        let region = MKCoordinateRegionMake(location, span)
        mapDetail.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        annotation.title = person?.club
        annotation.subtitle = "de club waar ik speel"
        mapDetail.addAnnotation(annotation)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? FotoViewController{
            destination.Person = person
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
