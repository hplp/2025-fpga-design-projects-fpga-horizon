
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
- Software Tools: Vivado Design Suite, ModelSim, MATLAB (for filter verification), Vitis-HLS
- Peripheral Interfaces: Camera Module (input), HDMI/VGA (output)

## Expected Outcomes:
- 4 standalone Verilog filter modules: Gaussian Filter, Moving Average Filter, and Grayscale Conversion, validated using synthetic and real image data.
- Fully functional image processing pipeline with MUX-based filter selection.
- Real-time demonstration: Live camera input → FPGA filter pipeline → HDMI video output.
- Performance metrics: Frames Per Second (FPS), logic element utilization, maximum clock frequency, latency per pixel/frame, and power consumption estimates.

## Tasks:
## Phase 1 :

- Finalize project proposal and team roles.

- Review literature on FPGA-based image filtering.

## Phase 2 :

- Develop individual Verilog modules for each filter.

- Implement testbenches to verify functionality.

## Phase 3 :

- Integrate all modules into a single pipeline.

- Implement user controls for selecting filters.

## Phase 4 :

- Test the design on FPGA hardware.

- Optimize for performance and resource usage.
## Timeline:
(Provide a timeline or milestones for the project)
