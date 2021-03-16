import Foundation

struct Appointment: Codable {
	let services: [DepilationTyype]
	let date: Date
}

struct UnfinishedAppointment: Codable {
	var services: [DepilationTyype]
	var date: Date?
}

enum DepilationTyype: String, CaseIterable, Codable {
	case waxShinHip = "Голень"
	case sugaringBikiniClassic = "Бикини"
	case armpits = "Подмышки"
	case pusto = "Пусто"
}
