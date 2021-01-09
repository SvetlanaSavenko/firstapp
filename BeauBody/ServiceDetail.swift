//
//  TutorDetail.swift
//  BeauBody
//
//  Created by Савенко Светлана Александровна on 08.01.2021.
//  Copyright © 2021 Svetlana Savenko. All rights reserved.
//

import SwiftUI

struct ServiceDetail: View {

	var body: some View {
		VStack {
			DepilationMenu()
		}
	}
}

struct TutorDetail_Previews: PreviewProvider {
	static var previews: some View {
		ServiceDetail()
	}
}

struct DepilationMenu: View {
	@State var expand = true
	var body: some View {
		VStack() {
			HStack() {
				Text("Депиляция")
				Image(systemName: expand ? "chevron.up" : "chevron.down")
			}.onTapGesture {
				self.expand.toggle()
			}
			if expand {
				CheckboxField(label: .waxShinHip)
				CheckboxField(label: .sugaringBikiniClassic)
				CheckboxField(label: .armpits)
			}
		}
	}
}

enum DepilationTypes: String {
    case waxShinHip = "Ноги (голень/бедро) воском 400р"
    case sugaringBikiniClassic = "Бикини классика (шугаринг/полимер) 350р"
	case armpits = "Подмышечные впадины (шугаринг/полимер) 200р"
}

struct CheckboxField: View {
	let label: String
	init(
		label: DepilationTypes
	) {
		self.label = label.rawValue
	}

	@State var isMarked:Bool = false
	var body: some View {
		Button(action:{
			self.isMarked.toggle()
		}) {
			HStack() {
				Image(systemName: self.isMarked ? "checkmark.square" : "square")
				Text(label)
			}
		}
	}
}
