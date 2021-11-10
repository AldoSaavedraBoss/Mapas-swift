//
//  ViewController.swift
//  Mapas
//
//  Created by Mac10 on 09/11/21.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var manager = CLLocationManager()
    var lat: CLLocationDegrees?
    var lon: CLLocationDegrees?
    

    @IBOutlet weak var Mapa: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Delegados
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        //Precision
        manager.desiredAccuracy = kCLLocationAccuracyBest
        //comenzar a actualizar la ubicaion del GPS
        manager.startUpdatingLocation()
    }

    @IBAction func verCoordenadas2(_ sender: UIButton) {
        let alerta = UIAlertController(title: "Ubicacion", message: "Latitud: \(self.lat!)\n Longitd: \(self.lon!)", preferredStyle: .alert)
        
        let aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
        let verMas = UIAlertAction(title: "Ver mas...", style: .default, handler: nil)
        
        alerta.addAction(aceptar)
        alerta.addAction(verMas)
        
        present(alerta, animated: true, completion: nil)
    }
    
    @IBAction func verCoordenadasBtn(_ sender: UIBarButtonItem) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let locacion = locations.first{
            self.lat = locacion.coordinate.latitude
            self.lon = locacion.coordinate.longitude
        }
    }

}

