//
//  CLLocation+Worldle.swift
//  Worldle

import CoreLocation

public extension CLLocation {
    func getRadiansFrom(degrees: Double ) -> Double {
        return degrees * .pi / 180
    }

    func getDegreesFrom(radians: Double) -> Double {
        return radians * 180 / .pi
    }

    func bearingRadianTo(location: CLLocation) -> Double {
        let lat1 = getRadiansFrom(degrees: coordinate.latitude)
        let lon1 = getRadiansFrom(degrees: coordinate.longitude)

        let lat2 = getRadiansFrom(degrees: location.coordinate.latitude)
        let lon2 = getRadiansFrom(degrees: location.coordinate.longitude)

        let dLon = lon2 - lon1

        let y = sin(dLon) * cos(lat2)
        let x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dLon)

        var radiansBearing = atan2(y, x)

        if radiansBearing < 0.0 {
            radiansBearing += 2 * .pi
        }

        return radiansBearing
    }

    func bearingDegreesTo(location: CLLocation) -> Double {
        getDegreesFrom(radians: bearingRadianTo(location: location))
    }
}
