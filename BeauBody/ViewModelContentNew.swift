//
//  ViewModelContentNew.swift
//  BeauBody
//
//  Created by Савенко Светлана Александровна on 13.02.2021.
//  Copyright © 2021 Svetlana Savenko. All rights reserved.
//

import Foundation

class ViewModelContentNew: ObservableObject {

	var repos: AppointmentRepository
	@Published var currentAppointment: Appointment? = nil

	init(appointment: AppointmentRepository) {
		self.repos = appointment
	}

	func getAppointments() {
		self.repos.getAppointment() // обновила appo в модели
		self.currentAppointment = self.repos.appo
	}

	func saveAppointments(appointment: Appointment) {
		self.repos.saveAppointment(appointment: appointment)
	}

}