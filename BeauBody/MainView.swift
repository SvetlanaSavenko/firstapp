//
//  ContentView.swift
//  BeauBody
//
//  Created by Савенко Светлана Александровна on 08.01.2021.
//  Copyright © 2021 Svetlana Savenko. All rights reserved.
//

import SwiftUI

struct MainView: View {

	@State private var showCalendarModal = false
	@State private var showServiceModal = false

	@ObservedObject private var vm: MainViewModel = Container.instance.provideMainViewModel()

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
			ForEach(vm.unfinishedServices, id: \.self) {
				Text("\($0.rawValue)")
			}
			if let date = vm.unfinishedDate {
				Text("\(date)")
			}
			if vm.isAppointmentButtonVisible {
				Button("Записаться", action:{
					self.vm.saveAppointment()
				})
			}
			if let currentAppointment = vm.currentAppointment {
				ForEach(currentAppointment.services, id: \.self) {
					Text("Вы записаны: \($0.rawValue)")
				}
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		MainView()
	}
}
