#this script will move files from a source folder to a destination folder and then ask the user if they would like to see the contents of the destination folder

#clears the screen
Clear-Host
#variables which will be used in the function
$source = Read-Host "Specify an absolute source folder location"
$destination = read-host "Specifiy an absolute destination folder location"

#creates a function called Move-Files 
function Move-Files 
{
  #gets a list of all items in the source folder
  $files = Get-ChildItem $source

  #goes through each item and moves it to the destination folder
  foreach ($file in $files) {
    Move-Item -Path $file.FullName -Destination $destination
  }
}

#calls the function
Move-Files

#outputs that the process of moving files is complete
Write-Host "Process complete"

#outputs to user if they would now like to see the contents of the destination folder
Write-Host "Would you like to see the contents of the destination folder?"
Write-Host "a) Yes"
Write-Host "b) No"
#asks for user input
$ans = Read-Host "Type a, or b"
#if statement using user input
if ($ans -eq "a")
{
    #gets contents of the destination folder
    Get-ChildItem -path $destination
}
else {
    #otherwise says have a good day
    write-host "Have a good day!"
}