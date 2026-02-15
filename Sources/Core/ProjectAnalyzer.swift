import Foundation
import Combine

// Enum for Project Error
enum ProjectError: Error {
    case forceUnwrapDetected(String)
    case vagueVariableDetected(String)
    // Add other error cases as needed
}

// Class to analyze the project
class ProjectAnalyzer: ObservableObject {
    @Published var errors: [ProjectError] = []

    // Asynchronously scan the project files
    func scanFiles(fileContents: [String]) {
        DispatchQueue.global(qos: .background).async { [weak self] in
            var detectedErrors: [ProjectError] = []
            for content in fileContents {
                // Regex pattern for force unwraps (!)
                let forceUnwrapPattern = "[\w\d]+!"
                if let _ = content.range(of: forceUnwrapPattern, options: .regularExpression) {
                    detectedErrors.append(.forceUnwrapDetected(content))
                }

                // Regex pattern for vague variable names
                let vagueVariablePattern = "\b(?:foo|bar|baz)\b" 
                if let _ = content.range(of: vagueVariablePattern, options: .regularExpression) {
                    detectedErrors.append(.vagueVariableDetected(content))
                }
            }
            // Emit detected errors asynchronously
            DispatchQueue.main.async { 
                self?.errors = detectedErrors
            }
        }
    }
}