# Final Report: Image Processing with FPGA

## Overview
This project involved the development of a custom image processing hardware IP targeting FPGA-based acceleration on the PYNQ platform. The initial implementation delivered a streaming box blur filter using a **3×3 kernel** for **grayscale images** (8-bit per pixel), supporting real-time processing via AXI-Stream interfaces. In the final phase, this design was scaled to support a **7×7 kernel** and **24-bit color images**, enabling the IP to handle more complex image processing tasks on relatively higher-resolution inputs (up to 1024×1024 pixels).

## Phase 2 Recap: 3×3 Box Blur IP
The **3×3 box blur IP** was designed around a pipelined streaming architecture with three main modules:

- **Input Line Buffers**: Store rows of incoming pixel data. Three consecutive rows are buffered using circular line buffers to enable 3×3 window formation at each clock cycle.
- **Buffer Controller**: A finite state machine orchestrates read/write operations from the buffers, assembles 3×3 pixel windows, and ensures valid data is passed to the kernel in a streaming fashion.
- **Convolution Kernel**: Performs the averaging filter operation over a 3×3 window by summing pixel values and dividing the result by 9. The kernel has a fixed latency of 2 cycles and operates in a fully pipelined manner.

The module was verified using a custom Verilog testbench, demonstrating efficient processing of a 512×512 grayscale image in approximately **2.52 milliseconds**. The IP was packaged and integrated into a Vivado block design targeting the PYNQ-Z1 board. However, overlay generation for Python-based deployment was incomplete at that time.
