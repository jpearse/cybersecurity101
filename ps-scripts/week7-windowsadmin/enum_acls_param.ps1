#Rather than navigate to the specific directory, this script allows for it to be input

param(
    $checkdir = $( Get-Location )
)

foreach ($item in Get-ChildItem $checkdir) {
    Get-Acl $checkdir/$item
}