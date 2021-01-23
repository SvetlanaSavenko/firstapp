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
	@State private var services: [DepilationType] = []
	@State private var selectedDate: Date? = nil

	var body: some View {
		Group {
			Button("Выбрать услугу", action:{
				self.showServiceModal.toggle()
			})
			.sheet(isPresented: $showServiceModal) {
				ServiceDetail(showServiceModal: self.$showServiceModal, services: self.$services)
			}
			Button("Выбрать время", action:{
				self.showCalendarModal.toggle()
			})
			.sheet(isPresented: $showCalendarModal) {
				let displayedDate = Binding<Date>(
					get: { selectedDate ?? Date() },
					set: { selectedDate = $0 }
				)
				CalendarDetail(showСalendarModal: self.$showCalendarModal, selectedDate: displayedDate)
			}
			ForEach(services, id: \.self) {
				Text("\($0.rawValue)")
			}
			if let date = selectedDate {
				Text("\(date)")
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
