//
//  ViewController.swift
//  TravelBook
//
//  Created by Rabia Cırık on 18.08.2025.
//

import UIKit
import MapKit
import CoreLocation
import CoreData

class ViewController: UIViewController , MKMapViewDelegate , CLLocationManagerDelegate{

    @IBOutlet weak var commentText: UITextField!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    var chosenlongitude = Double()
    var chosenlatitude = Double()
    
    var annotationTitle = ""
    var annotationcomment = ""
    var annotationId : UUID?
    var annotationLongitude = Double()
    var annotationLatitude = Double()
    
    var selectedTitle = ""
    var selectedTitleId : UUID?
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        if selectedTitle != ""{
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let Fetchrequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Places")
            let idString = selectedTitleId!.uuidString
            Fetchrequest.predicate = NSPredicate(format: "id == %@", idString)
            Fetchrequest.returnsObjectsAsFaults = false
            
            do {
                let results = try context.fetch(Fetchrequest)
                if results.count > 0 {
                    for result in results as! [NSManagedObject]{
                        if let title = result.value(forKey: "title") as? String {
                            annotationTitle=title
                            if let subtitle = result.value(forKey: "subtitle") as? String {
                                annotationcomment=subtitle
                                if let latitude = result.value(forKey: "latitude") as? Double {
                                    annotationLatitude=latitude
                                    if let longitude = result.value(forKey: "longitude") as? Double {
                                        annotationLongitude=longitude
                                        let annotation = MKPointAnnotation()
                                        annotation.coordinate = CLLocationCoordinate2D(latitude: annotationLatitude, longitude: annotationLongitude)
                                        annotation.title = annotationTitle
                                        annotation.subtitle = annotationcomment
                                        mapView.addAnnotation(annotation)
                                        nameText.text=annotation.title!
                                        commentText.text=annotation.subtitle!
                                        
                                        locationManager.stopUpdatingLocation()
                                        
                                        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                                        let region = MKCoordinateRegion(center: CLLocationCoordinate2D.init(latitude: annotationLatitude, longitude: annotationLongitude), span: span)
                                        mapView.setRegion(region, animated: true)
                                        
                                    }
                                }
                            }
                        }
                    }
                }
                
            }
            catch {
                print("error")
            }
            
            
        }
        
        
        let gesturerecognizer = UILongPressGestureRecognizer(target: self, action: #selector(choosenLocation(gestureRecognizer:)))
        gesturerecognizer.minimumPressDuration = 2.5
        mapView.addGestureRecognizer(gesturerecognizer)
        
    }
    
    
    
    @objc func choosenLocation(gestureRecognizer: UILongPressGestureRecognizer){
        
        if nameText.text != "" && commentText.text != "" {
            if gestureRecognizer.state == .began  {
                let touchPoint = gestureRecognizer.location(in: self.mapView)
                let touchCoordinates = self.mapView.convert(touchPoint, toCoordinateFrom: self.mapView)
                
                chosenlatitude = touchCoordinates.latitude
                chosenlongitude = touchCoordinates.longitude
                
                let annotation = MKPointAnnotation()
                annotation.coordinate = touchCoordinates
                annotation.title = nameText.text
                annotation.subtitle = commentText.text
                
                
                mapView.addAnnotation(annotation)
                
                
            }
        }
        else{
            let alert = UIAlertController(title: "Uyarı", message: "Lütfen isim alanı giriniz", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)

        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if selectedTitle == "" {
            let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
            let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
            let region = MKCoordinateRegion(center: location, span: span)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: any MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation {
            return nil
        }
        let reuseId = "pin"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView?.canShowCallout = true
            
            let button = UIButton(type: UIButton.ButtonType.detailDisclosure)
            pinView?.rightCalloutAccessoryView = button
        }
        else {
            pinView?.annotation = annotation
        }
        return pinView
    }
    

    
        @IBAction func saveButton(_ sender: Any) {
            if nameText.text != "" && commentText.text != ""{
                
            let appdelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appdelegate.persistentContainer.viewContext
            
            let newPlace = NSEntityDescription.insertNewObject(forEntityName: "Places", into: context)
            newPlace.setValue(nameText.text, forKey: "title")
            newPlace.setValue(commentText.text, forKey: "subtitle")
            newPlace.setValue(chosenlatitude, forKey: "latitude")
            newPlace.setValue(chosenlongitude, forKey: "longitude")
            newPlace.setValue(UUID(), forKey: "id")
            
            do {
                try context.save()
                print("saved")
            }
            catch {
                print("error saving")
            }
            NotificationCenter.default.post(name: NSNotification.Name("new places"), object: nil)
                navigationController?.popViewController(animated: true)

        }
            else {
                let alert = UIAlertController(title: "Uyarı", message: "Lütfen isim alanı giriniz", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            }
            
 
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        if selectedTitle != "" {
            let requestLocation = CLLocation(latitude: annotationLatitude, longitude: annotationLongitude)
            
            CLGeocoder().reverseGeocodeLocation(requestLocation) { (placemarks, error) in
                
                if let placemark = placemarks {
                    if placemark.count > 0 {
                        let newPlacemark = MKPlacemark(placemark: placemark[0])
                        let item = MKMapItem(placemark: newPlacemark)
                        item.name = self.annotationTitle
                        let launcOptions = [MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving]
                        item.openInMaps(launchOptions: launcOptions)
                        
                        
                    }
                }
            }
            
        
        }
    }
    
    
}

