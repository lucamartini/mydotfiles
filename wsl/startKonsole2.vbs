args = "-c" & " -l " & """DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0 LIBGL_ALWAYS_INDIRECT=1 konsole"""
WScript.CreateObject("Shell.Application").ShellExecute "bash", args, "", "open", 0
