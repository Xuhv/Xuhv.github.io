param([string] $msg)

if ($msg -eq "") {
    Write-Error "commit message is required."
}
else {
    hugo -D
    git add .
    git commit -m $msg
    proxychains4 git push
}
