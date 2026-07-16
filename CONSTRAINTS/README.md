# Constraints Directory (`/CONSTRAINTS`)

This folder holds the timing and environmental rules for your ASIC design. 

In digital design, writing RTL (Verilog/SystemVerilog) is only half the battle. The synthesis tool (Cadence Genus) does not know how fast your chip needs to run or what the physical outside world looks like. The script in this folder, **`cons.tcl`**, provides these missing physical and timing rules.

---

## 📜 File Overview: `cons.tcl`

This script is written in Tcl and uses standard SDC (Synopsys Design Constraints) commands. It is automatically executed during the synthesis flow. Here is a beginner-friendly breakdown of what each section does:

### 1 & 2. Clock Definitions and Master Clocks
```tcl
create_clock -name $CLK1 -period 20.0 [get_ports REF_CLK]
```
These sections define the "heartbeats" of your system. 
* **`REF_CLK`**: Defined as a 50MHz clock (20ns period).
* **`UART_CLK`**: Defined as a ~3.68MHz clock (271.267ns period).
The `create_clock` command tells the tool to treat these specific input ports as ideal clock sources.

### 3. Generated Clocks
Your design internally modifies the master clocks. We must explicitly tell the tool about this so it can track the timing accurately:
* **`UART_RX_CLK` & `UART_TX_CLK`**: Clocks created by your `Integer_Clock_Divider` modules. We tell the tool how much the master clock is divided by.
* **`ALU_CLK`**: A clock created by a Clock Gating cell (`CLK_GATE`). We mark it as `-combinational` because it is gated by combinational logic rather than a standard flip-flop divider.

### 4. Clock Uncertainty (Jitter & Skew)
In the real world, clocks are not perfect. They fluctuate slightly due to temperature, voltage, and physical routing distances. 
* We add a **0.2ns setup skew** and a **0.1ns hold skew** to all clocks. This forces the synthesis tool to work a little harder and build a safety margin into your paths.

### 5. Clock Relationships (Asynchronous Groups)
Because your `REF_CLK` (50MHz) and `UART_CLK` (3.68MHz) are not mathematically related and run independently, data crossing between them can cause metastability. 
* We use `set_clock_groups -asynchronous` to tell the tool: *"Do not try to meet strict timing between these two domains. I have manually added Async FIFOs and 2-flop synchronizers in the RTL to handle it safely."*

### 6. I/O Delays
Signals take time to travel across the PCB before they reach your chip, and external chips need time to process signals sent by your chip.
* **`set_input_delay` & `set_output_delay`**: We deduct 20% of the clock period from the available time for UART inputs/outputs. This guarantees the synthesis tool leaves enough timing margin for the external components.

### 7. Environmental Constraints & DRCs (Crucial for ASIC)
If we do not include these, the tool assumes your chip is running in a perfect, frictionless void.
* **`set_input_transition`**: Tells the tool that incoming signals won't be perfect square waves; they will take 0.5ns to rise/fall.
* **`set_load`**: Tells the tool that your output ports will be driving a 10.0 physical capacitance load, forcing it to insert adequately sized output buffers.
* **`set_max_transition` & `set_max_capacitance`**: Design Rule Constraints (DRCs) that prevent the tool from creating internal nets that are too long or fan out to too many gates without inserting buffers.

---

## 🛠️ How it Fits into the Flow

You do not need to run this file directly! 

If you look inside the `/SYNTHESIS/synth.tcl` script, you will see the following line:
```tcl
source cons.tcl
```
When you run synthesis, Genus automatically pulls in these constraints right before it maps your logic to physical gates. 

---

