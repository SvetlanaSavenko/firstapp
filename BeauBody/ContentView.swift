//
//  ContentView.swift
//  BeauBody
//
//  Created by Савенко Светлана Александровна on 08.01.2021.
//  Copyright © 2021 Svetlana Savenko. All rights reserved.
//

import SwiftUI

struct ContentView: View {

	@State private var showCalendarModal = false
	@State private var showServiceModal = false

	@ObservedObject private var viewModel: ViewModelContent = ViewModelContent()
	@ObservedObject private var vm: ViewModelContentNew = Container.instance.provideContentViewModel()

	var body: some View {
		Group {
			Button("Выбрать услугу", action:{
				self.showServiceModal.toggle()
			})
			.sheet(isPresented: $showServiceModal) {
				ServiceDetail(showServiceModal: self.$showServiceModal, services: $viewModel.services)
			}
			Button("Выбрать время", action:{
				self.showCalendarModal.toggle()
			})
			.sheet(isPresented: $showCalendarModal) {
				let displayedDate = Binding<Date>(
					get: { viewModel.selectedDate ?? Date() },
					set: { viewModel.selectedDate = $0 }
				)
				CalendarDetail(showСalendarModal: self.$showCalendarModal, selectedDate: displayedDate)
			}
			ForEach(viewModel.services, id: \.self) {
				Text("\($0.rawValue)")
			}
			if let date = viewModel.selectedDate {
				Text("\(date)")
			}
			if viewModel.isAppointmentButtonVisible {
				Button("Записаться", action:{
					self.viewModel.saveAppointment()
				})
			}
			ForEach(vm.currentAppointment?.services ?? [DepilationType.pusto], id: \.self) {
				Text("Вы записаны: \($0.rawValue)")
			}
		}
		.onAppear {
			self.vm.loadAppointments()
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
