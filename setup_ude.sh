#!/bin/zsh

# Initialize directories
mkdir -p ~/Documents/UDE_Scripts

# Check if Package.swift exists
if [ ! -f Package.swift ]; then
    echo 'Generating Package.swift...'
    echo "// swift-tools-version:5.3\nimport PackageDescription\n\nlet package = Package(\n    name: "UDE\",\n    products: [\n        .executable(name: "UDE", targets: ["UDE"])\n    ],\n    dependencies: [],\n    targets: [\n        .target(name: "UDE", dependencies: [])\n    ]\n)" > Package.swift
fi

# Compile the project
swift build -c release

# Set execute permissions to the compiled binary
chmod +x .build/release/UDE

# Launch the compiled binary
.build/release/UDE