//
//  MapVC.swift
//  GeoPhoto
//
//  Created by Mollie on 7/31/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

var userLocation:CLLocation!

class MapVC: UIViewController, MKMapViewDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var manager:CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
//        recenterMap(userLocation) // or photo location
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(true)
        
        manager.stopUpdatingLocation()
    }
    
    func recenterMap(location: CLLocation) {
        let spanX = 0.007
        let spanY = 0.007
        var newRegion = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpanMake(spanX, spanY))
        mapView.setRegion(newRegion, animated: false)
        
//        mapView.showsUserLocation = true
//        mapView.userLocationVisible
//        mapView.userLocation.title = "You Are Here"
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location.coordinate
        annotation.title = "Drag Me!"
        
        mapView.addAnnotation(annotation)
        
        // recenter map
        mapView.showAnnotations(mapView.annotations, animated: true)
    }
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        
        var pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
        pinView.canShowCallout = true
        pinView.draggable = true
        
        return pinView
        
    }
    
    func mapView(mapView: MKMapView!, annotationView view: MKAnnotationView!, didChangeDragState newState: MKAnnotationViewDragState, fromOldState oldState: MKAnnotationViewDragState) {
        Image.sharedInstance.markerCoordinates = view.annotation.coordinate
        switch (newState) {
        case .Starting:
            view.dragState = .Dragging
        case .Ending, .Canceling:
            view.dragState = .None
            println(view)
        default: break
        }
    }
    
    @IBAction func doneButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: Geolocation
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        userLocation = locations.last as! CLLocation
        println(userLocation)
        
        //        // don't move map except when needed
        //        let mapCenter = CLLocation(latitude: mapView.centerCoordinate.latitude, longitude: mapView.centerCoordinate.longitude)
        //        if locationNeedsUpdating == true || userLocation.distanceFromLocation(mapCenter) > 1000 {
        //            recenterMap(userLocation)
        //        }
        
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        
        println(error)
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
