## install_logger

import strutils
import times

const logfile = "Log3.md"

var log = try: readFile(logfile) except: "|Timestamp|Software|\n|-|-|\n"

echo "Enter program name to log it. Leave blank to do something else"
let filename = readLine(stdin)
if filename == "":
  quit(0)
else:
  let entry = "|" & now().format("M/dd/yyyy h:mmtt") & "|" & filename & "|\n"
  logfile.writeFile(
    if "\n\n" in log: log.replace("\n\n", "\n" & entry & "\n")
    else: log & entry
  )