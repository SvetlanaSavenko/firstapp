import Foundation
// model
	struct Appointment: Codable {
		let services: [DepilationType]
		let date: Date
	}


