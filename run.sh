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
        javac -classpath .:target/dependency/* -d . $afile || exit 1
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
      javac -classpath .:target/dependency/* -d . $2 || exit 1
    fi
  fi
elif [[ $1 == run ]]; then
  if [[ -f $2 && ${2##*.} == class ]]; then 
    java -classpath .:target/dependency/* ${2%.class} || exit 1
  elif [[ -f $2 && ${2##*.} == java ]]; then
    sourcedate=$(date -r $2 +%s)
    if [[ -f ${2%.java}.class ]]; then
      classdate=$(date -r ${2%.java}.class +%s)
    else
      classdate=0
    fi
    if [[ ! -f ${2%.java}.class || $3 == force || sourcedate -ge classdate ]]; then
      javac -classpath .:target/dependency/* -d . $2 || exit 1
      java -classpath .:target/dependency/* ${2%.java} || exit 1
    else
      java -classpath .:target/dependency/* ${2%.java} || exit 1
    fi
  fi
fi

exit 0
