// Error and Analysis Data Models

/// Represents a detected error.
struct DetectedError {
    var message: String
    var code: Int
    var severity: SeverityLevel
    
    enum SeverityLevel {
        case warning
        case error
        case critical
    }
}

/// Represents a suggestion for correction of an error.
struct CorrectionSuggestion {
    var suggestion: String
    var severity: SeverityLevel
    
    enum SeverityLevel {
        case low
        case medium
        case high
    }
}

/// Represents the result of a correction attempt.
struct CorrectionResult {
    var success: Bool
    var message: String
    var suggestion: CorrectionSuggestion?
}

/// Represents an error associated with a project.
struct ProjectError {
    var error: DetectedError
    var location: String
}

/// Represents the result of an analysis performed on a project.
struct ProjectAnalysisResult {
    var errors: [ProjectError]
    var suggestions: [CorrectionSuggestion]
    var overallSuccess: Bool
}