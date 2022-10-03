param([string] $msg)

if ($msg -eq "") {
    Write-Error "commit message is required."
}
else {
    hugo -D
    git add .
    git commit -m $msg
    git push
    git subtree push --prefix public origin gh-pages
}
