import SwiftUI

struct DiagnosticConsole: View {
    @State private var projectErrors: [ProjectError] = []

    var body: some View {
        List {
            ForEach(projectErrors) { error in
                Section(header: Text(error.severity.rawValue)) {
                    HStack {
                        Text(error.message)
                        Spacer()
                        Button(action: { applyFixIt(for: error) }) {
                            Text("Fix It").foregroundColor(.blue)
                        }
                    }
                    Text("Location: \(error.location)")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
        }
        .onAppear(perform: loadErrors)
    }

    private func loadErrors() {
        // Load your project errors here
    }

    private func applyFixIt(for error: ProjectError) {
        // Implement the fix-it logic here
    }
}

struct ProjectError: Identifiable {
    let id: UUID
    let message: String
    let severity: Severity
    let location: String

    enum Severity: String {
        case low = "Low"
        case medium = "Medium"
        case high = "High"
    }
}