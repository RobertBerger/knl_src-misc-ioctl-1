# ELDK/Yocto sets up some funny Python stuff, 
# which keeps my test cases from running
# This is a work around which seems to work
(
source ../../../env.sh

echo "echo \"+ ./test_1.py $BOARDIP"\" > test.sh
echo "./test_1.py $BOARDIP" >> test.sh
chmod +x test.sh
)
./test.sh
rm -f test.sh
