//
//  AddMemberViewController.swift
//  MyFinalProject
//
//  Created by Halyson Ribeiro Pessoa on 10/01/2019.
//  Copyright © 2019 Halyson Ribeiro Pessoa. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class AddMemberViewController: UIViewController {

    @IBOutlet weak var txtMember: UITextField!
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    var latitude = "0"
    var longitude = "0"
    
    var textSelect: String?
    var indexSelect = -1
    var onClosed: ((Bool) -> Void)?
    
    var memberModel: Member!
    var listItems:Array<MemberModel> = []
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        memberModel = Member()
        self.listItems = memberModel.getMembers()
        startMap()
    }
    
    private func startMap(){
        locationManager.delegate = self
        mapView.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        // requesting user permission
        locationManager.requestWhenInUseAuthorization()
        
        // creating a center zoom where the map will update
        
        
        //Adiciona o marcador
        insertMark()
     
        mapView.showsUserLocation = true
    }
    
    private func insertMark(){
        // adding a annotation
         let point = MKPointAnnotation()
        if indexSelect != -1 {
            let item = listItems[indexSelect]
            txtMember.text = item.descricao
            point.title = item.descricao
            point.coordinate = CLLocationCoordinate2D(latitude: item.latitude ?? 0, longitude: item.longitude ?? 0)
            
           updateCenterCoordinates(coordinates: point.coordinate)
        } else {
            if let coordinates = locationManager.location?.coordinate {
                updateCenterCoordinates(coordinates: coordinates)
            }
            locationManager.startUpdatingLocation()
        }
        
        
        mapView.addAnnotation(point)
         // start location updates
        
        
    }

    
    //Atualiza regiao e centraliza o mapa
    private func updateCenterCoordinates(coordinates: CLLocationCoordinate2D) {
        let region = MKCoordinateRegion(center: coordinates, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(region, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if(indexSelect != -1){
            txtMember.text = listItems[indexSelect].descricao
            textSelect = txtMember.text
        }
    }
    
    
    @IBAction func saveMember(_ sender: UIButton) {
        
        insertMark()
        let latitude = mapView.centerCoordinate.latitude
        let longitude = mapView.centerCoordinate.longitude
        
        if let membro = txtMember.text{
            if textSelect != nil{
                memberModel.updateMember(MemberModel(membro, latitude, longitude), indexSelect)
                navigationController?.popViewController(animated: true)
                
            }else{
                memberModel.insertMember(MemberModel(membro,latitude,longitude))
                navigationController?.popViewController(animated: true)
            }
        }
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension String {
    var doubleValue: Double {
        return (self as NSString).doubleValue
    }
}

extension AddMemberViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // update the location here
        if let coordinate = locations.last {
            let region = MKCoordinateRegion(center: coordinate.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
            mapView.setRegion(region, animated: true)
            
           self.latitude = String(mapView.userLocation.coordinate.latitude)
           self.longitude = String(mapView.userLocation.coordinate.longitude)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        // update the authorization here
    }
}

extension AddMemberViewController: MKMapViewDelegate {}
