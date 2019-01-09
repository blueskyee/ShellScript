#指定一個比較大的硬碟當 temp dir
export TMPDIR=/spark-tmp0

##取出重複
cat test.txt | sort | uniq -d

##去除重複
cat test.txt | sort | uniq
