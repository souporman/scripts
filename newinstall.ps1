# Get the ID and security principal of the current user account
$myWindowsID=[System.Security.Principal.WindowsIdentity]::GetCurrent()
$myWindowsPrincipal=new-object System.Security.Principal.WindowsPrincipal($myWindowsID)
 
# Get the security principal for the Administrator role
$adminRole=[System.Security.Principal.WindowsBuiltInRole]::Administrator
 
# Check to see if we are currently running "as Administrator"
if ($myWindowsPrincipal.IsInRole($adminRole))
   {
   # We are running "as Administrator" - so change the title and background color to indicate this
   $Host.UI.RawUI.WindowTitle = $myInvocation.MyCommand.Definition + "(Elevated)"
   $Host.UI.RawUI.BackgroundColor = "DarkBlue"
   clear-host
   }
else
   {
   # We are not running "as Administrator" - so relaunch as administrator
   
   # Create a new process object that starts PowerShell
   $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
   
   # Specify the current script path and name as a parameter
   $newProcess.Arguments = $myInvocation.MyCommand.Definition;
   
   # Indicate that the process should be elevated
   $newProcess.Verb = "runas";
   
   # Start the new process
   [System.Diagnostics.Process]::Start($newProcess);
   
   # Exit from the current, unelevated, process
   exit
   }
 
# Run your code that needs to be elevated here
Write-Host -NoNewLine "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#comment or uncomment necessary apps
cinst notepadplusplus -y
cinst googlechrome -y
#cinst flashplayerplugin -y
#cinst adobereader -y
cinst 7zip -y
#cinst javaruntime -y
cinst adoptopenjdk8jre -y
cinst vlc -y
cinst putty.install -y
cinst powershell -y
cinst sysinternals -y
cinst filezilla -y
#cinst pdfcreator -y
cinst paint.net -y
cinst dropbox -y
#cinst teamviewer -y
cinst winscp -y
cinst python3 -y
#cinst wireshark -y
#cinst windirstat -y
cinst wiztree -y
cinst greenshot -y
cinst autohotkey -y
#cinst winmerge -y
cinst evernote -y
cinst autoit -y
#cinst pscx -y
#cinst lastpass -y
#cinst 1password -y
cinst rufus -y
cinst handbrake -y
cinst windbg -y
#cinst vmwarevsphereclient -y
#cinst recuva -y
#cinst rdmfree -y
#cinst rsat -y
#cinst angryip -y
#cinst anaconda3 -y
#cinst openhardwaremonitor -y
cinst steam -y
cinst discord -y
cinst leagueoflegends -y
cinst slack -y
#cinst audacity -y
cinst pia -y
#cinst kodi -y
#cinst radarr -y
#cinst sonarr -y
#cinst sabnzbd -y

#Install PSWindowsUpdate to handle...windows updates.
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force        
install-module -Name PSWindowsUpdate -Repository PSGallery –Force –Verbose

#use that new module you just installed and install updates.  
Install-WindowsUpdate -AcceptAll -RecurseCycle 2 -AutoReboot

