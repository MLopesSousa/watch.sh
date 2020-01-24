for p in $(ps -eo comm,pid |egrep 'moni.*sh' |awk '{print $2}'); do
        TT=$(ps -p $p -o etime |tail -1 |sed 's/ //g');
        M=$(echo $TT |awk -F':' '{print $1}');
        if [ $TT ]; then

                # Se o elapsed time tiver mais que 5 caracters, mais de uma hora
                if [[ $(echo $TT |wc -c) -gt 6 || $M -gt 10 ]]; then
                        kill -9 $p
                fi
        fi
done

