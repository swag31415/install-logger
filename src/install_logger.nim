## install_logger

import strutils
import times

const logfile = "Log3.md"

var log = try: readFile(logfile) except: "|Timestamp|Software|\n|-|-|\n"

echo "Enter program name to log it. Leave blank to do something else"
let progname = readLine(stdin)
if progname == "":
  quit(0)
else:
  let entry = "|" & now().format("M/dd/yyyy h:mmtt") & "|" & progname & "|\n"
  if "\n\n" in log:
    log.insert(entry, log.find("\n\n") + 1)
  else: log.add(entry)
  logfile.writeFile(log)