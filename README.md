
## Team Name: 
FPGA Horizon

## Team Members:
- Rithani Priyanga Coimbatore Kannan (hwu6hc)
- Vishnuvartthan Govindaraj (fpp6vt) 

## Project Title:
Image Processing on FPGA

## Project Description:
The goal of this project is to implement computationally intensive digital image filters on an FPGA platform to achieve real-time image processing. Digital image processing plays a crucial role in a wide range of applications, from video streaming to computer vision and augmented reality. Processing images in real-time can be computationally expensive, especially when applying complex filters to high-resolution images. Software-based solutions struggle with the latency and processing time required for live image analysis, making hardware acceleration through FPGAs more effective.

By accelerating the image filtering process on FPGA hardware, we aim to significantly improve processing time, enabling real-time applications such as video stream processing, edge detection for vision systems, and preprocessing stages for AI-based systems. The FPGA's parallel processing capability will allow for faster data manipulation than general-purpose processors, making it suitable for high-speed image processing tasks. We aim to implement and evaluate multiple image filtering techniques, including:

- Gaussian Filter

- Moving Average Mean

- Grayscale Conversion

By accelerating these filters in hardware, we can enable real-time processing for applications such as live video processing, preprocessing for computer vision applications, and edge computing tasks.

## Key Objectives:
- Design and implement common image filters (Gaussian, Moving Average, Grayscale) on an FPGA.
- Create a pipeline architecture to process images in real time.
- Integrate camera input and HDMI output for a live demonstration.

## Technology Stack:
- Software: Xilinx Vivado, Jupyter Notebook
- Hardware Platform: Xilinx FPGA development board
- Languages: Verilog
- Software Tools: Vivado Design Suite, ModelSim, Vitis-HLS
- Peripheral Interfaces: Camera Module (input), HDMI (output)

## Expected Outcomes:
- 4 standalone Verilog filter modules: Gaussian Filter, Moving Average Filter, and Grayscale Conversion, validated using synthetic and real image data.
- Fully functional image processing pipeline with MUX-based filter selection.
- Real-time demonstration: Live camera input → FPGA filter pipeline → HDMI video output.
- Performance metrics: Frames Per Second (FPS), logic element utilization, maximum clock frequency, latency per pixel/frame, and power consumption estimates.

## Tasks:
## Tasks & Assignments

### Task 1: Research & Design Specifications 
**Assigned to:** Rithani & Vishnu 
- Study digital filtering math (Gaussian kernel, mean, etc.) 
- Choose filter coefficients, kernel dimensions, and fixed-point format

---

### Task 2: Verilog IP Block Development
**Assigned to:** Rithani 
- Gaussian Blur: Implement weighted convolution logic using line buffers 
- Moving Average: Use adder trees and bit-shift logic for fast averaging 
- Grayscale: Apply fixed-point approximation of RGB-to-grayscale formula

---

### Task 3: Simulation & Testbenching 
**Assigned to:** Vishnu
- Write Verilog testbenches for all modules
- Validate outputs against MATLAB filters
- Analyze waveform timing and correctness

---

### Task 4: Pipeline Integration 
**Assigned to:** Both 
- Combine all filters into Pynq-Z1 FPGA using Vivado
- Implement runtime control logic to switch between filters 
- Create buffer system for input/output pixel synchronization

---

### Task 5: Hardware I/O Integration 
**Assigned to:** Rithani 
- Capture input from camera 
- Format pixel stream for filter pipeline 
- Display final image to HDMI interface

---

### Task 6: Optimization & Documentation 
**Assigned to:** Vishnu
- Optimize clock domains, pipeline latency, and resource usage 
- Collect power estimates, maximum frequency, and utilization stats 


---

## Timeline & Milestones

| Week | Deliverables |
|------|--------------|
| **Week 1** | Finalize design scope and roles, research filtering algorithms |
| **Week 2** | Implement and test grayscale + moving average modules |
| **Week 3** | Implement Gaussian filter and verify via testbenches |
| **Week 4** | Integrate filters into a single pipelined system |
| **Week 5** | Interface with camera and output to HDMI |
| **Week 6** | Run real-time tests and collect performance data |
| **Week 7** | Optimize design, complete documentation and demonstration |

---

## References

- Gonzalez, R. C., & Woods, R. E. *Digital Image Processing* 
- Xilinx Vivado IP & VTC Documentation 
- Camera Datasheet 
- Various open-source Verilog image filter repositories 
- MATLAB Image Processing Toolbox
