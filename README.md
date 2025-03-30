# FPGA Digital Clock

## Overview
This project implements a **Digital Clock** on an FPGA using Verilog. The design utilizes a **clock divider** to generate a 1Hz signal, a **counter** for tracking hours, minutes, and seconds, and **seven-segment displays** or an **LCD** for output.

## Features
- Displays **HH:MM:SS** format on a seven-segment display or LCD.
- 24-hour format.
- **Adjustable time** using input buttons (optional).
- **Clock divider** for generating a 1Hz pulse from the FPGA's onboard clock.
- **Synchronous reset** for resetting the clock to `00:00:00`.

## Module Description
### 1. Clock Divider
Converts the high-frequency FPGA clock (e.g., 50MHz) into a 1Hz pulse for second counting.

### 2. Counter Logic
Handles **seconds, minutes, and hours** with appropriate carry conditions:
- 60 seconds → increment minutes
- 60 minutes → increment hours
- 24 hours → reset to `00:00:00`

### 3. Display Driver
- Uses a **multiplexing technique** to display digits on a **seven-segment display**.
- Converts binary values to **BCD format** for human-readable output.

## Module Interface
### Inputs
| Signal       | Width | Description                |
|-------------|-------|----------------------------|
| `clk`       | 1-bit | System clock (e.g., 50MHz) |
| `rst`       | 1-bit | Reset signal               |
| `set_hour`  | 1-bit | Increment hour (optional)  |
| `set_min`   | 1-bit | Increment minute (optional) |

### Outputs
| Signal          | Width  | Description                  |
|----------------|--------|------------------------------|
| `hh`           | 6-bit  | Hours (0-23)                 |
| `mm`           | 6-bit  | Minutes (0-59)               |
| `ss`           | 6-bit  | Seconds (0-59)               |
| `seven_seg`    | 7-bit  | Output to seven-segment display |

## Implementation Steps
1. **Clock Divider**: Generate a 1Hz clock from the FPGA’s onboard clock.
2. **Seconds Counter**: Increment on every 1Hz pulse, reset at `60`.
3. **Minutes Counter**: Increment when seconds reset, reset at `60`.
4. **Hours Counter**: Increment when minutes reset, reset at `24`.
5. **Display Driver**: Convert time values into seven-segment display signals.

## FPGA Board Compatibility
- **Nexys A7**

- Any FPGA board with an onboard clock of **100MHz or similar**.

## Future Enhancements
- Add **AM/PM indicator** for 12-hour format.
- Implement **alarm functionality**.
- Add **real-time clock (RTC) module** for accurate timekeeping.
- Support **LCD/OLED display** for better visualization.

## License
This project is open-source and licensed under the MIT License.

## Contributors
- **Your Name** - Bolisetty Thulasi Vignan
  

