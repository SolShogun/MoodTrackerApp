import SwiftUI

struct ContentView: View {

    @State private var moodValue: Double = 50
    @State private var selectedDate = Date()
    @State private var savedEntry = ""

    var moodDescription: String {
        switch Int(moodValue) {
        case 0...20:
            return "😢 Very Sad"
        case 21...40:
            return "🙁 Sad"
        case 41...60:
            return "😐 Neutral"
        case 61...80:
            return "🙂 Happy"
        default:
            return "😄 Very Happy"
        }
    }

    var moodEmoji: String {
        switch Int(moodValue) {
        case 0...20:
            return "😢"
        case 21...40:
            return "🙁"
        case 41...60:
            return "😐"
        case 61...80:
            return "🙂"
        default:
            return "😄"
        }
    }

    var body: some View {
        VStack(spacing: 20) {

            Text("Mood Tracker")
                .font(.largeTitle)
                .fontWeight(.bold)

            Slider(value: $moodValue, in: 0...100)

            Text(moodDescription)
                .font(.title2)

            DatePicker(
                "Select Date",
                selection: $selectedDate,
                displayedComponents: .date
            )

            Button("Save Mood") {

                let formatter = DateFormatter()
                formatter.dateStyle = .medium

                let dateText = formatter.string(from: selectedDate)

                savedEntry = "On \(dateText), you felt \(moodEmoji)"
            }

            Text(savedEntry)

            Spacer()
        }
        .padding()
    }
}