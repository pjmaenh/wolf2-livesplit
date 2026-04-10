/**
 * LiveSplit Autosplitter for Wolfenstein II: The New Colossus
 *
 * Implemented functionality:
 * - Automatically starts timer when loading into wheelchair level (= start of run)
 * - Load Removal during cutscenes
 * - Autosplits between sections 
 * Works on both current patch and the build from 15 November 2017 (currently used in speedruns)
 *
 * GitHub: https://github.com/pjmaenh/wolf2-livesplit
 **/

state("NewColossus_x64vk", "steam - current")
{
    int isLoading : 0x3CBA560;
    string40 mission : 0x3C7CC11;
}

state("NewColossus_x64vk", "steam - 20171115")
{
    int isLoading : 0x3C60560;
    string40 mission : 0x5009A71;
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
            print("[W2SP] Unknown version detected");
            return false;
    } 

}

update
{

} 

start
{
    // Autostart timer when loading in wheelchair level
    // The timer should pause immediately because of loading
    return ( (!old.mission.Contains("c02p0")) && (current.mission.Contains("c02p0")) );
}

split 
{ 	

    // Note: I assume ASL uses lazy evaluation, 
    // if not it would be better to rewrite this to immediately return false when old == current
    return
    (old.mission != current.mission) &&
    (
            (old.mission.Contains("c02p0"))      && (current.mission.Contains("c02p1"))      ||
            (old.mission.Contains("c02p1"))      && (current.mission.Contains("c02p2"))      ||
            (old.mission.Contains("c02p2"))      && (current.mission.Contains("submarine"))  ||
            (old.mission.Contains("submarine"))  && (current.mission.Contains("c03p1"))      ||
            (old.mission.Contains("c03p1"))      && (current.mission.Contains("c03p2"))      ||
            (old.mission.Contains("c03p2"))      && (current.mission.Contains("c03p3"))      ||
            (old.mission.Contains("c03p3"))      && (current.mission.Contains("submarine"))  ||
            (old.mission.Contains("submarine"))  && (current.mission.Contains("c04p2"))      ||
            (old.mission.Contains("c04p2"))      && (current.mission.Contains("submarine"))  ||
            (old.mission.Contains("submarine"))  && (current.mission.Contains("c05p1"))      ||
            (old.mission.Contains("c05p1"))      && (current.mission.Contains("c05p2"))      ||
            (old.mission.Contains("c05p2"))      && (current.mission.Contains("c06p1"))      ||
            (old.mission.Contains("c06p1"))      && (current.mission.Contains("c06p2"))      ||
            (old.mission.Contains("c06p2"))      && (current.mission.Contains("c06p3"))      ||
            (old.mission.Contains("c06p3"))      && (current.mission.Contains("submarine"))  ||
            (old.mission.Contains("submarine"))  && (current.mission.Contains("c07p2"))      ||
            (old.mission.Contains("c07p2"))      && (current.mission.Contains("submarine"))  ||
            (old.mission.Contains("submarine"))  && (current.mission.Contains("c08p1"))      ||
            (old.mission.Contains("c08p1"))      && (current.mission.Contains("c08p2"))      ||
            (old.mission.Contains("c08p2"))      && (current.mission.Contains("c08p3"))      ||
            (old.mission.Contains("c08p3"))      && (current.mission.Contains("c09p1"))      ||
            (old.mission.Contains("c09p1"))      && (current.mission.Contains("c09p2"))      ||
            (old.mission.Contains("c09p2"))      && (current.mission.Contains("submarine"))  ||
            (old.mission.Contains("submarine"))  && (current.mission.Contains("c11p1"))      ||
            (old.mission.Contains("c11p1"))      && (current.mission.Contains("c12p1"))      ||
            (old.mission.Contains("c12p1"))      && (current.mission.Contains("utro"))
    );
}