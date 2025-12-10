---
tags:
  - Altium
aliases:
created: 8. November 2024
---

# Schematic Sheets

All designs will start with schematic sheets. These files are drawings that show which components are used in the design, the nets used to make electrical connections between components, connections involving power and ground nets, net names, and other notes needed to understand how the design works. 

A PCB design project could have several schematic sheets, all of which show the electrical information in your PCB layout. Schematics show several important pieces of information that are not contained in the PCB layout.

|What’s in schematic sheets|What’s not in schematic sheets|
|---|---|
|- All components that are used in the design  <br>- Nets that make electrical connections between components  <br>- Any components like connectors that may be part of an interconnect  <br>- The power and ground connections on various components  <br>- Port connections used to define nets that span between two sheets|- Physical location of components in a PCB layout  <br>- Whether nets are composed of traces, vias, planes, or polygons  <br>- Whether an interconnect passes through a plane layer, cable, or other element  <br>- Whether planes, traces, connectors, etc. are used to supply power to components  <br>- How copper is routed between ports to create a physical electrical connection|

To see how these different pieces of information are stored in a schematic, consider the example shown below from the MiniPC example project in Altium Designer (introduced briefly in Lesson 1). This example shows a portion of a schematic sheet with a USB bridge chip and two capacitor banks. We can see power nets connected to two capacitor banks (named IO_3V3 and IO_1V8), and these same power nets are connected to the USB bridge.

Because we have the GND net connected to the USB bridge and both of the capacitor banks, we know that these three portions of the design will be connected in the PCB layout with copper. The schematic only shows us that these connections exist; it does not show how they are connected on the PCB. In the PCB layout, we could make this connection with a polygon, plane layer, or traces and vias. How you should make this connection requires some judgement and experience.

There is another net in this schematic sheet named USB3_VBUS. This net connects to a different component in our schematics that is not shown here. It is common to use net names to indicate electrical connections rather than drawing a wire to represent the connection. This prevents unnecessary clutter in a schematic sheet, and this practice allows connections between different schematic sheets to be defined.