# Final Report: Image Processing with FPGA

## Overview
This project involved the development of a custom image processing hardware IP targeting FPGA-based acceleration on the PYNQ platform. The initial implementation delivered a streaming box blur filter using a **3×3 kernel** for **grayscale images** (8-bit per pixel), supporting real-time processing via AXI-Stream interfaces. In the final phase, this design was scaled to support a **7×7 kernel** and **24-bit color images**, enabling the IP to handle more complex image processing tasks on relatively higher-resolution inputs (up to 1024×1024 pixels).

## 3×3 Box Blur IP
The **3×3 box blur IP** was designed around a pipelined streaming architecture with three main modules:

- **Input Line Buffers**: Store rows of incoming pixel data. Three consecutive rows are buffered using circular line buffers to enable 3×3 window formation at each clock cycle.
- **Buffer Controller**: A finite state machine orchestrates read/write operations from the buffers, assembles 3×3 pixel windows, and ensures valid data is passed to the kernel in a streaming fashion.
- **Convolution Kernel**: Performs the averaging filter operation over a 3×3 window by summing pixel values and dividing the result by 9. The kernel has a fixed latency of 2 cycles and operates in a fully pipelined manner.

The module was verified using a custom Verilog testbench, demonstrating efficient processing of a 512×512 grayscale image in approximately **2.52 milliseconds**. The IP was packaged and integrated into a Vivado block design targeting the PYNQ-Z1 board. However, overlay generation for Python-based deployment was incomplete at that time.

## 7×7 Box Blur IP
To extend functionality, we developed a 7×7 box blur IP that supports **24-bit RGB images** and higher resolutions (up to **1024×1024**). Enhancements include:

- Support for larger kernel size and deeper window generation logic.
- Expanded buffer management to handle increased data bandwidth.
- Color image compatibility with 24-bit pixel width.

Both **3×3** and **7×7** kernels are now implemented as separate IP blocks, packaged and bitstream-ready. However, additional optimization is required to improve synthesis performance and resource usage.

## Compatibility and Comparison with Existing Overlays

We have implemented our IPs with Zynq Processing System and generated bistream out of it, but we weren't able to use them in the Jupyter notebook in Pynq Z1 board, as our IPs are currently not compatible with OpenCV’s Python interface, and making direct comparison with OpenCV APIs unsuitable. Instead, we explored and benchmarked an existing overlay: `xv2Filter2DDilate.bit` from the [PYNQ ComputerVision repository](https://github.com/Xilinx/PYNQ-ComputerVision).

### Observations:

- This overlay supports only 3×3 kernels for filters like **Box**, **Gaussian**, **Sobel** and more.
- Regardless of the filter type, the execution time remains nearly identical due to floating-point operations for every pixel.
- The overlay is flexible but **limited to 3×3 kernels** and does not allow customization for larger filters.

## Building a Custom xfOpenCV Overlay

To support custom filters like our **7×7 box blur**, we explored building a user-defined overlay using `xfOpenCV` and `SDx` cross-compilation tools.


### Prerequisites

1. **Clone the PYNQ Computer Vision Repository**:
   ```bash
   git clone https://github.com/Xilinx/PYNQ-ComputerVision.git <your_pynqcv_folder>
   ```

2. **Clone the xfOpenCV Repository**:
   ```bash
   git clone https://github.com/denolf/xfopencv.git <your_xfopencv_folder>
   cd <your_xfopencv_folder>
   git checkout <release_number>
   ```
3. **Prepare Platform Package:**:
- Download the platform sysroot archive and untar it.

4. **Set Environment Variables:**:
   ```bash
   setenv XFOPENCV_PATH <your_xfopencv_folder>
   ```

5. **Source the Xilinx SDx Tools:**:
- Use the SDx 2018.3 setup script.



## Building a Custom xfOpenCV Overlay

To build a custom xfOpenCV overlay, follow these steps:

---

### 1. Create a New Overlay Folder

```bash
cd <your_pynqcv_folder>/overlays
mkdir myFirstOverlay
```



