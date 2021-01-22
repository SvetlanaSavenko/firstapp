//
//  ContentView.swift
//  BeauBody
//
//  Created by Савенко Светлана Александровна on 08.01.2021.
//  Copyright © 2021 Svetlana Savenko. All rights reserved.
//

import SwiftUI

struct ContentView: View {

	@State private var showServiceModal = false
	@State private var showСalendarModal = false
	@State private var services: [DepilationType] = []

	var body: some View {
		Group {
			Button("Выбрать услугу", action:{
				self.showServiceModal.toggle()
			})
			.sheet(isPresented: $showServiceModal) {
				ServiceDetail(showServiceModal: self.$showServiceModal, services: self.$services)
			}
			Button("Выбрать время", action:{
				self.showСalendarModal.toggle()
			})
			.sheet(isPresented: $showСalendarModal) {
				CalendarView(showСalendarModal: self.$showСalendarModal)
			}
			ForEach(services, id: \.self) {
				Text("\($0.rawValue)")
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
