import Foundation

/// A single job on the workshop price list.
struct Service: Identifiable {
    let id: String
    let name: String
    let detail: String
    let unit: String
    let price: Int
    let minutes: Int
    let featured: Bool

    var duration: String {
        minutes >= 60 ? "\(minutes / 60)h\(minutes % 60 == 0 ? "" : " \(minutes % 60)m")" : "\(minutes) min"
    }

    static let all: [Service] = [
        Service(id: "full", name: "Full service", detail: "Drivetrain stripped and degreased, bearings checked, brakes and gears set up from scratch.", unit: "Any bike", price: 95, minutes: 180, featured: true),
        Service(id: "tune", name: "Gear tune", detail: "Derailleurs indexed, limit screws set and the hanger checked for alignment.", unit: "Any bike", price: 35, minutes: 45, featured: false),
        Service(id: "puncture", name: "Puncture repair", detail: "New tube or patch, with the tyre checked for glass and flints.", unit: "Per wheel", price: 15, minutes: 20, featured: false),
        Service(id: "bleed", name: "Brake bleed", detail: "Fresh mineral oil or DOT fluid, and new pads if they are under 1 mm.", unit: "Per end", price: 30, minutes: 40, featured: false),
        Service(id: "true", name: "Wheel true", detail: "Lateral and radial true with spoke tension evened out.", unit: "Per wheel", price: 25, minutes: 30, featured: false),
        Service(id: "tubeless", name: "Tubeless setup", detail: "Rim tape, valve and sealant. Bring your own tyres or choose from ours.", unit: "Per wheel", price: 40, minutes: 40, featured: false),
        Service(id: "ebike", name: "E-bike check", detail: "Motor diagnostic, firmware update and a battery health report.", unit: "Hub or mid-drive", price: 45, minutes: 60, featured: false),
        Service(id: "chain", name: "Chain and cassette", detail: "Wear measured at 0.5% and 0.75%, new parts fitted and shifted in.", unit: "Labour only", price: 30, minutes: 30, featured: false),
    ]
}

/// One row of the tyre pressure guide, worked out in Swift at build time.
struct PressureRow {
    let width: Int
    let use: String
    let front: Int
    let rear: Int

    /// Rough starting pressure for a 75 kg rider plus about 10 kg of bike and kit.
    static func make(width: Int, use: String, riderKg: Double = 75) -> PressureRow {
        let load = riderKg + 10
        let rear = min(110, max(15, (340 * load / pow(Double(width), 1.8)).rounded()))
        return PressureRow(width: width, use: use, front: Int((rear * 0.92).rounded()), rear: Int(rear))
    }

    static let guide: [PressureRow] = [
        make(width: 25, use: "Road racing"),
        make(width: 28, use: "Road"),
        make(width: 32, use: "Endurance road"),
        make(width: 38, use: "Commuter"),
        make(width: 45, use: "Gravel"),
        make(width: 57, use: "Trail (2.25 in)"),
    ]
}

/// Opening hours, Monday first.
struct OpeningDay {
    let day: String
    let hours: String
    let weekday: Int   // matches JavaScript getDay(), Sunday = 0

    static let week: [OpeningDay] = [
        OpeningDay(day: "Monday", hours: "Closed", weekday: 1),
        OpeningDay(day: "Tuesday", hours: "9am – 6pm", weekday: 2),
        OpeningDay(day: "Wednesday", hours: "9am – 6pm", weekday: 3),
        OpeningDay(day: "Thursday", hours: "9am – 8pm", weekday: 4),
        OpeningDay(day: "Friday", hours: "9am – 6pm", weekday: 5),
        OpeningDay(day: "Saturday", hours: "9am – 5pm", weekday: 6),
        OpeningDay(day: "Sunday", hours: "Closed", weekday: 0),
    ]
}
