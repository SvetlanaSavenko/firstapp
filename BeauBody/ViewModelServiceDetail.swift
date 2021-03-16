//
//  ViewModelServiceDetail.swift
//  BeauBody
//
//  Created by Савенко Светлана Александровна on 07.02.2021.
//  Copyright © 2021 Svetlana Savenko. All rights reserved.
//

import Foundation

class ViewModelServiceDetail: ObservableObject, Observer {

	let classAnfApp: UnfinishedAppointmentHolder
	let allServices: [DepilationTyype] = DepilationTyype.allCases
	@Published var unfinishedAppointmentServices: [DepilationTyype] {
		didSet { self.updateServices()}
	}

	init(unfinishedAppointment: UnfinishedAppointmentHolder) {
		self.classAnfApp = unfinishedAppointment
		self.unfinishedAppointmentServices = unfinishedAppointment.appointment.services
		unfinishedAppointment.attach(self)
	}

	func update(subject: UnfinishedAppointmentHolder) {
		self.unfinishedAppointmentServices = subject.appointment.services
	}

	func updateServices() {
		self.classAnfApp.appointment.services = self.unfinishedAppointmentServices
	}
}
