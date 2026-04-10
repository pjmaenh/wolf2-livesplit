/**
 * LiveSplit Autosplitter for Wolfenstein II: The New Colossus
 *
 * Basic/lightweight version that only does load time removal.
 * Works on both current patch and the build from 15 November 2017 (currently used in speedruns).
 *
 * GitHub: https://github.com/pjmaenh/wolf2-livesplit
 **/

state("NewColossus_x64vk", "steam - current")
{
    int isLoading : 0x3CBA560;
}

state("NewColossus_x64vk", "steam - 20171115")
{
    int isLoading : 0x3C60560;
}

exit
{
    timer.IsGameTimePaused = true;
}

isLoading
{
    return current.isLoading > 0;
}

init
{
    switch (modules.First().ModuleMemorySize) 
    {
        case 91770880: 
            version = "steam - 20171115";
            break;
        case 92188672: 
            version = "steam - current";
            break;
        default:
            print("Unknown version detected");
            return false;
    }
}