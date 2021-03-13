//
//  Container.swift
//  BeauBody
//
//  Created by Савенко Светлана Александровна on 13.02.2021.
//  Copyright © 2021 Svetlana Savenko. All rights reserved.
//

import Foundation

class Container {
	static let instance = Container()
	private init() {}

	private let userSettingsAppoRepository: AppointmentRepository = UserSettingsAppointmentRepository()
	private let unfinishedAppointment = UnfinishedAppointmentHolder()

	func provideMainViewModel() -> MainViewModel {
		return MainViewModel(currentAppointment: userSettingsAppoRepository, unfinishedAppointment: unfinishedAppointment)
	}

	func provideServiceViewModel() -> ViewModelServiceDetail {
		return ViewModelServiceDetail(unfinishedAppointment: unfinishedAppointment)
	}

	func provideCalendarViewModel() -> ViewModelCalendarDetail {
		return ViewModelCalendarDetail(unfinishedAppointment: unfinishedAppointment)
	}

}
