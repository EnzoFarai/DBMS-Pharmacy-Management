# C++ Quiz Application

## Description
This is a console-based quiz application built in C++. It allows users to answer multiple-choice questions while tracking their score and total time taken. Skipped or incorrectly answered questions display explanations to enhance learning.

The application demonstrates key Object-Oriented Programming (OOP) concepts and memory management in C++.

---

## Concepts Demonstrated

- **Constructors:** Used to initialize quiz questions and the quiz manager object.  
- **Destructors:** Handle cleanup of dynamically allocated memory for questions and the quiz manager.  
- **Polymorphism:** Implemented using a `Question` base class and a `TimedQuestion` derived class, enabling uniform handling of different question types.  
- **Dynamic Memory Allocation:** Questions and the quiz manager are dynamically created using `new` and properly deleted using `delete`.  
- **Timer and Score Tracking:** Measures the total time taken to complete the quiz and calculates scores with feedback.

---

## Features

- **Multiple-Choice Questions**
  - 12 pre-defined questions on C++ OOP concepts.
  - Users can answer or skip questions.
  - Explanations are displayed for skipped or incorrect answers.

- **Score Tracking**
  - Displays total score, percentage, and performance feedback at the end of the quiz.

- **Time Measurement**
  - Records and displays the total duration of the quiz.

- **Interactive Console Interface**
  - Clear question formatting and user-friendly navigation.
  - Immediate feedback for every response.

---

## Technologies Used

- **Programming Language:** C++  
- **C++ Standard Library Features:**
  - `<iostream>` for input/output operations  
  - `<vector>` and `<string>` for storing data  
  - `<chrono>` for time measurement  
  - Dynamic memory management with `new` and `delete`

---

## How to Run

1. Compile the code using any C++ compiler, for example:
   ```bash
   g++ quiz.cpp -o quiz
````

2. Run the program:

   ```bash
   ./quiz
   ```

---

## 📸 Program Output Showcase

### 🖥️ 1. Program Initialization

<img src="https://raw.githubusercontent.com/EnzoFarai/Object-Oriented-Programming-Project/main/Output/Output-1_PROGRAM-INITIALIZATION.png" width="700">

---

### ✅ 2. Correct Answer Scenario

<img src="https://raw.githubusercontent.com/EnzoFarai/Object-Oriented-Programming-Project/main/Output/Output-2_CORRECT-ANSWER-SCENARIO.png" width="700">

---

### ❌ 3. Incorrect Answer with Explanation

<img src="https://raw.githubusercontent.com/EnzoFarai/Object-Oriented-Programming-Project/main/Output/Output-3_INCORRECT-ANSWER-WITH-EXPLANATION.png" width="700">

---

### ⏭️ 4. Skipped Question Handling

<img src="https://raw.githubusercontent.com/EnzoFarai/Object-Oriented-Programming-Project/main/Output/Output-4_SKIPPED-QUESTION-HANDLING.png" width="700">

---

### 🧮 5. Comprehensive Results Display

<img src="https://raw.githubusercontent.com/EnzoFarai/Object-Oriented-Programming-Project/main/Output/Output-5_COMPREHENSIVE-RESULTS-DISPLAY.png" width="700">

---

### ⚠️ 6. Error Handling Demonstration

<img src="https://raw.githubusercontent.com/EnzoFarai/Object-Oriented-Programming-Project/main/Output/Output-6_ERROR-HANDLING-DEMONSTRATION.png" width="700">

---

## Author

Developed by **Farai Edwin Masawi, 24BCA10007**
BCA — Chandigarh University
(2025)
