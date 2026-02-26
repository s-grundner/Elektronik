# Common [PCB](../Analog-Design/PCB-Layout.md) Files

When designing a [PCB](../Analog-Design/PCB-Layout.md), there are four major types of documents you will need to create a design:

- **Schematic sheets:** Your schematic sheets are like the electrical blueprint for your design. These documents show components, nets, and other information needed to understand the design.
- **Bill of materials:** This document is a list of all components used in the design. It will be used to order components and to aid assembly.
- **[PCB](../Analog-Design/PCB-Layout.md) layout:** This document shows the physical placement of components and copper connections between them. The [PCB](../Analog-Design/PCB-Layout.md) layout document will also describe the layer stack used in the design.
- **PCB libraries:** Your libraries store all of the CAD data for your components (schematic symbols, PCB footprints, 3D models, and SPICE subcircuits). Libraries also store procurement information for each component, including MPN, distributor information, a description of each component, quantities of each component, and possible alternative components.

These four types of documents are the minimum needed to create the physical design for your board, but they aren’t the only documents used in PCB development. The design can’t be prepared for fabrication until the PCB layout is finished. Once the layout is complete, there is another set of fabrication and assembly files that are used in PCB manufacturing processes. We’ll cover manufacturing files in more detail in the next section.