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

1. **Prerequisites**: Ensure you have a C++ compiler installed (GCC, Clang, or MSVC)

2. **Compile the code**:
   ```bash
   g++ -std=c++11 -o quiz quiz.cpp
   ```
   or for C++14/17:
   ```bash
   g++ -std=c++17 -o quiz quiz.cpp
   ```

3. **Run the program**:
   ```bash
   ./quiz
   ```

4. **On Windows** (if using MinGW or similar):
   ```cmd
   g++ -o quiz quiz.cpp
   quiz.exe
   ```

---

## Program Output Showcase

### 1. 🖥️ Program Initialization
![Program Initialization](https://raw.githubusercontent.com/EnzoFarai/Object-Oriented-Programming-Project/main/Output/Output-1_PROGRAM-INITIALIZATION.png)

*The application starts with a welcome message and displays the first question with multiple choice options.*

### 2. ✅ Correct Answer Scenario
![Correct Answer Scenario](https://raw.githubusercontent.com/EnzoFarai/Object-Oriented-Programming-Project/main/Output/Output-2_CORRECT-ANSWER-SCENARIO.png)

*When a user selects the correct answer, immediate positive feedback is provided.*

### 3. ❌ Incorrect Answer with Explanation
![Incorrect Answer with Explanation](https://raw.githubusercontent.com/EnzoFarai/Object-Oriented-Programming-Project/main/Output/Output-3_INCORRECT-ANSWER-WITH-EXPLANATION.png)

*Incorrect answers display detailed explanations to enhance learning and understanding.*

### 4. ⏭️ Skipped Question Handling
![Skipped Question Handling](https://raw.githubusercontent.com/EnzoFarai/Object-Oriented-Programming-Project/main/Output/Output-4_SKIPPED-QUESTION-HANDLING.png)

*Skipped questions show the correct answer with explanation, ensuring learning opportunity.*

### 5. 🧮 Comprehensive Results Display
![Comprehensive Results Display](https://raw.githubusercontent.com/EnzoFarai/Object-Oriented-Programming-Project/main/Output/Output-5_COMPREHENSIVE-RESULTS-DISPLAY.png)

*Final results show total score, percentage, time taken, and performance feedback.*

### 6. ⚠️ Error Handling Demonstration
![Error Handling Demonstration](https://raw.githubusercontent.com/EnzoFarai/Object-Oriented-Programming-Project/main/Output/Output-6_ERROR-HANDLING-DEMONSTRATION.png)

*Robust error handling for invalid inputs with clear instructions for correction.*

---

## Code Structure

### Main Classes:

1. **Question** (Base Class)
   - Stores question text, options, correct answer, and explanation
   - Virtual methods for display and answer validation

2. **TimedQuestion** (Derived Class)
   - Inherits from Question
   - Adds timing functionality for individual questions

3. **QuizManager**
   - Manages the quiz flow and question sequence
   - Handles scoring and timing
   - Provides user interaction

### Key Methods:
- `displayQuestion()`: Shows question and options
- `checkAnswer()`: Validates user input
- `calculateScore()`: Computes final results
- `showResults()`: Displays comprehensive feedback

---

## Sample Questions

The quiz includes 12 questions covering:
- Class and Object concepts
- Inheritance and Polymorphism
- Constructors and Destructors
- Memory management in C++
- Virtual functions and Abstract classes
- Operator overloading and Templates

---

## Learning Outcomes

By studying this code, you'll understand:
- Practical implementation of OOP principles in C++
- Proper memory management using dynamic allocation
- Polymorphism through inheritance and virtual functions
- Time measurement using chrono library
- Building interactive console applications
- Error handling and input validation

---

## Future Enhancements

Potential improvements for this application:
- Add file I/O to load questions from external files
- Implement different difficulty levels
- Add category-based question selection
- Include graphical user interface (GUI)
- Add user authentication and score history
- Implement randomized question order

---

## Author

**Farai Edwin Masawi**  
**24BCA10007**  
BCA — Chandigarh University  
(2025)

---

## License

This project is open source and available under the [MIT License](LICENSE).

---

## Author

Developed by **Farai Edwin Masawi, 24BCA10007**
BCA — Chandigarh University
(2025)
