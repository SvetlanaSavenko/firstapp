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
	@Published var unfinishedServices: [DepilationTyype] = []
	@Published var unfinishedDate: Date? = nil

	@Published var isAppointmentButtonVisible = false // private set

	init(appointment: AppointmentRepository, unfinishedAppointment: UnfinishedAppointmentHolder) {
		self.repos = appointment
	}

	// weak self
	func loadAppointments() {
		self.repos.getAppointmentt(callback: { self.currentAppointment = $0 })
	}

	func saveAppointments() {
		
	}

}
