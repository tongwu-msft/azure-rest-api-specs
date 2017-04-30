$ErrorActionPreference = 'Stop'

$scriptPath = $MyInvocation.MyCommand.Path
$scriptsHome = Split-Path $scriptPath
$restDocsPath = Split-Path $scriptsHome

Push-Location $scriptsHome

$RestSrcPath = Join-Path $restDocsPath "src"
$RestProcessorZip = "RestProcessor.zip"
$RestProcessor = "RestProcessor"
$MappingFilePath = "mapping.json"

# Pre-resolve swagger files by AutoRest
Write-Host "Pre-resolve swagger files by AutoRest"
$mappingFile = Get-Content $restDocsPath\$MappingFilePath -Raw | ConvertFrom-Json
Foreach($reference in $mappingFile.mapping.reference)
{
    if ($reference.source_swagger)
    {
        $swaggerPath = Join-Path $RestSrcPath $reference.source_swagger
        if (Test-Path $swaggerPath)
        {
            autorest -FANCY -g SwaggerResolver -i $swaggerPath -outputFileName $swaggerPath
            Write-Host "Done resolving swagger file by AutoRest" $swaggerPath
        }
    }
}

# Unzip RestProcessorZip to RestProcessor
Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip
{
    param([string]$zipfile, [string]$outpath)
    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}
if (Test-Path $RestProcessor){
    Remove-Item $RestProcessor -recurse -Force
}
Unzip $scriptsHome\$RestProcessorZip $scriptsHome\$RestProcessor

& $RestProcessor\$RestProcessor\$RestProcessor.exe $RestSrcPath $restDocsPath $restDocsPath\$MappingFilePath
if($LASTEXITCODE -ne 0)
{
    Pop-Location
    exit 1
}

# Clean unzipped folder
Remove-Item $RestProcessor -recurse -Force

Pop-Location

