import Foundation

struct Appointment: Codable {
	let services: [DepilationTyype]
	let date: Date
}

struct UnfinishedAppointment: Codable {
	let services: [DepilationTyype]?
	let date: Date?
}

enum DepilationTyype: String, CaseIterable, Codable {
	case waxShinHip = "Голень"
	case sugaringBikiniClassic = "Бикини"
	case armpits = "Подмышки"
}
