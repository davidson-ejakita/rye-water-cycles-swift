import Foundation
import Ignite

struct Home: StaticPage {
    var title = "Bike repairs in Kilcock"
    var description = "A small bike repair workshop beside the Royal Canal greenway in Kilcock, Co. Kildare."

    var body: some HTML {
        Hero()
        ServicesSection()
        ProcessSection()
        PressureSection()
        VisitSection()
    }
}
