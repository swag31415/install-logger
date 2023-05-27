import datetime

logfile = "Log4.md"

try:
  with open(logfile, "r") as file:
    log = file.read()
except FileNotFoundError:
  log = "|Timestamp|Software|\n|-|-|\n"

print("Enter program name to log it. Leave blank to do something else")
progname = input()

if progname == "":
  quit(0)
else:
  entry = f"|{datetime.datetime.now().strftime('%m/%d/%Y %H:%M%p')}|{progname}|\n"
  if "\n\n" in log:
    index = log.find('\n\n') + 1
    log = f"{log[:index]}{entry}{log[index:]}"
  else:
    log += entry

with open(logfile, "w") as file:
  file.write(log)