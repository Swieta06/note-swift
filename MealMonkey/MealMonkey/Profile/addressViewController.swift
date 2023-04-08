//
//  addressViewController.swift
//  MealMonkey
//
//  Created by MacBook Pro on 06/04/23.
//

import UIKit
import MapKit
class addressViewController: UIViewController {
    @IBOutlet weak var addressLable: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    var location: CLLocation?
    var address:String?
    let locationManager=CLLocationManager()
    
    var completion:(CLLocation,String) -> Void={_, _ in}
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.showsUserLocation=true
        let gesture=UILongPressGestureRecognizer(target: self, action: #selector(self.longPressHandler(_:)))
        gesture.minimumPressDuration=0.5
        gesture.delaysTouchesBegan=true
       // gesture.delegate=self
        mapView.addGestureRecognizer(gesture)
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy=kCLLocationAccuracyBest
        locationManager.distanceFilter=kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
        zoomToUserLocation()
        
    }
    
    
    @objc func longPressHandler(_ sender:UILongPressGestureRecognizer){
        if sender.state != .ended{
            let location=sender.location(in: mapView)
            let coordinate=mapView.convert(location, toCoordinateFrom: mapView)
            getAddressFromCoordinate(coordinate)
        }
    }
    func getAddressFromCoordinate(_ coordinate: CLLocationCoordinate2D){
        CLGeocoder().reverseGeocodeLocation(CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)){placemarks, error in
            if let placemarks=placemarks?.first{
                self.location=placemarks.location
                self.address=placemarks.thoroughfare
                self.addressLable.text=placemarks.thoroughfare
            }
            
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        zoomToUserLocation()
    }
    func zoomToUserLocation(){
        if let location=mapView.userLocation.location{
            let viewRegion=MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 200, longitudinalMeters: 200)
            mapView.setRegion(viewRegion, animated: true)
        }
    }

    @IBAction func saveButtonTapped(_ sender: Any) {
        dismiss(animated: true){
            if let location = self.location,
                let address = self.address{
                self.completion(location,address)
            }
           
        }
    }
}

extension UIViewController{
    func showAdressViewController(completion: @escaping(CLLocation,String) -> Void){
        let storyboard=UIStoryboard(name: "Profile", bundle: nil)
        let viewcontroller=storyboard.instantiateViewController(withIdentifier: "address") as! addressViewController
        
        viewcontroller.completion=completion
        present(viewcontroller,animated: true)
    }
}
