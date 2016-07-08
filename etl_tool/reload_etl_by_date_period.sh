for (( i=52; i>0; i=i-1 ))
do
        date=`date +%Y-%m-%d --date="-${i} day"`
        #w=$(($i+7))
        #w_date=`date +%Y-%m-%d --date="-${w} day"`
        echo "date: ${date}"
        #echo "w_date: ${w_date}"
done
