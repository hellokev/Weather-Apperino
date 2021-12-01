import SwiftUI
import CoreLocation
import MapKit
import Foundation

let locationManager = CLLocationManager()


extension Color {
    static let bg = Color("background")
    static let fgPrimary = Color(red: 245, green: 245, blue: 245)
}

struct ContentView: View {
    @ObservedObject var test = LocationManager()
    
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                if test.isLoading {
                    LoadingView(text: "Loading. . .")
                    NavigationView {
                        /*VStack {
                            Text("Next View")
                            NavigationLink(destination: WeatherView()){
                                Text("Do Something")
                            }
                        }*/
                    }
                } else {
                    Text(test.weatherData?.name ?? "NO")
                        .font(.system(size: 36, weight: .bold, design: .default))
                        .foregroundColor(Color.fgPrimary)
                        .padding(.bottom, 4)
                    
                    Text(String(test.weatherData?.main?.temp ?? 0.0))
                        .font(.system(size: 20, weight: .light, design: .default))
                        .foregroundColor(Color.fgPrimary)
                }
            }/*.frame(width: geometry.size.width, height: geometry.size.height, alignment: .center).background(Color.black)*/
        }
    }
}

class DeviceLocation : NSObject {

}

/*struct WeatherView: View {

    var body: some View{
        Text("Placeholder")
    }
    
}*/

extension CLLocationManager: CLLocationManagerDelegate {
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
    public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
          if (status == .denied) {
              // Show Bat Cave weather
          }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
