# ssf2xj-turbo-fix

Modifies SSF2XJ's turbo handling to eliminate level speed variations.


Mame Installation:
 Apply each of the IPS files to the corresponding rom files from either the ssf2xjr1d or ssf2xjdi unencrypted rom sets.

 
For MiSTer users a MRA file has been supplied, ssf2xjr1d will need to be available on the device.


About this hack:

  The original SSF2X turbo algorithm functions by having a thread increment the turbo counter multiple times each frame.
  
  When the counter is above the turbo threshold (this value is different for each turbo setting) a turbo frame is calculated and the counter is reset.
  
  The number of times the turbo counter is incremented each frame is dependent on the stage, more complex stages (more objects moving about, etc) have less processor time remaining to increment the count.
  
  This results in stages having different speeds, faster stages increment the counter more often and have more frequent turbo frames.
  
  This hack increments the turbo count a single time each frame by a static amount, normalizing the speed of stages.
  
  However, because the turbo frames now happen IMMEDIATELY AFTER the real frame the chance of a successful reversal move is slightly reduced.
  
  The original turbo mechanism had a random chance of producing a turbo frame directly in between the two real frames, which would result in an input read that could potentially result in reversal.
  
  An enhancement to this turbo fix would be to use the raster interrupt to perfectly time all turbo frames to the optimal point in the frame.

  However this is slightly tricky due to the raster interrupts use in several stages to change layer priorities mid frame.