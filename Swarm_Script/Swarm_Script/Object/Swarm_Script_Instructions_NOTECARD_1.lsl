// :CATEGORY:Weapons
// :NAME:Swarm_Script
// :AUTHOR:Anonymous
// :CREATED:2013-09-06
// :EDITED:2013-09-18 15:39:06
// :ID:855
// :NUM:1191
// :REV:1.0
// :WORLD:Second Life
// :DESCRIPTION:
// Swarm Script Instructions [NOTECARD].lsl
// :CODE:

The swarm algorithm in its purest sense creates any number of things that are attracted to each other. Any objects you tie this script to (after modifying the configurable parameters according to your object size, desired speed, etc) behave like social animals. That is, they swarm/flock/school... whatever you want to call it. None of generated movement is random, though it may appear to be. 

Swarm rules for each swarm object to follow: 
1. Accelerate toward the halfway point between your two nearest neighbors. 
2. Upon collision, momentarily be repulsed by whatever object or ground was collided with. 
3. If no neighbors are detected, just keep moving in a straight line at a constant speed. If I go off-world, then so be it. 

The traditional swarm algorithm actually has a few more rules than this, but those rules are rather specific to a single application handling the entire swarm rather than multiple state engines working together. 


The best way of using this script that I have found is to create your swarm object... let's say you want to make a school of fish. Create your fish model. Add the script into your fish. 

Now comes the tricky part: getting the parameters just right. The swarming behavior does not occur until there are at least 3 of your swarm object within 96 meters of each other. When you have the parameters adjusted and are ready to test your swarm, you must rez at least 3 of the current object. An easy way to do this is to be in edit mode and hit ctrl+d twice. Make sure you take a copy of your object BEFORE you start testing, as incorrectly configured objects tend to fly away very fast! You can also set sandbox to TRUE so they don't get too far away. 

Once you have your swarm behaving the way you want it to, make sure you have a timeout set (I generally use 5 minutes) on the swarm object, then create another object that will be the main center point of your swarm. This object will rez new swarm objects every N seconds. This ensures you always have a swarm that is relatively nearby the rezzing object, and in conjunction with the swarm object timeout, ensures you always have a relatively constant number of swarm objects rezzed. The script code for your rezzing object should be something like this (ignore errors... i'm at work right now and don't have access to SL to test this): 



code:--------------------------------------------------------------------------------
default {
    state_entry() {
        llSetTimerEvent(20);
    }
    timer() {
        // Rez in a random location within a 10m cube. Don't use 5 in lieu of 5.0 or you could end up with slightly odd results due to the automatic conversion to integer instead of float.
        vector mypos = llGetPos();
        mypos.x += llFrand(10) - 5.0;
        mypos.y += llFrand(10) - 5.0;
        mypos.z += llFrand(10) - 5.0;
        llRezObject("swarm object", mypos, <0,0,0,1>,<0,0,0> );
    }
}
--------------------------------------------------------------------------------


Once you apply this script to your rezzing object, add your swarm object to its contents and let it go. Congratulations, you now have a completely self-maintaining swarm.  

Oh and please please please please please do not create huge swarms with a ton of swarm objects and just let it stay that way. You'll dump the sim's script and physics performance right in the toilet and end up making all your neighbors angry. Just as an FYI I had a swarm of 25 going in Cordova and did not see any slowdown or performance loss at all, but your mileage may vary. 

Since it is quite obvious that creating a swarm is not something to be tackled by a non-scripter or even someone who doesn't have much patience, I will be selling my swarm creations soon at my new home in Abbots for a small fee. Since the code is open-source, I will also allow full copy/mod/transfer perms to purchasers.// END //

