// This script will rotate a moon very slowly

default
{
    state_entry()
    {
        llTargetOmega(<.5,0.0,0.0>*llGetRot(),0.1,0.01);
    }    
}
