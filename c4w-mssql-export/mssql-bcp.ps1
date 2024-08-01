# Set the database details
$server = "localhost"
$database = "THCC_C4W_Microsite"

# Get all tables in the specified schema
$query = "SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_TYPE = 'BASE TABLE' AND TABLE_NAME NOT LIKE 'Audit_%'"
$tables = Invoke-Sqlcmd -ServerInstance $server -Database $database -Query $query

# Loop through each table and export data using bcp
foreach ($table in $tables) {
    $tableName = $table.TABLE_NAME
    $outputFile = "$tableName.csv"
    
    # Construct the bcp command
    $bcpCommand = "bcp ""SELECT * FROM $database.dbo.$tableName"" queryout $outputFile -c -t `"`t`" -T -S $server -d $database -C 65001 -k"
    
    # Execute the bcp command
    Write-Host "Exporting data from $tableName..."
    Invoke-Expression $bcpCommand
}