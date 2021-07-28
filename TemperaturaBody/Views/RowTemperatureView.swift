//
//  RowTemperatureView.swift
//  temperatura
//
//  Created by Artem Palyutin on 17.07.2021.
//

import SwiftUI

struct RowTemperatureView: View {
    
    //@Environment(\.managedObjectContext) private var viewContext
    let temp: Double
    let date: Date
    
    
    var body: some View {
        HStack {
            Text("\(date, formatter: itemFormatter)")
                .font(.subheadline)
                .foregroundColor(.colorTheme.textColor)
            
            Spacer()

            Text("\(temp, specifier: "%.1f")°")
                .foregroundColor(temp > 37 ? .colorTheme.tempColorRed : .colorTheme.tempColorFine)
                .font(.headline)
                .bold()
        }
        .foregroundColor(.colorTheme.textColor)
    }
}

// MARK: - Date Format
private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
//    formatter.dateStyle = .short
//    formatter.timeStyle = .medium
    formatter.dateFormat = "EE, MMM d, yyyy     HH:mm"
    
    return formatter
}()






struct RowTemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RowTemperatureView(temp: 36.5, date: Date())
                .previewLayout(.sizeThatFits)
            RowTemperatureView(temp: 38.1, date: Date())
                .previewLayout(.sizeThatFits)
            RowTemperatureView(temp: 36.6, date: Date())
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
            RowTemperatureView(temp: 37.5, date: Date())
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)

        }
        .padding()
    }
}
