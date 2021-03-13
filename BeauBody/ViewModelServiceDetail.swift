//
//  ViewModelServiceDetail.swift
//  BeauBody
//
//  Created by Савенко Светлана Александровна on 07.02.2021.
//  Copyright © 2021 Svetlana Savenko. All rights reserved.
//

import Foundation

class ViewModelServiceDetail: ObservableObject {

	@Published var selectedServices: [DepilationTyype] = []
	let allServices: [DepilationTyype] = DepilationTyype.allCases

	init(unfinishedAppointment: UnfinishedAppointmentHolder) {
//		if let services = unfinishedAppointment.appointment.services {
//			self.selectedServices = services
//		}
	}
}
