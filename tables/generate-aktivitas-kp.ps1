param(
    [string]$Source = (Join-Path $PSScriptRoot 'Internship Activity Tracker - Main.csv'),
    [string]$Destination = (Join-Path $PSScriptRoot 'aktivitas-kp.tex')
)

function ConvertTo-LatexText([string]$Value) {
    $escaped = [System.Text.StringBuilder]::new()
    foreach ($character in $Value.ToCharArray()) {
        $replacement = switch ([string]$character) {
            '\' { '\textbackslash{}' }
            '&' { '\&' }
            '%' { '\%' }
            '$' { '\$' }
            '#' { '\#' }
            '_' { '\_' }
            '{' { '\{' }
            '}' { '\}' }
            '~' { '\textasciitilde{}' }
            '^' { '\textasciicircum{}' }
            default { [string]$character }
        }
        [void]$escaped.Append($replacement)
    }
    return $escaped.ToString()
}

$startDate = [datetime]::new(2026, 6, 2)
$endDate = [datetime]::new(2026, 7, 14)
$monthNames = @('', 'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember')
$rows = Import-Csv -LiteralPath $Source -Encoding UTF8 | ForEach-Object {
    $date = [datetime]::ParseExact($_.Tanggal, 'M/d/yyyy', [cultureinfo]::InvariantCulture)
    if ($date -ge $startDate -and $date -le $endDate) {
        $activity = $_.Aktivitas
        # CSV menyebut "Libur Imlek" pada 16 Juni; kalender resmi menyebut Tahun Baru Islam.
        if ($date -eq [datetime]::new(2026, 6, 16) -and $activity.Trim() -eq '- Libur Imlek') {
            $activity = '- Libur Tahun Baru Islam 1448 H'
        }
        # Samakan istilah pada tabel laporan tanpa mengubah CSV sumber.
        $activity = $activity -replace '(?i)\bInvoice Item Name Extraction System\b', 'Sistem Ekstraksi Nama Barang Faktur'
        $activity = $activity -replace '(?i)\bInvoice Item Name Extraction\b', 'Ekstraksi Nama Barang Faktur'
        $activity = $activity -replace '(?i)\bnama item dari invoice\b', 'nama barang faktur dari invoice'
        $activity = $activity -replace '(?i)\bitem di invoice\b', 'barang faktur'
        [pscustomobject]@{ Date = $date; Activity = $activity }
    }
} | Sort-Object Date

$lines = [System.Collections.Generic.List[string]]::new()
$lines.Add('% Dibuat dari Internship Activity Tracker - Main.csv; hanya 2 Juni--14 Juli 2026.')
$lines.Add('\begingroup')
$lines.Add('\small')
$lines.Add('\singlespacing')
$lines.Add('\setlength{\tabcolsep}{5pt}')
$lines.Add('\renewcommand{\arraystretch}{1.15}')
$lines.Add('\begin{longtable}{>{\raggedright\arraybackslash}p{2.7cm} >{\raggedright\arraybackslash}p{\dimexpr\textwidth-2.7cm-4\tabcolsep\relax}}')
$lines.Add('    \caption{Aktivitas kerja praktik selama 2 Juni--14 Juli 2026}\label{tab:aktivitas-kp} \\')
$lines.Add('    \toprule')
$lines.Add('    \textbf{Tanggal} & \textbf{Aktivitas} \\')
$lines.Add('    \midrule')
$lines.Add('    \endfirsthead')
$lines.Add('    \multicolumn{2}{c}{\tablename\ \thetable\ (lanjutan)} \\')
$lines.Add('    \toprule')
$lines.Add('    \textbf{Tanggal} & \textbf{Aktivitas} \\')
$lines.Add('    \midrule')
$lines.Add('    \endhead')
$lines.Add('    \midrule')
$lines.Add('    \multicolumn{2}{r}{\textit{Bersambung ke halaman berikutnya}} \\')
$lines.Add('    \endfoot')
$lines.Add('    \bottomrule')
$lines.Add('    \endlastfoot')

foreach ($row in $rows) {
    $dateText = '{0} {1} {2}' -f $row.Date.Day, $monthNames[$row.Date.Month], $row.Date.Year
    $activityLines = @($row.Activity -split '\r?\n' | ForEach-Object { $_.Trim() } | Where-Object { $_ })
    $activityText = if ($activityLines.Count -gt 0) {
        ($activityLines | ForEach-Object { ConvertTo-LatexText $_ }) -join ' \newline '
    } else {
        '--'
    }
    $lines.Add("    $dateText & $activityText \\")
}

$lines.Add('\end{longtable}')
$lines.Add('\endgroup')
[System.IO.File]::WriteAllLines($Destination, $lines, [System.Text.UTF8Encoding]::new($false))
Write-Output "Wrote $($rows.Count) rows to $Destination"
