/**
 * LiveSplit Autosplitter for Wolfenstein II: The New Colossus
 *
 * Implemented functionality:
 * - Automatically starts timer when loading into wheelchair level (= start of run)
 * - Load Removal during cutscenes
 * - Autosplits between sections, can be turned on or off in advanced settings
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

startup
{
    settings.Add("map_splits", true, "Automatic splits between maps");
    settings.SetToolTip("map_splits", "Enables automatic splitting on various map changes");

    // Split 1
    settings.Add("c02p0_c02p1", true, "Wheelchair", "map_splits");
    settings.SetToolTip("c02p0_c02p1", "Triggers when talking to Anya at the end of the Wheelchair section"); 
    // Split 2
    settings.Add("c02p1_c02p2", true, "Ausmerzer", "map_splits");
    settings.SetToolTip("c02p1_c02p2", "Triggers at the end of the Ausmerzer mission"); 
    // Split 3
    settings.Add("c02p2_submarine", true, "Section F", "map_splits");
    settings.SetToolTip("c02p2_submarine", "Triggers at the end of Section F");
    // Split 4
    settings.Add("submarine_c03p1", true, "Drone", "map_splits");
    settings.SetToolTip("submarine_c03p1", "Triggers when opening Wyatt's door and going to Manhattan");
    // Split 5
    settings.Add("c03p1_c03p2", true, "Manhattan Intro", "map_splits");
    settings.SetToolTip("c03p1_c03p2", "Triggers when powering up the train in the first part of Manhattan");
    // Split 6
    settings.Add("c03p2_c03p3", true, "Manhattan", "map_splits");
    settings.SetToolTip("c03p2_c03p3", "Triggers when climbing to the penthouse in the second part of Manhattan");
    // Split 7
    settings.Add("c03p3_submarine", true, "Penthouse Fight", "map_splits");
    settings.SetToolTip("c03p3_submarine", "Triggers when jumping onboard the helicopter after the penthouse fight");
    // Split 8
    settings.Add("submarine_c04p2", true, "Submarine", "map_splits");
    settings.SetToolTip("submarine_c04p2", "Triggers when going back to Section F");
    // Split 9
    settings.Add("c04p2_submarine", true, "Warhead", "map_splits");
    settings.SetToolTip("c04p2_submarine", "Triggers when grabbing the warhead");
    // Split 10
    settings.Add("submarine_c05p1", true, "Refuel chopper", "map_splits");
    settings.SetToolTip("submarine_c05p1", "Triggers when talking to grace after refuelling the chopper");
    // Split 11
    settings.Add("c05p1_c05p2", true, "Diner", "map_splits");
    settings.SetToolTip("c05p1_c05p2", "Triggers when closing the diner door");
    // Split 12
    settings.Add("c05p2_c06p1", true, "Escape", "map_splits");
    settings.SetToolTip("c05p2_c06p1", "Triggers when leaving the Oberkommando");
    // Split 13
    settings.Add("c06p1_c06p2", true, "Farmhouse", "map_splits");
    settings.SetToolTip("c06p1_c06p2", "Triggers after killing dad in the farmhouse");
    // Split 14
    settings.Add("c06p2_c06p3", true, "Farmhouse exit", "map_splits");
    settings.SetToolTip("c06p2_c06p3", "Triggers after disconnecting the final claw");
    // Split 15
    settings.Add("c06p3_submarine", true, "Courthouse", "map_splits");
    settings.SetToolTip("c06p3_submarine", "Triggers after getting your head chopped off");
    // Split 16
    settings.Add("submarine_c07p2", true, "A new suit", "map_splits");
    settings.SetToolTip("submarine_c07p2", "Triggers when setting course to Manhattan");
    // Split 17
    settings.Add("c07p2_submarine", true, "Manhattan Bunker", "map_splits");
    settings.SetToolTip("c07p2_submarine", "Triggers when jumping onboard the helicopter");
    // Split 18
    settings.Add("submarine_c08p1", true, "A new suit - end", "map_splits");
    settings.SetToolTip("submarine_c08p1", "Triggers when talking to Grace");
    // Split 19
    settings.Add("c08p1_c08p2", true, "Meet Horton", "map_splits");
    settings.SetToolTip("c08p1_c08p2", "Triggers when introducing yourself to Horton");
    // Split 20
    settings.Add("c08p2_c08p3", true, "Dog Ride", "map_splits");
    settings.SetToolTip("c08p2_c08p3", "Triggers when exiting through the door");
    // Split 21
    settings.Add("c08p3_c09p1", true, "Rooftop", "map_splits");
    settings.SetToolTip("c08p3_c09p1", "Triggers when boarding Evas Hammer");
    // Split 22
    settings.Add("c09p1_c09p2", true, "Venus Casting", "map_splits");
    settings.SetToolTip("c09p1_c09p2", "Triggers when entering the surface transport pod");
    // Split 23
    settings.Add("c09p2_submarine", true, "Venus Oberkommando", "map_splits");
    settings.SetToolTip("c09p2_submarine", "Triggers when retrieving the ODIN codes");
    // Split 24
    settings.Add("submarine_c11p1", true, "Lost At Sea", "map_splits");
    settings.SetToolTip("submarine_c11p1", "Triggers when opening the door to Wyatt");
    // Split 25
    settings.Add("c11p1_c12p1", true, "Ausmerzer", "map_splits");
    settings.SetToolTip("c11p1_c12p1", "Triggers when opening the ODIN Main Control Center");
    // Split 26
    settings.Add("c12p1_utro", true, "Epilogue", "map_splits");
    settings.SetToolTip("c12p1_utro", "Triggers when you give the axe to Engel and end it");
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

    if (settings["map_splits"] && old.mission != current.mission)
    {
        return
        (
                (settings["c02p0_c02p1"])       && (old.mission.Contains("c02p0"))      && (current.mission.Contains("c02p1"))      ||
                (settings["c02p1_c02p2"])       && (old.mission.Contains("c02p1"))      && (current.mission.Contains("c02p2"))      ||
                (settings["c02p2_submarine"])   && (old.mission.Contains("c02p2"))      && (current.mission.Contains("submarine"))  ||
                (settings["submarine_c03p1"])   && (old.mission.Contains("submarine"))  && (current.mission.Contains("c03p1"))      ||
                (settings["c03p1_c03p2"])       && (old.mission.Contains("c03p1"))      && (current.mission.Contains("c03p2"))      ||
                (settings["c03p2_c03p3"])       && (old.mission.Contains("c03p2"))      && (current.mission.Contains("c03p3"))      ||
                (settings["c03p3_submarine"])   && (old.mission.Contains("c03p3"))      && (current.mission.Contains("submarine"))  ||
                (settings["submarine_c04p2"])   && (old.mission.Contains("submarine"))  && (current.mission.Contains("c04p2"))      ||
                (settings["c04p2_submarine"])   && (old.mission.Contains("c04p2"))      && (current.mission.Contains("submarine"))  ||
                (settings["submarine_c05p1"])   && (old.mission.Contains("submarine"))  && (current.mission.Contains("c05p1"))      ||
                (settings["c05p1_c05p2"])       && (old.mission.Contains("c05p1"))      && (current.mission.Contains("c05p2"))      ||
                (settings["c05p2_c06p1"])       && (old.mission.Contains("c05p2"))      && (current.mission.Contains("c06p1"))      ||
                (settings["c06p1_c06p2"])       && (old.mission.Contains("c06p1"))      && (current.mission.Contains("c06p2"))      ||
                (settings["c06p2_c06p3"])       && (old.mission.Contains("c06p2"))      && (current.mission.Contains("c06p3"))      ||
                (settings["c06p3_submarine"])   && (old.mission.Contains("c06p3"))      && (current.mission.Contains("submarine"))  ||
                (settings["submarine_c07p2"])   && (old.mission.Contains("submarine"))  && (current.mission.Contains("c07p2"))      ||
                (settings["c07p2_submarine"])   && (old.mission.Contains("c07p2"))      && (current.mission.Contains("submarine"))  ||
                (settings["submarine_c08p1"])   && (old.mission.Contains("submarine"))  && (current.mission.Contains("c08p1"))      ||
                (settings["c08p1_c08p2"])       && (old.mission.Contains("c08p1"))      && (current.mission.Contains("c08p2"))      ||
                (settings["c08p2_c08p3"])       && (old.mission.Contains("c08p2"))      && (current.mission.Contains("c08p3"))      ||
                (settings["c08p3_c09p1"])       && (old.mission.Contains("c08p3"))      && (current.mission.Contains("c09p1"))      ||
                (settings["c09p1_c09p2"])       && (old.mission.Contains("c09p1"))      && (current.mission.Contains("c09p2"))      ||
                (settings["c09p2_submarine"])   && (old.mission.Contains("c09p2"))      && (current.mission.Contains("submarine"))  ||
                (settings["submarine_c11p1"])   && (old.mission.Contains("submarine"))  && (current.mission.Contains("c11p1"))      ||
                (settings["c11p1_c12p1"])       && (old.mission.Contains("c11p1"))      && (current.mission.Contains("c12p1"))      ||
                (settings["c12p1_utro"])        && (old.mission.Contains("c12p1"))      && (current.mission.Contains("utro"))
        );
    }
}