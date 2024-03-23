#!/bin/bash

# Embed the binary in the script using uuencode
uuencode joker joker_embed > my_script.sh

# Add the command to extract the binary and execute it
echo "#!/bin/bash" > my_script.sh
echo ". /joker_embed" >> my_script.sh
echo "./joker_embed my_payload.joker" >> my_script.sh

# Add the actual payload to the script
echo "
(def myreturn (joker.http/send {:url \"https://showmyip.com/simple\"}))
(def html (re-find #\"<h1>.+<\/h1>\" (get myreturn :body)))
(println
  (str \"Your public IP: \"
       (joker.string/replace html #\"(<h1>|<\/h1>)\" \"\")
  )
)" > my_payload.joker

# Make the script executable
chmod +x my_script.sh

# Run the script
./my_script.sh

# Clean up
rm -f joker_embed my_script.sh my_payload.joker