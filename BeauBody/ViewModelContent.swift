//
//  ViewModel.swift
//  BeauBody
//
//  Created by Савенко Светлана Александровна on 01.02.2021.
//  Copyright © 2021 Svetlana Savenko. All rights reserved.
//

import Foundation

class ViewModelContent: ObservableObject {

	@Published var services: [DepilationTyype] = [] {
		didSet { updateButtonVisible() }
	}

	@Published var selectedDate: Date? = nil {
		didSet { updateButtonVisible() }
	}

	@Published var isAppointmentButtonVisible = false // private set

	private func updateButtonVisible() {
		self.isAppointmentButtonVisible = services.count > 0 && selectedDate != nil
	}

	let userDefaults: UserDefaults

	init(userDefaults: UserDefaults = .standard) {
		self.userDefaults = userDefaults
	}

	func saveValue(forKey key: String, value: Any) {
		userDefaults.set(value, forKey: key)
	}

	func saveAppointment() {
		let date = self.selectedDate
		if (date == nil || services.isEmpty) {
			return
		}

		let appointment = Appointment(services: services, date: date!)
		do {
			let encoder = JSONEncoder()
			let data = try encoder.encode(appointment)
			saveValue(forKey: "appointments", value: data)

		} catch {
			print("Unable to Decode Note (\(error))")
		}
	}
}

//{ "appointments" : [
//	{ "12 oct", ["wax", "sugar"] },
//	{ "11 oct, [wax]" },
//	{ "12 oct, [wax]"}
//	]
//}
