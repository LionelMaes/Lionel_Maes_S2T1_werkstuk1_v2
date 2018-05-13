//
//  Person.swift
//  Lionel_Maes_S2T1_werkstuk1
//
//  Created by MAES Lionel (s) on 27/04/2018.
//  Copyright © 2018 MAES Lionel (s). All rights reserved.
//

import UIKit

class Person {
    var name : String
    var lat = Double()
    var lon = Double()
    var telefoon = String()
    var image = UIImage()
    var club = String()
    
    init(name: String, lat: Double, lon:Double, telefoon: String, image: UIImage, club: String) {
        self.name = name
        self.lat = lat
        self.lon = lon
        self.telefoon = telefoon
        self.image = UIImage(named: self.name)!
        self.club = club
    }
}
