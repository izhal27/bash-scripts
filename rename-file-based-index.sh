#!/bin/bash

read -p "> Masukkan ekstensi yang akan di ubah (contoh: txt, avi, tanpa tanda titik): " ext

success=false
count=`ls -1 *.$ext 2>/dev/null | wc -l`

if [ $count == 0 ]
then
    echo "> File dengan ekstensi .$ext tidak ditemukan."
else
    files=(*."$ext")
    i=1
    
    echo ">"
    echo "> Memprosses file..."
    echo ">"

    for f in "${files[@]}"; do
        newFile="$i.$ext"
        
        if test -f $newFile
        then
            echo "> File $newFile sudah ada."
        else
            success=true
            echo "> Mengubah file $f ke $i.$ext"
            mv -f "$f" "$i.$ext"
            echo "> $i.$ext"
        fi
        
        i=$(( i + 1 ))
    done
    
    echo ">"    
    status="Tidak ada file yang berhasil diubah."
    if $success
    then
        status="Semua file berhasil diubah."
    fi
    
    echo "> $status"
fi
