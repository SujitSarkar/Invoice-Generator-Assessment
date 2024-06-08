# Sujit Car Rent

## Description
This is a simple invoice generation app based on user input.

# Instruction to download project from git and run locally
To run the Flutter project locally by cloning the repository from this (https://github.com/SujitSarkar/Invoice-Generator-Assessment) link, follow these instructions:

### Note:
make sure you have flutter SDK installed in your machine (Windpws, Mac, Linux). If not then follow the instruction from this (https://flutter.dev/) link.

### Clone the Repository:
Open your terminal or command prompt and run the following command to clone the repository:

```https://github.com/SujitSarkar/Invoice-Generator-Assessment.git```

### Navigate to the Project Directory:
Move into the cloned project directory using the cd command:

```cd Invoice-Generator-Assessment```

### Install Dependencies:
Once you are inside the project directory, run the following command to install the required dependencies:

```flutter pub get```

### Run the Project:
After the dependencies are installed, you can run the Flutter project using the following command:

```flutter run```

This command will build the project and launch it on a connected device or emulator.

### Verify Installation:
Once the build process is complete, you should see the Flutter app running on your device or emulator.

That's it! You have successfully cloned the Flutter project from the given repository and run it on your local environment. You can now explore the project.

## Problem:
Let's say you have a Tesla in your system that charges $10 per hour and $50 per day. What occurs now if the car is rented for six hours? Is the customer willing to pay more than the daily rate for one-fourth of the period? Regarding the hourly, daily, and weekly rate systems, how do you handle this issue?

## Solution:
```dart
import 'dart:math' as math;

double calculateMinimumCost(
    int hours,
    int days,
    int weeks,
    double hourlyRate,
    double dailyRate,
    double weeklyRate,
  ) {
    final double hourlyCost = math.min((hours.toDouble() * hourlyRate), dailyRate);
    final double dailyCost = math.min((days.toDouble() * dailyRate), weeklyRate);
    final double weeklyCost = weeks * weeklyRate;
    return hourlyCost + dailyCost + weeklyCost;
  }
  ```
Step-1: Compare the cost between hourly-cost and daily-rate then take the minimum one as a hourly-cost.<br>
Step-2: Compare the cost between daily-cost and weekly-rate then take the minimum one as a daily-cost.<br>
Step-3: Calculate the weekly-cost.<br>
Step-4: Now return the sum of all three cost.<br>

In this way we can solve the following problem.