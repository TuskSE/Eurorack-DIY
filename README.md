View this project on [CADLAB.io](https://cadlab.io/project/24780). 

# Eurorack DIY
 An assortment of Schematics and PCB layouts for synthesizer modules in the Eurorack Format.  PCB layouts mostly use big surface mount parts ( e.g. SOIC IC's, 0804 passives ) except for electrolytics. I try as much as possible to limit the BOM to parts from Tayda Electronics - exceptions are mostly MCU boards and synthesizer-specific ICs. All schematic and PCB files are in KiCAD format, but not all have been updated yet for KiCAD v6. See below for a brief overview of projects.
 
 
# Modules

**Bandpass Filter **
A bank of 3 bandpass filters, with options mixing and phase inversion options. Schematics mostly complete, awaiting PCB layout. 

**CP3 Mixer**
A very generic transistor-type mixer. PCB layout complete, awaiting fabrication.

<img src="Modules/CP3 mixer/pics/CP3%20mixer.png" height = 100 >

**Dual VCO**
A pair of utility VCOs/LFOs derived from the NonLinearCircuits Dual LFO/VCO, but with added FM inputs ( log on one, lin on the other ) and no sync inputs. PCB layout essentially finished, but I want to go back and rethink the voltage reference before sending it for fabrication.

**Fractional Clock Divider** 
A module to generate fractional divisions/multiplications of a clock signal and euclidean rhythms (which are basically fractional divisions, but quantized). The output can also be delayed / phase shifted. Built around a Teensy LC MCU board. This is "complete" and works, but in practise a lack of visual feedback in the UI makes it unintuitive and not fun to use - at some point I'll build something new and better around the same ideas. 

**Function Generator**
A variation on the Kassutronics slope, which in turn is a variation on the Serge Dual Universal Function Generator. The main notable addition is a hold input. PCB layout complete, awaiting fabrication. 

**Precision multiple**
4 buffered multiples: 2 are high-precision ( i.e. voltage is reproduced accurately enough to use for pitch CV ), all 4 have red/green LED indicators. There are only minor problems with the current PCB ( e.g. two of the LED footprints are the wrong way round ). 

**Threshold Logic Neuron** 
A Threshold Logic Neuron ( McCulloch–Pitts neuron ), inspired by a module from Analogue Research. In addition to serving as a programmable logic gate, the internal summing node has a dedicated output which can be used for the generation of stepwise CVs from boolean inputs. PCB layout just needs double-checking - otherwise, awaiting fabrication. 

**Pedal interface**
Designed as an interface between Eurorack and guitar pedals - schematic still under development. 

**Attenuverter**
A utility set of 4x attenuverters and cascading mixer, a.la fonitronik cascade. The first input can be calibrated so that "1x" attenuation ( knob fully CW ) is precise enough to use for pitch CV. The first batch of these had some PCB errors ( hard-to-solder footprints, back-to-front pots, etc ) which should be fixed in the current design ( March 2021 ). However, I think the knob spacing is too tight - I plan to redo the layout with a wider spacing. 

**Random trigger generator**
Barely started - still at the UI design phase 

**Stochastic sequencer**
A huge voltage sequencer project, incorporating elements of repeatable randomness ( like shift-register based sequencers ) and multiple steps per stage ( like the M185 sequencer / Intellijel Metropolis ). Each stage has its own independent voltage output, and the outputs are summed cascade-style until an input is plugged in. Multiple cycles can run in parallel over the 8 stages. The current version of the PCB ( v2 ) is working in terms of core functionality, but needs some minor tweaks. Most of the functionality is coded up, but after writing 1000s of lines of code I realized that the MCU ( Teensy LC ) RAM is insufficient for the functionality that I want, especially with regards to repeatable randomness. I believe the chip for the capacitive touch interface has also gone out of production. I'm still undecided whether to try again with a different MCU + capacitive touch chip, or whether to break the design up into smaller independent modules. 

**Tap LFO**
A clock-synced LFO built around the Electric Druid Tap LFO IC. The current version of the PCB layout only needs some small revisions, however I've abandoned it for now - in practise, I think it requires more visual feedback than can be accommodated with the Electric Druid IC. 

**Quad VCA**
A quad VCA built around the V2164 IC. Each channel has 2 CV attenuverters, one normalized to a 5V input. There's also a panning mixer integrated. v1 of the PCB had a couple of major issues which are awaiting correction. I think I may also rethink the control ranges etc.
 
 
 
# Case designs:

**"Big" case**
A console style case, 2 x 3U x 120HP, with space on top to mount more more cases.
Designed for laser cut 12mm plywood and standard Gie-tec rails.

**"Test" case**
An 85HP rack with panel cutouts for current monitors and convenient terminals for oscilloscope/multimeter probes.
Laser cut from 5mm bamboo ply, which is attractive but honestly a bitflimsy 
 
 
 
 
 
 

 
 
