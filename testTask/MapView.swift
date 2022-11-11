//
//  MapView.swift
//  testTask
//
//  Created by Алексей on 08.11.2022.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    @Binding var checkpoints: [MKPointAnnotation]
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        view.addAnnotations(checkpoints)
    }
//    func makeCoordinator() -> Coordinator {
//        Coordinator(checkpoints: $checkpoints)
//        }
}

//extension MapView {
//    class Coordinator: NSObject {
//
//        @Binding var checkpoints: [MKPointAnnotation]
//
//        init(checkpoints: Binding<[MKPointAnnotation]>) {
//            _checkpoints = checkpoints
//        }
//    }
//}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(checkpoints: .constant([MKPointAnnotation(__coordinate: CLLocationCoordinate2D(latitude: 11.33, longitude: 12.31), title: "W", subtitle: "w2")]))
    }
}
