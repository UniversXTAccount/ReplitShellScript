clear
cd /home/runner/*/

function compile() {
  if [[ $1 == all ]]; then
    for afile in *.java; do
      if [[ ! -f $afile ]]; then break; fi
      sourcedate=$(date -r $afile +%s)
      if [[ -f ${afile%.java}.class ]]; then
        classdate=$(date -r ${afile%.java}.class +%s)
      else
        classdate=0
      fi
      if [[ ! -f ${afile%.java}.class || $2 == force || sourcedate -ge classdate ]]; then
        javac -classpath .:target/dependency/* -d . $afile || exit 1
      fi
    done
  elif [[ -f $1 && ${1##*.} == java ]]; then
    sourcedate=$(date -r $1 +%s)
    if [[ -f ${1%.java}.class ]]; then
      classdate=$(date -r ${1%.java}.class +%s)
    else
      classdate=0
    fi
    if [[ ! -f ${1%.java}.class || $2 == force || sourcedate -ge classdate ]]; then
      javac -classpath .:target/dependency/* -d . $1 || exit 1
    fi
  fi
}

function run() {
  if [[ -f $1 && ${1##*.} == class ]]; then 
    java -classpath .:target/dependency/* ${1%.class} || exit 1
  elif [[ -f $1 && ${1##*.} == java ]]; then
    compile $1 $2 || exit 1
    java -classpath .:target/dependency/* ${1%.java} || exit 1
  fi
}


if [[ $1 == compile ]]; then
  compile $2 $3 || exit 1
elif [[ $1 == run ]]; then
  run $2 $3 || exit 1
fi

exit 0
