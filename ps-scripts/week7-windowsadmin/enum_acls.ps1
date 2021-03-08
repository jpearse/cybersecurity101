foreach ($item in Get-ChildItem) {
    Get-Acl $item
}