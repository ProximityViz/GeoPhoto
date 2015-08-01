//
//  Image.swift
//  GeoPhoto
//
//  Created by Mollie on 7/31/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

import CoreLocation

// image
// image center
// image zoom
//
//var markerCoordinates:CLLocationCoordinate2D!
//var mapCenter:CLLocation!
//var mapZoom = 0
//// basemap
//
//// title
//// other text
//var imageTitle = ""
//var imageFullFont = ""
//
//// layout
//// position within layout

class Image {
    
    static let sharedInstance = Image()
    
    var markerCoordinates:CLLocationCoordinate2D!
    var mapCenter:CLLocation!
    var mapZoom:Int = 0
    var title:String = ""
    var font:String = ""
    var fontFace:String = ""
    var fontWeight:String = ""
    
    private init() {
        println(__FUNCTION__)
    }
    
//    var mapZoom = 0
//    // basemap
//    
//    // title
//    // other text
//    var imageTitle = ""
//    var imageFont = "" // give these defaults
//    var imageFontFace = ""
//    var imageFontWeight = ""
//    
    func changeFont(property: String, component: Int) {
        if component == 0 {
            self.fontFace = property
            if self.fontWeight == "" { // or Normal?
                self.font = property
            } else {
                self.font = property + "-" + self.fontWeight
            }
        } else if component == 1 {
            self.fontWeight = property
            self.font = self.fontFace + "-" + property
        }
    }
   
}
