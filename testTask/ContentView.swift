//
//  ContentView.swift
//  testTask
//
//  Created by Алексей on 08.11.2022.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State var address = ""
    @State var checkpoints = [MKPointAnnotation]()
    
    var body: some View {
        VStack {
            MapView(checkpoints: $checkpoints)
                .ignoresSafeArea()
            VStack(spacing: 40) {
                HStack {
                    TextField("Введите адрес", text: $address)
                    Button("Add") {
                        setupPlacemarck(addressPlace: address)
                    }
                }
                HStack {
                    Spacer()
                    Button("Route") {
                        
                    }
                    Spacer()
                    Button("Reset") {
                    }
                    Spacer()
                }
            }
            .padding(20)
        }
    }
    
     func setupPlacemarck(addressPlace: String) {
    
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(addressPlace) { [self] placemarcks, error in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let placemarcks = placemarcks else { return }
            let placemarck = placemarcks.first
            let anotation = MKPointAnnotation()
            anotation.title = addressPlace
            guard let placemarckLocation = placemarck?.location else { return }
            anotation.coordinate = placemarckLocation.coordinate
            
            checkpoints.append(anotation)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
