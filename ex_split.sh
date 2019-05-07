echo '/efs/estimatesdata/oof_0.txt' | gawk -F: '{
n=split($0,arr,"/")
print "#dbg:n=" n
var=arr[4]
print var
}'
#dbg:n=4
oof_0.txt

