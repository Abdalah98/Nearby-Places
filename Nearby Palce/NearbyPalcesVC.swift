//
//  ViewController.swift
//  Nearby Palce
//
//  Created by Abdallah on 6/28/21.
//
import UIKit
import MapKit
class NearbyPalcesVC: UIViewController,MKMapViewDelegate {
    
    @IBOutlet weak var nearbyPlaceCollectionView: UICollectionView!
    @IBOutlet weak var mapView: MKMapView!
    var nearby :Nearby!
    var ArrayNerbyPalces :[Nearby] = [
        Nearby(palces: "policies",iamge: "police")
        ,Nearby(palces: "Cafes",iamge: "coffee-cup")
        ,Nearby(palces: "Banks",iamge: "bank"),
        Nearby(palces: "Airports",iamge: "Airport"),
        Nearby(palces: "Hotels",iamge: "hotel"),
        Nearby(palces: "Restaurants",iamge: "shop"),
        Nearby(palces: "museum",iamge: "museum"),
        Nearby(palces: "hospital",iamge: "hospital"),
        Nearby(palces: "gym",iamge: "gym")]
    
    let locationManager = CLLocationManager()
    var image = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        // Show the current user's location
        mapView.showsUserLocation = true
                
        // Request for a user's authorization for location services
        locationManager.requestWhenInUseAuthorization()
        let status = CLLocationManager.authorizationStatus()
        
        if status == CLAuthorizationStatus.authorizedWhenInUse {
            mapView.showsUserLocation = true
        }
        configureCollection()
    }
    
    func configureCollection(){
        let nib = UINib(nibName: "NearbyCell", bundle: nil)
        nearbyPlaceCollectionView.register(nib, forCellWithReuseIdentifier:"NearbyCell")
        
    }
    
    func removeAllAnnotations() {
        for annotation in self.mapView.annotations {
            self.mapView.removeAnnotation(annotation)
        }
    }
    
    func searchRequest(places:String){
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = places
        searchRequest.region = mapView.region
        
        let localSearch = MKLocalSearch(request: searchRequest)
        localSearch.start { (response, error) -> Void in
            guard let response = response else {
                if let error = error {
                    print(error)
                }
                return
            }
            let mapItems = response.mapItems
            var nearbyAnnotations: [MKAnnotation] = []
            if mapItems.count > 0 {
                for item in mapItems {
                    // Add annotation
                    let annotation = MKPointAnnotation()
                    annotation.title = item.name
                    annotation.subtitle = item.phoneNumber
                    if let location = item.placemark.location {
                        annotation.coordinate = location.coordinate
                    }
                    nearbyAnnotations.append(annotation)
                }
            }
            self.mapView.showAnnotations(nearbyAnnotations, animated: true)
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "MyPin"
        if annotation.isKind(of: MKUserLocation.self) {
            return nil
        }
        // Reuse the annotation if possible
        var annotationView: MKAnnotationView?
        
        if #available(iOS 11.0, *) {
            var markerAnnotationView: MKMarkerAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
            
            if markerAnnotationView == nil {
                markerAnnotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                markerAnnotationView?.canShowCallout = true
            }
            markerAnnotationView?.glyphText = "📍"
            markerAnnotationView?.markerTintColor = UIColor.white
            annotationView = markerAnnotationView
            
        } else {
            
            var pinAnnotationView: MKPinAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
            
            if pinAnnotationView == nil {
                pinAnnotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                pinAnnotationView?.canShowCallout = true
                pinAnnotationView?.pinTintColor = UIColor.orange
            }
            annotationView = pinAnnotationView
        }
        let leftIconView = UIImageView(frame: CGRect.init(x: 0, y: 0, width: 53, height: 53))
        leftIconView.image = UIImage(named: image)
        annotationView?.leftCalloutAccessoryView = leftIconView
        annotationView?.rightCalloutAccessoryView = UIButton(type: UIButton.ButtonType.detailDisclosure)
        return annotationView
    }
   

   
}

