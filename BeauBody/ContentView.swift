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

	@ObservedObject private var vm: ViewModelContentNew = Container.instance.provideContentViewModel()

	var body: some View {
		Group {
			Button("Выбрать услугу", action:{
				self.showServiceModal.toggle()
			})
			.sheet(isPresented: $showServiceModal) {
				ServiceDetail(showServiceModal: self.$showServiceModal)
			}
			Button("Выбрать время", action:{
				self.showCalendarModal.toggle()
			})
			.sheet(isPresented: $showCalendarModal) {
				CalendarDetail(showСalendarModal: self.$showCalendarModal)
			}
			ForEach(vm.unfinishedAppointment?.services ?? [DepilationType.pusto], id: \.self) {
				Text("\($0.rawValue)")
			}
			if let date = vm.unfinishedAppointment?.date {
				Text("\(date)")
			}
			if vm.isAppointmentButtonVisible {
				Button("Записаться", action:{
					self.vm.saveAppointment()
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
