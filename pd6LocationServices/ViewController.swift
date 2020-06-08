import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    
    @IBOutlet weak var map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        checkForLocationServices()
    }

    func checkForLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            checkForAppLocationServices()
        } else {
            // notify user that they must turn on location services
        }
    }
    
    func checkForAppLocationServices() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
   //         locationManager.startMonitoring(for: <#T##CLRegion#>)
            map.showsUserLocation = true
        case .authorizedAlways:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .denied:
            break
        @unknown default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
    }
}
