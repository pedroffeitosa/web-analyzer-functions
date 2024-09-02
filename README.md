
# Web Structure Analyzer

## Overview

Web Structure Analyzer is a Haskell-based tool designed to analyze the structure of HTML pages by identifying key HTML elements and scoring the webpage's structure against an ideal performance model. The tool leverages Haskell's strong type system, algebraic data types, and functional programming paradigms to provide a robust and extensible solution for web structure analysis.

## Features

- **HTML Element Parsing:** Parses common HTML tags such as `<section>`, `<article>`, `<header>`, `<footer>`, `<nav>`, `<main>`, and `<div>`.
- **Advanced Scoring System:** Compares the identified HTML elements against an ideal structure and provides a performance score based on best practices for web structure.
- **Modular Design:** The project is modular, allowing for easy extension and maintenance. The main components include HTML element parsing, scoring, and a flexible main module for execution.
- **Functional Programming:** Utilizes Haskell's powerful functional programming features, including algebraic data types, higher-order functions, and functional composition.

## Project Structure

```
WebStructureAnalyzer/
│
├── src/
│   ├── HTMLElement.hs      # Module for HTML element data types and parsing logic
│   ├── Scoring.hs          # Module for the scoring system and ideal structure definition
│   └── Main.hs             # Main module for running the analysis
│
├── html/
│   └── sample.html         # Sample HTML file for testing
│
├── WebAnalyzer             # Compiled executable (after building)
│
├── WebAnalyzer.cabal       # Cabal project file (if using Cabal)
│
└── README.md               # Project documentation (this file)
```

## Prerequisites

- **GHC (Glasgow Haskell Compiler):** Ensure GHC is installed on your machine. You can download it from [Haskell's official site](https://www.haskell.org/platform/).
- **Cabal (Optional):** If you're using Cabal for package management, ensure it is installed.

## Installation

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/pedroffeitosa/WebStructureAnalyzer.git
   cd WebStructureAnalyzer
   ```

2. **Build the Project:**

   If you're using Cabal:

   ```bash
   cabal build
   ```

   Otherwise, compile using GHC directly:

   ```bash
   ghc -o WebAnalyzer src/Main.hs
   ```

3. **Run the Project:**

   After building, you can run the executable:

   ```bash
   ./WebAnalyzer
   ```

## Usage

1. **HTML Content:**
   - Modify the `htmlContent` variable in `Main.hs` with the HTML tags you wish to analyze.
   - Alternatively, you can create or use an HTML file and adapt the code to read from the file.

2. **Running the Analysis:**
   - Run the project using the command above.
   - The tool will output the identified HTML elements and their associated attributes, followed by a performance score.

3. **Modular Components:**
   - The project is split into modules:
     - **`HTMLElement.hs`:** Handles the parsing of HTML tags into structured data.
     - **`Scoring.hs`:** Contains the logic for scoring the structure against an ideal model.
     - **`Main.hs`:** The entry point for running the analysis.

## Extending the Project

- **Add New Elements:** You can extend `HTMLElement.hs` to parse additional HTML elements or attributes.
- **Adjust Scoring:** Modify `Scoring.hs` to change the scoring criteria or ideal structure based on specific needs or new standards.

## Contributing

Contributions are welcome! If you have ideas for improvements or new features, feel free to fork the project and submit a pull request.

## License

This project is licensed under the MIT License. See the LICENSE file for details.

## Contact

For questions or support, please contact:

- **Pedro França**
- **Email:** jppfeitosa@gmail.com
