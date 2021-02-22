//
//  UserSettingsAppointmentRepository.swift
//  BeauBody
//
//  Created by Савенко Светлана Александровна on 13.02.2021.
//  Copyright © 2021 Svetlana Savenko. All rights reserved.
//

import Foundation
class UserSettingsAppointmentRepository: AppointmentRepository, ObservableObject {

	func getAppointmentt(callback: (Appointment) -> ()) {
		let data = userDefaults.object(forKey: "appointments")
		do {
			let appointment = try JSONDecoder().decode(Appointment.self, from: data as! Data)
			callback(appointment)
		} catch {
			print("Unable to Decode Note (\(error))")
		}
	}

	private let userDefaults: UserDefaults

	init(userDefaults: UserDefaults = .standard) {
		self.userDefaults = userDefaults
	}

	private func saveValue(forKey key: String, value: Any) {
		userDefaults.set(value, forKey: key)
	}

	func saveAppointment(appointment: Appointment) {
		do {
			let data = try JSONEncoder().encode(appointment)
			saveValue(forKey: "appointments", value: data)

		} catch {
			print("Unable to Decode Note (\(error))")
		}
	}

}
