//
//  ViewModelContentNew.swift
//  BeauBody
//
//  Created by Савенко Светлана Александровна on 13.02.2021.
//  Copyright © 2021 Svetlana Savenko. All rights reserved.
//

import Foundation

class ViewModelContentNew: ObservableObject {

	private var repos: AppointmentRepository
	private var unfinishedAppointment: UnfinishedAppointmentHolder
	@Published var currentAppointment: Appointment? = nil
	@Published var unfinishedServices: [DepilationTyype] = []
	@Published var unfinishedDate: Date? = nil

	@Published private(set) var isAppointmentButtonVisible = false

	init(currentAppointment: AppointmentRepository, unfinishedAppointment: UnfinishedAppointmentHolder) {
		self.repos = currentAppointment
		self.unfinishedAppointment = unfinishedAppointment
	}

	// weak self
	func loadAppointments() {
		self.repos.getAppointment(callback: { self.currentAppointment = $0 })
		self.unfinishedServices = unfinishedAppointment.appointment.services ?? []
		self.unfinishedDate = unfinishedAppointment.appointment.date
		updateButtonVisible()
	}

	private func updateButtonVisible() {
		self.isAppointmentButtonVisible = self.unfinishedServices.count > 0 && self.unfinishedDate != nil
	}

	func saveAppointment() {
		
	}


}
