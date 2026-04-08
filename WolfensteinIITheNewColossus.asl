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