# Add build directory
mkdir build
cd .\build\

# Download and hugo nodejs
Invoke-WebRequest https://nodejs.org/dist/v12.18.2/node-v12.18.2-win-x64.zip -OutFile nodejs.zip
Expand-Archive .\nodejs.zip
rm nodejs.zip

# Download and unzip hugo
Invoke-WebRequest https://github.com/gohugoio/hugo/releases/download/v0.74.2/hugo_extended_0.74.2_Windows-64bit.zip -OutFile hugo.zip
Expand-Archive .\hugo.zip
rm hugo.zip

cd ..

# Run npm install
.\build\nodejs\node-v12.18.2-win-x64\npm install

# Installation finished
Write-Host -NoNewLine 'Installation finished. Press any key to continue...';
$Host.UI.RawUI.ReadKey("NoEcho, IncludeKeyDown")
exit