---
tags: []
aliases: []
created: 17. September 2023
---

# Altium Designer - PCB Design Unit 1

## Introduction and Important Terminology

Welcome to the Altium Academy Printed Circuit Board design course! Throughout this course, you’ll be introduced to important ideas involved in PCB design, manufacturing, and assembly. You’ll also get some exposure to industry-standard PCB design software, and you’ll have a chance to use this software to build your own PCB. Hopefully, by the end of the course, you’ll have enough knowledge to design some simpler PCBs and to start taking more advanced industry-level circuit board design and manufacturing courses.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/https://www.filepicker.io/api/file/aid43TXSd2zMUUfgvJv0)

PCB design is as much art as it is science. Some of the important concepts in PCB design rely heavily on knowledge from your prior electronics classes. However, PCB design also requires creativity in how you select components, place them on a circuit board, and connect them with copper. There is also the design of the bare board itself, something that forms the foundation of PCB design and manufacturing. One of the main goals of this course is to give you the knowledge needed to start designing PCBs. We’ll look at examples of real boards to explain why certain design decisions are made and to show how professional designers approach their circuit board designs.

Throughout this course, you’ll have a chance to use Altium Designer, a popular PCB design software package that is used by professionals in the electronics industry. Although some of the lessons and demonstrations will be provided using Altium Designer, you should be able to perform the tasks shown in this course using any other PCB design software application. Guides and walkthroughs will be shown using Altium Designer, so students are encouraged to follow along on their own using an Altium student license, or using a different CAD program.

## What is Printed Circuit Board Design?

If you’ve ever opened up an old laptop or smartphone, then you’ve already seen an example of a printed circuit board (PCB). While PCBs can come in all shapes and sizes, they all have common characteristics that are considered during design. A PCB can be very simple, just involving a few components, or they can be very complex, involving thousands of small components and interconnections. All PCBs should be designed while considering the manufacturing process to ensure that a new product can be produced at scale.

### Why is Printed Circuit Board Design Important?

PCBs represent the intersection between all the major types of electronic equipment. Without PCBs, integrated circuits would not be able to connect to communicate with each other in a low-noise environment. It would not be possible to produce products like computers, televisions, modern automobiles, smart phones, satellites, aircraft, and many other devices in their current form. Printed circuit boards do more than just provide a place to put integrated circuits, they provide a way to create very reliable connections between components that can also be manufactured at very high volume.

To a beginner, a circuit board might be seen as an overblown method for connecting electronic components together. This is understandable when looking at the surface of some circuit boards. However, once you look below the surface and into the interior layers of a circuit board, there is a beautiful complexity that provides the connections needed to make modern electronics work. In the past, electronics could be freely strung together with hanging wires, but the nature of modern integrated circuits continually forces design engineers to keep innovating and find new ways to make their designs work as intended.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/https://www.filepicker.io/api/file/0JgwvnWkTWGPLCx71NGI)

_Complex designs like this server motherboard force PCB designers to continuously innovate._

If you look around your own home and think about the number of electronic devices you own, it’s important to note that any of these devices could contain at least one circuit board. It’s highly likely that, at any given moment, you’re surrounded by a dozen or more circuit boards. PCBs are truly the backbone of modern electronics.

## PCB Design Software

At the center of PCB design is the use of specialized electronics CAD (ECAD) software. An entire industry has developed around ECAD tools for PCB design, as well as specialized electrical simulators that are used to evaluate designs before they are manufactured. There is also a host of manufacturing software that is used to prepare a design for fabrication and assembly using automated machinery, called computer aided manufacturing (CAM) software. In this course, we won’t focus so much on using CAM software, although we will look at the steps needed to take a finished design and prepare it for manufacturing.

If you look at printed circuit board design software, the view you see may not be the most intuitive. The view you get in ECAD software does not look very much like an actual circuit board you might pull out of your computer or smartphone. In fact, compared to something like a mechanical design, the circuit board you see in your ECAD software may look very strange.

The image below shows an example of a circuit board layout in Altium Designer. This layout may not clearly resemble a real, assembled PCB you would find in an off-the-shelf product. One goal of this course is to teach you how to navigate one of these CAD drawings and identify various structures within the drawing.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/https://www.filepicker.io/api/file/146oaPNQSqSIrlCYfu8T)

_An example PCB layout in Altium Designer._

While it may not be obvious, this circuit board is actually the motherboard for a small computer, and it is available as a sample project within Altium Designer. In this view, we’re only looking at the features in the top-most layer of the board. This board is actually very complex, comprising multiple layers and components on both sides of the board. We’ll return to this layout periodically to show some examples of common features found in PCBs.

## Some Basic Terms to Help You Get Started in This Course

There is some important terminology that is used to describe PCBs, and this terminology will be used throughout the course in various locations. All of the important terminology has been compiled into a [course glossary](https://edcamp.us/p/glossary), you should refer to this document periodically as you work through the course. Some of the important terms to help you get started and progress through the rest of this unit are listed here:

|     |     |
| --- | --- |
| **Components**    |     | 

 This can refer to anything that can be soldered onto a PCB. Examples include resistors, capacitors, connectors, and integrated circuits. A component is also an object in a CAD program, and it may refer to a physical feature that is not soldered onto the board.

**Printed circuit board (PCB or circuit board):** Refers to the bare board design without any of the assembled components.

**PCB layout:** A CAD drawing showing the location of all elements that will appear on an assembled PCB. This includes all components and copper that will appear on both sides of a PCB.

**Trace:** A copper connection made between two components in a PCB layout. A trace is sometimes called a “track”.

**Layers:** All PCBs can have multiple layers, which will include copper connections and components. Internal layers only contain copper, which are only used to make electrical connections. There are two types of layers in any PCB: plane layers and signal layers. A plane layer has a large, uninterrupted copper region that covers the entire layer. A signal layer only contains copper traces that connect the PCB components.

**Multilayer PCB:** This term refers to any circuit board that has more than two copper layers in total.

**PCB stackup:** Also called a layer stack, this term refers to the arrangement of layers used to build a bare printed circuit board.

**Schematic sheets:** Drawings that show how components are connected to each other, similar to a circuit diagram.

**PCB fabrication:** Refers to the first half of the manufacturing process, where each layer of a bare PCB is fabricated and copper features are etched on the PCB.

**PCB assembly (PCBA):** This term has two meanings. It is often used as a noun, referring to a fully assembled PCB. It also refers to the PCB assembly process, where components are soldered onto a bare PCB. In this course, we will normally write “PCBA” for the former, and “PCB assembly” for the latter.

**PCB laminate:** Also simply called a laminate, this refers to the insulating material used to separate copper layers and build a PCB stackup.

![](https://cdn.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/https://www.filepicker.io/api/file/5b4axhkQhudeQzPCqUy8)

Like many industries, the electronics industry has developed its own terminology, and you will be exposed to many important terms used by design professionals throughout this course. As the course progresses, new terminology will be introduced as it’s needed, but these terms will come up repeatedly to refer to some of the important physical and electrical aspects of all PCBs.

In the next section, we’ll see how CAD tools are used to create PCBs. These software packages are highly specialized for use in creating a PCB layout and manufacturing files, and using CAD tools will be a major focus in this course.

### Further Reading:

- [How to Become a PCB Designer in Today’s World](https://www.google.com/url?q=https://resources.altium.com/p/how-to-become-a-pcb-designer-in-today-s-world&sa=D&source=editors&ust=1641275385623000&usg=AOvVaw3dN0BriZETnELu6xmrxS-H)
- [Getting Started with PCB Design](https://www.google.com/url?q=https://resources.altium.com/p/getting-started-pcb-design&sa=D&source=editors&ust=1641275385623000&usg=AOvVaw02hjvQaNtcvj-Cd43yHWxK)