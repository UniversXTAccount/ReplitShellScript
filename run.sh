clear
cd /home/runner/*/

if [[ $1 == compile ]]; then
  if [[ $2 == all ]]; then
    for afile in *.java; do
      if [[ ! -f $afile ]]; then break; fi
      sourcedate=$(date -r $afile +%s)
      if [[ -f ${afile%.java}.class ]]; then
        classdate=$(date -r ${afile%.java}.class +%s)
      else
        classdate=0
      fi
      if [[ ! -f ${afile%.java}.class || $3 == force || sourcedate -ge classdate ]]; then
        javac -classpath .:target/dependency/* -d . $afile
      fi
    done
  elif [[ -f $2 && ${2##*.} == java ]]; then
    sourcedate=$(date -r $2 +%s)
    if [[ -f ${2%.java}.class ]]; then
      classdate=$(date -r ${2%.java}.class +%s)
    else
      classdate=0
    fi
    if [[ ! -f ${2%.java}.class || $3 == force || sourcedate -ge classdate ]]; then
      javac -classpath .:target/dependency/* -d . $2
    fi
  fi
elif [[ $1 == run ]]; then
  if [[ -f $2 && ${2##*.} == class ]]; then 
    java -classpath .:target/dependency/* ${2%.class}
  elif [[ -f $2 && ${2##*.} == java ]]; then
    sourcedate=$(date -r $2 +%s)
    if [[ -f ${2%.java}.class ]]; then
      classdate=$(date -r ${2%.java}.class +%s)
    else
      classdate=0
    fi
    if [[ ! -f ${2%.java}.class || $3 == force || sourcedate -ge classdate ]]; then
      javac -classpath .:target/dependency/* -d . $2
      java -classpath .:target/dependency/* ${2%.java}
    else
      java -classpath .:target/dependency/* ${2%.java}
    fi
  fi
fi

exit 0










# clear
# cd /home/runner/*/
# echo -e "\e[1;38;2;248;100;10m⠕ \e[1;38;2;244;249;252mreplit\e[0m\n"

# javac -classpath .:target/dependency/* -d . $(find . -type f -name '*.java')
# if [[ "$1" == "all" ]]; then
#   javac -classpath .:target/dependency/* -d . $(find . -type f -name '*.java')
#   # java -classpath .:target/dependency/* Extra
# elif [[ "$1" == "all" ]]; then
#   javac -classpath .:target/dependency/* -d . $(find . -type f -name '*.java')
#   javac
# else
#   java -classpath .:target/dependency/* Main
#   # java Main.java
# fi

# if [[ $1 == compile ]]; then
  # echo "compile"
  # if [[ $2 == all ]]; then
    # for afile in 
    # echo "all"
    # javac -classpath .:target/dependency/* -d . $(find . -type f -name '*.java')
  # elif [[ -f $2 && ${2##*.} == java ]]; then
    # echo "$2"
    # javac -classpath .:target/dependency/* -d . $2
  # fi
  # # java -classpath .:target/dependency/* Extra 
# elif [[ $1 == run ]]; then
  # echo "run"
  # if [[ ! -f $2 || ! ${2##*.} == class ]]; then exit; fi
  # echo "$2"
  # java -classpath .:target/dependency/* ${2%.class}
# fi


# clear
# cd /home/runner/*/

# if [[ $1 == compile ]]; then
  # echo "compile"
  # if [[ $2 == all ]]; then
    # for afile in *.java; do
      # echo "$afile || Start"
      # if [[ ! -f $afile ]]; then break; fi
      # sourcedate=$(date -r $afile +%s)
      # if [[ -f ${afile%.java}.class ]]; then
        # classdate=$(date -r ${afile%.java}.class +%s)
      # else
        # classdate=0
      # fi
      # if [[ ! -f ${afile%.java}.class || $3 == force || sourcedate -ge classdate ]]; then
        # echo "$afile || Compile"
        # javac -classpath .:target/dependency/* -d . $afile
      # fi
    # done
    # # echo "all"
    # # javac -classpath .:target/dependency/* -d . $(find . -type f -name '*.java')
  # elif [[ -f $2 && ${2##*.} == java ]]; then
    # sourcedate=$(date -r $2 +%s) || 10
    # classdate=$(date -r ${2%.java}.class +%s) || 0
    # if [[ ! -f ${2%.java}.class || $3 == force || sourcedate -ge classdate ]]; then
      # echo "$2"
      # javac -classpath .:target/dependency/* -d . $2
    # fi
  # fi
  # # java -classpath .:target/dependency/* Extra 
# elif [[ $1 == run ]]; then
  # echo "run"
  # if [[ ! -f $2 || ! ${2##*.} == class ]]; then exit; fi
  # echo "$2"
  # java -classpath .:target/dependency/* ${2%.class}
# fi