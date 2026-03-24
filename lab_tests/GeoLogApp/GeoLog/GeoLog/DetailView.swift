//
//  DetailView.swift
//  GeoLog
//
//  Created by Jayden Lewis on 2026-03-24.
//

import SwiftUI

struct DetailView: View {
    var entry: LogEntry

    var body: some View {
        List {
            Section("Location") {
                LabeledContent("Latitude", value: String(format: "%.6f", entry.latitude))
                LabeledContent("Longitude", value: String(format: "%.6f", entry.longitude))
                LabeledContent("Altitude", value: String(format: "%.2f m", entry.altitude))
            }
            Section("Sensor") {
                LabeledContent("Accelerometer", value: String(format: "%.4f G", entry.accelerometer))
            }
            Section("Logged") {
                LabeledContent("Time", value: entry.timestamp ?? Date(), format: .dateTime)
            }
        }
        .navigationTitle(entry.name ?? "Entry")
    }
}
