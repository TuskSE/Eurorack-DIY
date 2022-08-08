View this project on [CADLAB.io](https://cadlab.io/project/24780). 

# Eurorack DIY
 An assortment of Schematics and PCB layouts for synthesizer modules in the Eurorack Format.  PCB layouts mostly use big surface mount parts ( e.g. SOIC IC's, 0804 passives ) except for electrolytics. I try as much as possible to limit the BOM to parts from Tayda Electronics - exceptions are mostly MCU boards and synthesizer-specific ICs. All schematic and PCB files are in KiCAD format, but not all have been updated yet for KiCAD v6. See below for a brief overview of projects.
 
 
# Modules

**Bandpass Filter **
A bank of 3 bandpass filters, with options mixing and phase inversion options. Schematics mostly complete, awaiting PCB layout. 

**CP3 Mixer**
A very generic transistor-type mixer. PCB layout complete, awaiting fabrication.

<img src="Modules/CP3%20mixer/pics/CP3_mixer.png" height = 300 >

**Dual VCO**
A pair of utility VCOs/LFOs derived from the NonLinearCircuits Dual LFO/VCO, but with added FM inputs ( log on one, lin on the other ) and no sync inputs. PCB layout essentially finished, but I want to go back and rethink the voltage reference before sending it for fabrication.

<img src="Modules/Dual%20LFO-VCO/pics/Dual%20VCO%20-%20front.png" height = 300 >    <img src="Modules/Dual%20LFO-VCO/pics/Dual%20VCO%20-%20back.png" height = 300 >

**Fractional Clock Divider** 
A module to generate fractional divisions/multiplications of a clock signal and euclidean rhythms (which are basically fractional divisions, but quantized). The output can also be delayed / phase shifted. Built around a Teensy LC MCU board. This is "complete" and works, but in practise a lack of visual feedback in the UI makes it unintuitive and not fun to use - at some point I'll build something new and better around the same ideas. 

<img src="Modules/Fractional%20Clock%20Divider/pics/fcd.png" height = 300 >    <img src="Modules/Fractional%20Clock%20Divider/pics/fcd%20photo.png" height = 300 >

**Function Generator**
A variation on the Kassutronics slope, which in turn is a variation on the Serge Dual Universal Function Generator. The main notable addition is a hold input. PCB layout complete, awaiting fabrication. 

<img src="Modules/Function%20generator/pics/fgen%20front.png" height = 300 >    <img src="Modules/Function%20generator/pics/fgen%20back.png" height = 300 >

**Precision multiple**
4 buffered multiples: 2 are high-precision ( i.e. voltage is reproduced accurately enough to use for pitch CV ), all 4 have red/green LED indicators. There are only minor problems with the current PCB ( e.g. two of the LED footprints are the wrong way round ). 

<img src="Modules/Precision%20Mult/pics/mult.jpg" height = 300 >

**Threshold Logic Neuron** 
A Threshold Logic Neuron ( McCulloch–Pitts neuron ), inspired by a module from Analogue Research. In addition to serving as a programmable logic gate, the internal summing node has a dedicated output which can be used for the generation of stepwise CVs from boolean inputs. PCB layout just needs double-checking - otherwise, awaiting fabrication. 

<img src="Modules/Logic%20Neuron/pics/ln%20Front.png" height = 300 >    <img src="Modules/Logic%20Neuron/pics/ln%20Back.png" height = 300 >

**Precision Attenuverter**
A utility set of 4x attenuverters and cascading mixer, a.la fonitronik cascade. The first input can be calibrated so that "1x" attenuation ( knob fully CW ) is precise enough to use for pitch CV. The first batch of these had some PCB errors ( hard-to-solder footprints, back-to-front pots, etc ) which should be fixed in the current design ( March 2021 ), but I haven't fabbed it yet. I think the knob spacing is too tight - I plan to redo the layout with a wider spacing. 

<img src="Modules/Precision%20attenuverter%20mixer/pics/atten%20photo%201.jpg" height = 300 >    <img src="Modules/Precision%20attenuverter%20mixer/pics/atten%20photo%202.jpg" height = 300 >

**Stochastic sequencer**
A huge voltage sequencer project, incorporating elements of repeatable randomness ( like shift-register based sequencers ) and multiple steps per stage ( like the M185 sequencer / Intellijel Metropolis ). Each stage has its own independent voltage output, and the outputs are summed cascade-style until an input is plugged in. Multiple cycles can run in parallel over the 8 stages. The current version of the PCB ( v2 ) is working in terms of core functionality, but needs some minor tweaks. Most of the functionality is coded up, but after writing 1000s of lines of code I realized that the MCU ( Teensy LC ) RAM is insufficient for the functionality that I want, especially with regards to repeatable randomness. I believe the chip for the capacitive touch interface has also gone out of production. I'm still undecided whether to try again with a different MCU + capacitive touch chip, or whether to break the design up into smaller independent modules. 

<img src="Modules/Stochastic%20sequencer/pics/ss%20front.jpg" height = 300 >    <img src="Modules/Stochastic%20sequencer/pics/ss%20back.jpg" height = 300 >

**Tap LFO**
A clock-synced LFO built around the Electric Druid Tap LFO IC. The current version of the PCB layout only needs some small revisions, however I've abandoned it for now - in practise, I think it requires more visual feedback than can be accommodated with the Electric Druid IC. 

<img src="Modules/Tap%20LFO/pics/LFO%20photo.jpg" height = 300 >    <img src="Modules/Tap%20LFO/pics/LFO%20front.png" height = 300 >    <img src="Modules/Tap%20LFO/pics/LFO%20rear.png" height = 300 >

**Quad VCA**
A quad VCA built around the V2164 IC. Each channel has 2 CV attenuverters, one normalized to a 5V input. There's also a panning mixer integrated. v1 of the PCB had a couple of major issues which are awaiting correction. I think I may also rethink the control ranges etc.
 
<img src="Modules/VCA/pics/VCA%20photo.png" height = 300 >    <img src="Modules/VCA/pics/VCA%20board%20photo%202.jpg" height = 300 >

<img src="Modules/VCA/pics/VCA%20front.png" height = 300 >    <img src="Modules/VCA/pics/VCA%20back.png" height = 300 >

**Pedal interface**
Designed as an interface between Eurorack and guitar pedals - schematic still under development. 

**Random trigger generator**
Barely started - still at the UI design phase 
 
# Case designs:

**"Big" case**
A console style case, 2 x 3U x 120HP, with space on top to mount more more cases.
Designed for laser cut 12mm plywood and standard Gie-tec rails.
I've built one of these - the glue up was a bit awkward with the non-square angle of the front piece, but otherwise it works fine and seems very solid. 

<img src="Case%20designs/Big%20case/Photos/IMG_5730.jpg" height = 300 >    <img src="Case%20designs/Big%20case/Photos/IMG_5731.jpg" height = 300 >    <img src="Case%20designs/Big%20case/Photos/IMG_7940.jpg" height = 300 >

**"Test" case**
An 85HP rack with panel cutouts for current monitors and convenient terminals for oscilloscope/multimeter probes. In retrospect this is kind of a dumb idea when these things could have been added as, y'know, modules. A 1U row along the bottom instead would have been nice.
Designed for and laser cut from 5mm bamboo ply, which is attractive but honestly a bit flimsy, especially accross the grain.
 
<img src="Case%20designs/Prototyping%20Case/Photos/IMG_5649.jpg" height = 300 >    <img src="Case%20designs/Prototyping%20Case/Photos/IMG_7942.jpg" height = 300 >
 
 
 
 

 
 
