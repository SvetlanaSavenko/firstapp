//
//  ContentView.swift
//  BeauBody
//
//  Created by Савенко Светлана Александровна on 08.01.2021.
//  Copyright © 2021 Svetlana Savenko. All rights reserved.
//

import SwiftUI

struct ContentView: View {

	@State private var showModal = false
	@State private var services: Set<DepilationType> = []

	var body: some View {
		Group {
			Button("Выбрать услугу", action:{
				self.showModal.toggle()
			})
			.sheet(isPresented: $showModal) {
				ServiceDetail(showModal: self.$showModal, services: self.$services)
			}
			ForEach(Array(services), id: \.self) {
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
