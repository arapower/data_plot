#!/bin/sh

max=8600
separate=100
data='/tmp/tmp.APxLjO5B12'

cat "$data" |

awk -v max="$max" -v separate="$separate" 'BEGIN{
	for(i =0; i <= int(max / separate); i++){
		count[i] = 0;
	}
}
{
	rank = int($NF / separate);
	count[rank]++;
}
END{
	for(i in count){
		bar = "";
		for(j = 0; j <= count[i]; j++){
			bar = bar "*";
		}
		print i * 100, bar;
	}
}' |
sort -k 1n,1
