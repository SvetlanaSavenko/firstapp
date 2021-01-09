//
//  ContentView.swift
//  BeauBody
//
//  Created by Савенко Светлана Александровна on 08.01.2021.
//  Copyright © 2021 Svetlana Savenko. All rights reserved.
//

import SwiftUI

struct ContentView: View {

	init() {
		if #available(iOS 14.0, *) {
			// iOS 14 doesn't have extra separators below the list by default.
		} else {
			// To remove only extra separators below the list:
			UITableView.appearance().tableFooterView = UIView()
		}
	}

	var body: some View {
		NavigationView {
			List {
				ServiceCell()
				DateCell()
			}
			.navigationBarTitle(Text("Онлайн-запись"))
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}

struct ServiceCell: View {
	var body: some View {
		NavigationLink(destination: ServiceDetail()) {
			Image("Simon Ng")
			Text("Услуга")
				.font(.title)
				.padding(20)
		}
	}
}

struct DateCell: View {
	var body: some View {
		NavigationLink(destination: DateDetail()) {
			Image("Simon Ng")
			Text("Дата и время")
				.font(.title)
				.padding(20)
		}
	}
}
